
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	f14020f3          	csrr	ra,mhartid
       4:	80004217          	auipc	tp,0x80004
       8:	ffb20213          	add	tp,tp,-5 # 80003fff <__crt0_ram_last>
       c:	ff027113          	and	sp,tp,-16
      10:	80000197          	auipc	gp,0x80000
      14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer>
      18:	6289                	lui	t0,0x2
      1a:	80028293          	add	t0,t0,-2048 # 1800 <core_init_matrix+0x26>
      1e:	30029073          	csrw	mstatus,t0
      22:	00000317          	auipc	t1,0x0
      26:	13630313          	add	t1,t1,310 # 158 <__crt0_trap>
      2a:	30531073          	csrw	mtvec,t1
      2e:	30401073          	csrw	mie,zero
      32:	0000a397          	auipc	t2,0xa
      36:	60638393          	add	t2,t2,1542 # a638 <__crt0_copy_data_src_begin>
      3a:	80000417          	auipc	s0,0x80000
      3e:	fc640413          	add	s0,s0,-58 # 80000000 <__malloc_av_>
      42:	80000497          	auipc	s1,0x80000
      46:	52648493          	add	s1,s1,1318 # 80000568 <num_hpm_cnts_global>
      4a:	80000517          	auipc	a0,0x80000
      4e:	51e50513          	add	a0,a0,1310 # 80000568 <num_hpm_cnts_global>
      52:	80000597          	auipc	a1,0x80000
      56:	72e58593          	add	a1,a1,1838 # 80000780 <__crt0_bss_end>
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
      a0:	00872103          	lw	sp,8(a4) # fff44008 <__crt0_ram_last+0x7ff40009>
      a4:	4750                	lw	a2,12(a4)
      a6:	fff40737          	lui	a4,0xfff40
      aa:	00072223          	sw	zero,4(a4) # fff40004 <__crt0_ram_last+0x7ff3c005>
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
      d0:	00009417          	auipc	s0,0x9
      d4:	5a440413          	add	s0,s0,1444 # 9674 <__fini_array_end>
      d8:	00009497          	auipc	s1,0x9
      dc:	59c48493          	add	s1,s1,1436 # 9674 <__fini_array_end>

000000e0 <__crt0_constructors>:
      e0:	00945863          	bge	s0,s1,f0 <__crt0_constructors_end>
      e4:	00042083          	lw	ra,0(s0)
      e8:	000080e7          	jalr	ra
      ec:	0411                	add	s0,s0,4
      ee:	bfcd                	j	e0 <__crt0_constructors>

000000f0 <__crt0_constructors_end>:
      f0:	00000617          	auipc	a2,0x0
      f4:	7b660613          	add	a2,a2,1974 # 8a6 <main>

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
     12e:	00009417          	auipc	s0,0x9
     132:	54640413          	add	s0,s0,1350 # 9674 <__fini_array_end>
     136:	00009497          	auipc	s1,0x9
     13a:	53e48493          	add	s1,s1,1342 # 9674 <__fini_array_end>

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

0000018a <cmp_complex>:

        Can be used by mergesort.
*/
ee_s32
cmp_complex(list_data *a, list_data *b, core_results *res)
{
     18a:	1101                	add	sp,sp,-32
     18c:	ca26                	sw	s1,20(sp)
    ee_s16 data = *pdata;
     18e:	00051483          	lh	s1,0(a0)
{
     192:	cc22                	sw	s0,24(sp)
     194:	c84a                	sw	s2,16(sp)
          & 1;  /* bit 7 indicates if the function result has been cached */
     196:	4074d793          	sra	a5,s1,0x7
{
     19a:	c452                	sw	s4,8(sp)
     19c:	ce06                	sw	ra,28(sp)
     19e:	c64e                	sw	s3,12(sp)
    if (optype) /* if cached, use cache */
     1a0:	8b85                	and	a5,a5,1
{
     1a2:	892e                	mv	s2,a1
     1a4:	8432                	mv	s0,a2
        return (data & 0x007f);
     1a6:	07f4fa13          	and	s4,s1,127
    if (optype) /* if cached, use cache */
     1aa:	e7bd                	bnez	a5,218 <cmp_complex+0x8e>
               & 0xf);       /* bits 3-6 is specific data for the operation */
     1ac:	4034d713          	sra	a4,s1,0x3
        ee_s16 dtype
     1b0:	8b3d                	and	a4,a4,15
     1b2:	00471693          	sll	a3,a4,0x4
     1b6:	00d705b3          	add	a1,a4,a3
        ee_s16 flag = data & 0x7; /* bits 0-2 is type of function to perform */
     1ba:	0074f613          	and	a2,s1,7
                retval = core_bench_state(res->size,
     1be:	03845783          	lhu	a5,56(s0)
     1c2:	89aa                	mv	s3,a0
        dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
     1c4:	872e                	mv	a4,a1
        switch (flag)
     1c6:	10060863          	beqz	a2,2d6 <cmp_complex+0x14c>
        res->crc = crcu16(retval, res->crc);
     1ca:	01049513          	sll	a0,s1,0x10
        switch (flag)
     1ce:	4685                	li	a3,1
        res->crc = crcu16(retval, res->crc);
     1d0:	8141                	srl	a0,a0,0x10
                retval = data;
     1d2:	8a26                	mv	s4,s1
        switch (flag)
     1d4:	02d61363          	bne	a2,a3,1fa <cmp_complex+0x70>
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     1d8:	863e                	mv	a2,a5
     1da:	02840513          	add	a0,s0,40
     1de:	352020ef          	jal	2530 <core_bench_matrix>
                if (res->crcmatrix == 0)
     1e2:	03c45783          	lhu	a5,60(s0)
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     1e6:	01051a13          	sll	s4,a0,0x10
     1ea:	410a5a13          	sra	s4,s4,0x10
                if (res->crcmatrix == 0)
     1ee:	10079e63          	bnez	a5,30a <cmp_complex+0x180>
                    res->crcmatrix = retval;
     1f2:	03845783          	lhu	a5,56(s0)
     1f6:	02a41e23          	sh	a0,60(s0)
        res->crc = crcu16(retval, res->crc);
     1fa:	85be                	mv	a1,a5
        retval &= 0x007f;
     1fc:	07fa7a13          	and	s4,s4,127
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     200:	f004f493          	and	s1,s1,-256
        res->crc = crcu16(retval, res->crc);
     204:	3fb020ef          	jal	2dfe <crcu16>
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     208:	009a64b3          	or	s1,s4,s1
        res->crc = crcu16(retval, res->crc);
     20c:	02a41c23          	sh	a0,56(s0)
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     210:	0804e493          	or	s1,s1,128
     214:	00999023          	sh	s1,0(s3)
    ee_s16 data = *pdata;
     218:	00091483          	lh	s1,0(s2)
          & 1;  /* bit 7 indicates if the function result has been cached */
     21c:	4074d793          	sra	a5,s1,0x7
    if (optype) /* if cached, use cache */
     220:	8b85                	and	a5,a5,1
        return (data & 0x007f);
     222:	07f4f993          	and	s3,s1,127
    if (optype) /* if cached, use cache */
     226:	e7a5                	bnez	a5,28e <cmp_complex+0x104>
               & 0xf);       /* bits 3-6 is specific data for the operation */
     228:	4034d713          	sra	a4,s1,0x3
        ee_s16 dtype
     22c:	8b3d                	and	a4,a4,15
     22e:	00471693          	sll	a3,a4,0x4
     232:	00d705b3          	add	a1,a4,a3
        ee_s16 flag = data & 0x7; /* bits 0-2 is type of function to perform */
     236:	0074f613          	and	a2,s1,7
                retval = core_bench_state(res->size,
     23a:	03845783          	lhu	a5,56(s0)
        dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
     23e:	872e                	mv	a4,a1
        switch (flag)
     240:	c22d                	beqz	a2,2a2 <cmp_complex+0x118>
        res->crc = crcu16(retval, res->crc);
     242:	01049513          	sll	a0,s1,0x10
        switch (flag)
     246:	4685                	li	a3,1
        res->crc = crcu16(retval, res->crc);
     248:	8141                	srl	a0,a0,0x10
                retval = data;
     24a:	89a6                	mv	s3,s1
        switch (flag)
     24c:	02d61263          	bne	a2,a3,270 <cmp_complex+0xe6>
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     250:	863e                	mv	a2,a5
     252:	02840513          	add	a0,s0,40
     256:	2da020ef          	jal	2530 <core_bench_matrix>
                if (res->crcmatrix == 0)
     25a:	03c45783          	lhu	a5,60(s0)
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     25e:	01051993          	sll	s3,a0,0x10
     262:	4109d993          	sra	s3,s3,0x10
                if (res->crcmatrix == 0)
     266:	e7cd                	bnez	a5,310 <cmp_complex+0x186>
                    res->crcmatrix = retval;
     268:	03845783          	lhu	a5,56(s0)
     26c:	02a41e23          	sh	a0,60(s0)
        res->crc = crcu16(retval, res->crc);
     270:	85be                	mv	a1,a5
        retval &= 0x007f;
     272:	07f9f993          	and	s3,s3,127
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     276:	f004f493          	and	s1,s1,-256
        res->crc = crcu16(retval, res->crc);
     27a:	385020ef          	jal	2dfe <crcu16>
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     27e:	0099e4b3          	or	s1,s3,s1
        res->crc = crcu16(retval, res->crc);
     282:	02a41c23          	sh	a0,56(s0)
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     286:	0804e493          	or	s1,s1,128
     28a:	00991023          	sh	s1,0(s2)
    ee_s16 val1 = calc_func(&(a->data16), res);
    ee_s16 val2 = calc_func(&(b->data16), res);
    return val1 - val2;
}
     28e:	40f2                	lw	ra,28(sp)
     290:	4462                	lw	s0,24(sp)
     292:	413a0533          	sub	a0,s4,s3
     296:	44d2                	lw	s1,20(sp)
     298:	4942                	lw	s2,16(sp)
     29a:	49b2                	lw	s3,12(sp)
     29c:	4a22                	lw	s4,8(sp)
     29e:	6105                	add	sp,sp,32
     2a0:	8082                	ret
                if (dtype < 0x22) /* set min period for bit corruption */
     2a2:	02100693          	li	a3,33
     2a6:	00b6e463          	bltu	a3,a1,2ae <cmp_complex+0x124>
                    dtype = 0x22;
     2aa:	02200713          	li	a4,34
                retval = core_bench_state(res->size,
     2ae:	00241683          	lh	a3,2(s0)
     2b2:	00041603          	lh	a2,0(s0)
     2b6:	484c                	lw	a1,20(s0)
     2b8:	4c08                	lw	a0,24(s0)
     2ba:	17d020ef          	jal	2c36 <core_bench_state>
                if (res->crcstate == 0)
     2be:	03e45783          	lhu	a5,62(s0)
                retval = core_bench_state(res->size,
     2c2:	01051993          	sll	s3,a0,0x10
     2c6:	4109d993          	sra	s3,s3,0x10
                if (res->crcstate == 0)
     2ca:	e3b9                	bnez	a5,310 <cmp_complex+0x186>
                    res->crcstate = retval;
     2cc:	03845783          	lhu	a5,56(s0)
     2d0:	02a41f23          	sh	a0,62(s0)
     2d4:	bf71                	j	270 <cmp_complex+0xe6>
                if (dtype < 0x22) /* set min period for bit corruption */
     2d6:	02100693          	li	a3,33
     2da:	00b6e463          	bltu	a3,a1,2e2 <cmp_complex+0x158>
                    dtype = 0x22;
     2de:	02200713          	li	a4,34
                retval = core_bench_state(res->size,
     2e2:	00241683          	lh	a3,2(s0)
     2e6:	00041603          	lh	a2,0(s0)
     2ea:	484c                	lw	a1,20(s0)
     2ec:	4c08                	lw	a0,24(s0)
     2ee:	149020ef          	jal	2c36 <core_bench_state>
                if (res->crcstate == 0)
     2f2:	03e45783          	lhu	a5,62(s0)
                retval = core_bench_state(res->size,
     2f6:	01051a13          	sll	s4,a0,0x10
     2fa:	410a5a13          	sra	s4,s4,0x10
                if (res->crcstate == 0)
     2fe:	e791                	bnez	a5,30a <cmp_complex+0x180>
                    res->crcstate = retval;
     300:	03845783          	lhu	a5,56(s0)
     304:	02a41f23          	sh	a0,62(s0)
     308:	bdcd                	j	1fa <cmp_complex+0x70>
     30a:	03845783          	lhu	a5,56(s0)
     30e:	b5f5                	j	1fa <cmp_complex+0x70>
     310:	03845783          	lhu	a5,56(s0)
     314:	bfb1                	j	270 <cmp_complex+0xe6>

00000316 <core_bench_list>:
core_bench_list(core_results *res, ee_s16 finder_idx)
{
    ee_u16     retval = 0;
    ee_u16     found = 0, missed = 0;
    list_head *list     = res->list;
    ee_s16     find_num = res->seed3;
     316:	00451883          	lh	a7,4(a0)
{
     31a:	7139                	add	sp,sp,-64
     31c:	dc22                	sw	s0,56(sp)
     31e:	d05a                	sw	s6,32(sp)
     320:	de06                	sw	ra,60(sp)
     322:	da26                	sw	s1,52(sp)
     324:	d84a                	sw	s2,48(sp)
     326:	d64e                	sw	s3,44(sp)
     328:	d452                	sw	s4,40(sp)
     32a:	d256                	sw	s5,36(sp)
     32c:	ce5e                	sw	s7,28(sp)
     32e:	cc62                	sw	s8,24(sp)
     330:	ca66                	sw	s9,20(sp)
     332:	c86a                	sw	s10,16(sp)
     334:	c66e                	sw	s11,12(sp)
    list_head *list     = res->list;
     336:	5140                	lw	s0,36(a0)
{
     338:	8b2a                	mv	s6,a0
     33a:	852e                	mv	a0,a1
    ee_s16     i;

    info.idx = finder_idx;
    /* find <find_num> values in the list, and change the list each time
     * (reverse and cache if value found) */
    for (i = 0; i < find_num; i++)
     33c:	2f105963          	blez	a7,62e <core_bench_list+0x318>
    info.idx = finder_idx;
     340:	8bae                	mv	s7,a1
    for (i = 0; i < find_num; i++)
     342:	4601                	li	a2,0
    ee_u16     found = 0, missed = 0;
     344:	4801                	li	a6,0
     346:	4581                	li	a1,0
    ee_u16     retval = 0;
     348:	4481                	li	s1,0
    {
        info.data16 = (i & 0xff);
     34a:	0ff67c93          	zext.b	s9,a2
        Found item, or NULL if not found.
*/
list_head *
core_list_find(list_head *list, list_data *info)
{
    if (info->idx >= 0)
     34e:	1c0bc563          	bltz	s7,518 <core_bench_list+0x202>
    {
        while (list && (list->info->idx != info->idx))
     352:	2e040263          	beqz	s0,636 <core_bench_list+0x320>
     356:	87a2                	mv	a5,s0
     358:	a019                	j	35e <core_bench_list+0x48>
            list = list->next;
     35a:	439c                	lw	a5,0(a5)
        while (list && (list->info->idx != info->idx))
     35c:	c791                	beqz	a5,368 <core_bench_list+0x52>
     35e:	43d8                	lw	a4,4(a5)
     360:	00271703          	lh	a4,2(a4)
     364:	ff771be3          	bne	a4,s7,35a <core_bench_list+0x44>
        return list;
    }
    else
    {
        while (list && ((list->info->data16 & 0xff) != info->data16))
     368:	4681                	li	a3,0
     36a:	a011                	j	36e <core_bench_list+0x58>
     36c:	843a                	mv	s0,a4
core_list_reverse(list_head *list)
{
    list_head *next = NULL, *tmp;
    while (list)
    {
        tmp        = list->next;
     36e:	4018                	lw	a4,0(s0)
        list->next = next;
     370:	c014                	sw	a3,0(s0)
    while (list)
     372:	86a2                	mv	a3,s0
     374:	ff65                	bnez	a4,36c <core_bench_list+0x56>
        if (this_find == NULL)
     376:	1a078e63          	beqz	a5,532 <core_bench_list+0x21c>
            if (this_find->info->data16 & 0x1) /* use found value */
     37a:	43d8                	lw	a4,4(a5)
     37c:	00071703          	lh	a4,0(a4)
     380:	00177693          	and	a3,a4,1
     384:	c699                	beqz	a3,392 <core_bench_list+0x7c>
                retval += (this_find->info->data16 >> 9) & 1;
     386:	8725                	sra	a4,a4,0x9
     388:	8b05                	and	a4,a4,1
     38a:	9726                	add	a4,a4,s1
     38c:	01071493          	sll	s1,a4,0x10
     390:	80c1                	srl	s1,s1,0x10
            if (this_find->next != NULL)
     392:	4398                	lw	a4,0(a5)
     394:	c711                	beqz	a4,3a0 <core_bench_list+0x8a>
                this_find->next = finder->next;
     396:	4314                	lw	a3,0(a4)
     398:	c394                	sw	a3,0(a5)
                finder->next    = list->next;
     39a:	401c                	lw	a5,0(s0)
     39c:	c31c                	sw	a5,0(a4)
                list->next      = finder;
     39e:	c018                	sw	a4,0(s0)
            found++;
     3a0:	00158793          	add	a5,a1,1
     3a4:	01079593          	sll	a1,a5,0x10
     3a8:	81c1                	srl	a1,a1,0x10
        if (info.idx >= 0)
     3aa:	000bc663          	bltz	s7,3b6 <core_bench_list+0xa0>
            info.idx++;
     3ae:	0b85                	add	s7,s7,1
     3b0:	0bc2                	sll	s7,s7,0x10
     3b2:	410bdb93          	sra	s7,s7,0x10
    for (i = 0; i < find_num; i++)
     3b6:	0605                	add	a2,a2,1
     3b8:	0642                	sll	a2,a2,0x10
     3ba:	8641                	sra	a2,a2,0x10
     3bc:	f8c897e3          	bne	a7,a2,34a <core_bench_list+0x34>
    retval += found * 4 - missed;
     3c0:	00259793          	sll	a5,a1,0x2
     3c4:	410787b3          	sub	a5,a5,a6
     3c8:	94be                	add	s1,s1,a5
     3ca:	04c2                	sll	s1,s1,0x10
     3cc:	80c1                	srl	s1,s1,0x10
    if (finder_idx > 0)
     3ce:	1aa04d63          	bgtz	a0,588 <core_bench_list+0x272>
    remover = core_list_remove(list->next);
     3d2:	401c                	lw	a5,0(s0)
    list_head *ret = item->next;
     3d4:	8922                	mv	s2,s0
     3d6:	0007a983          	lw	s3,0(a5)
    tmp        = item->info;
     3da:	43d8                	lw	a4,4(a5)
    item->info = ret->info;
     3dc:	0049a603          	lw	a2,4(s3)
    item->next = item->next->next;
     3e0:	0009a683          	lw	a3,0(s3)
    item->info = ret->info;
     3e4:	c3d0                	sw	a2,4(a5)
    ret->info  = tmp;
     3e6:	00e9a223          	sw	a4,4(s3)
    item->next = item->next->next;
     3ea:	c394                	sw	a3,0(a5)
    ret->next  = NULL;
     3ec:	0009a023          	sw	zero,0(s3)
    if (info->idx >= 0)
     3f0:	0a0bc863          	bltz	s7,4a0 <core_bench_list+0x18a>
        while (list && (list->info->idx != info->idx))
     3f4:	00492783          	lw	a5,4(s2)
     3f8:	00279783          	lh	a5,2(a5)
     3fc:	01778c63          	beq	a5,s7,414 <core_bench_list+0xfe>
            list = list->next;
     400:	00092903          	lw	s2,0(s2)
        while (list && (list->info->idx != info->idx))
     404:	20090363          	beqz	s2,60a <core_bench_list+0x2f4>
     408:	00492783          	lw	a5,4(s2)
     40c:	00279783          	lh	a5,2(a5)
     410:	ff7798e3          	bne	a5,s7,400 <core_bench_list+0xea>
        retval = crc16(list->info->data16, retval);
     414:	405c                	lw	a5,4(s0)
     416:	85a6                	mv	a1,s1
     418:	00079503          	lh	a0,0(a5)
     41c:	615020ef          	jal	3230 <crc16>
        finder = finder->next;
     420:	00092903          	lw	s2,0(s2)
        retval = crc16(list->info->data16, retval);
     424:	84aa                	mv	s1,a0
    while (finder)
     426:	fe0917e3          	bnez	s2,414 <core_bench_list+0xfe>
    remover = core_list_undo_remove(remover, list->next);
     42a:	00042903          	lw	s2,0(s0)
    tmp                 = item_removed->info;
     42e:	0049a703          	lw	a4,4(s3)
    item_removed->info  = item_modified->info;
     432:	00492683          	lw	a3,4(s2)
    item_removed->next  = item_modified->next;
     436:	00092783          	lw	a5,0(s2)
core_list_mergesort(list_head *list, list_cmp cmp, core_results *res)
{
    list_head *p, *q, *e, *tail;
    ee_s32     insize, nmerges, psize, qsize, i;

    insize = 1;
     43a:	4e85                	li	t4,1
    item_removed->info  = item_modified->info;
     43c:	00d9a223          	sw	a3,4(s3)
    item_modified->info = tmp;
     440:	00e92223          	sw	a4,4(s2)
    item_removed->next  = item_modified->next;
     444:	00f9a023          	sw	a5,0(s3)
    item_modified->next = item_removed;
     448:	01392023          	sw	s3,0(s2)
        }

        tail->next = NULL;

        /* If we have done only one merge, we're finished. */
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     44c:	4f85                	li	t6,1
        while (p)
     44e:	c071                	beqz	s0,512 <core_bench_list+0x1fc>
        tail = NULL;
     450:	4681                	li	a3,0
        list = NULL;
     452:	4901                	li	s2,0
        nmerges = 0; /* count number of merges we do in this pass */
     454:	4f01                	li	t5,0
            nmerges++; /* there exists a merge to be done */
     456:	0f05                	add	t5,t5,1
            q     = p;
     458:	8722                	mv	a4,s0
            psize = 0;
     45a:	4781                	li	a5,0
            for (i = 0; i < insize; i++)
     45c:	01d7d563          	bge	a5,t4,466 <core_bench_list+0x150>
                q = q->next;
     460:	4318                	lw	a4,0(a4)
                psize++;
     462:	0785                	add	a5,a5,1
                if (!q)
     464:	ff65                	bnez	a4,45c <core_bench_list+0x146>
                    list = e;
     466:	8622                	mv	a2,s0
     468:	85f6                	mv	a1,t4
     46a:	843a                	mv	s0,a4
            while (psize > 0 || (qsize > 0 && q))
     46c:	00f05b63          	blez	a5,482 <core_bench_list+0x16c>
                else if (qsize == 0 || !q)
     470:	ed9d                	bnez	a1,4ae <core_bench_list+0x198>
                    e = p;
     472:	8732                	mv	a4,a2
                    p = p->next;
     474:	4210                	lw	a2,0(a2)
                    psize--;
     476:	17fd                	add	a5,a5,-1
                if (tail)
     478:	ce89                	beqz	a3,492 <core_bench_list+0x17c>
                    tail->next = e;
     47a:	c298                	sw	a4,0(a3)
                    list = e;
     47c:	86ba                	mv	a3,a4
            while (psize > 0 || (qsize > 0 && q))
     47e:	fef049e3          	bgtz	a5,470 <core_bench_list+0x15a>
     482:	08b05063          	blez	a1,502 <core_bench_list+0x1ec>
     486:	cc3d                	beqz	s0,504 <core_bench_list+0x1ee>
                if (psize == 0)
     488:	e785                	bnez	a5,4b0 <core_bench_list+0x19a>
                    e = q;
     48a:	8722                	mv	a4,s0
                    qsize--;
     48c:	15fd                	add	a1,a1,-1
                    q = q->next;
     48e:	4000                	lw	s0,0(s0)
                if (tail)
     490:	f6ed                	bnez	a3,47a <core_bench_list+0x164>
                    list = e;
     492:	893a                	mv	s2,a4
     494:	86ba                	mv	a3,a4
     496:	b7e5                	j	47e <core_bench_list+0x168>
            list = list->next;
     498:	00092903          	lw	s2,0(s2)
        while (list && ((list->info->data16 & 0xff) != info->data16))
     49c:	16090763          	beqz	s2,60a <core_bench_list+0x2f4>
     4a0:	00492783          	lw	a5,4(s2)
     4a4:	0007c783          	lbu	a5,0(a5)
     4a8:	fefc98e3          	bne	s9,a5,498 <core_bench_list+0x182>
     4ac:	b7a5                	j	414 <core_bench_list+0xfe>
                else if (qsize == 0 || !q)
     4ae:	d071                	beqz	s0,472 <core_bench_list+0x15c>
                else if (cmp(p->info, q->info, res) <= 0)
     4b0:	00462803          	lw	a6,4(a2)
     4b4:	4048                	lw	a0,4(s0)
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
     4b6:	00081703          	lh	a4,0(a6)
    return a->idx - b->idx;
     4ba:	00251303          	lh	t1,2(a0)
     4be:	00281e03          	lh	t3,2(a6)
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
     4c2:	01071893          	sll	a7,a4,0x10
     4c6:	0108d893          	srl	a7,a7,0x10
     4ca:	f0077713          	and	a4,a4,-256
     4ce:	0088d893          	srl	a7,a7,0x8
     4d2:	01176733          	or	a4,a4,a7
     4d6:	00e81023          	sh	a4,0(a6)
        b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16 >> 8));
     4da:	00051703          	lh	a4,0(a0)
     4de:	01071813          	sll	a6,a4,0x10
     4e2:	01085813          	srl	a6,a6,0x10
     4e6:	f0077713          	and	a4,a4,-256
     4ea:	00885813          	srl	a6,a6,0x8
     4ee:	01076733          	or	a4,a4,a6
     4f2:	00e51023          	sh	a4,0(a0)
                else if (cmp(p->info, q->info, res) <= 0)
     4f6:	f7c35ee3          	bge	t1,t3,472 <core_bench_list+0x15c>
                    e = q;
     4fa:	8722                	mv	a4,s0
                    qsize--;
     4fc:	15fd                	add	a1,a1,-1
                    q = q->next;
     4fe:	4000                	lw	s0,0(s0)
     500:	bfa5                	j	478 <core_bench_list+0x162>
        while (p)
     502:	f831                	bnez	s0,456 <core_bench_list+0x140>
        tail->next = NULL;
     504:	0006a023          	sw	zero,0(a3)
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     508:	05ff0363          	beq	t5,t6,54e <core_bench_list+0x238>
        p    = list;
     50c:	844a                	mv	s0,s2
            return list;

        /* Otherwise repeat, merging lists twice the size */
        insize *= 2;
     50e:	0e86                	sll	t4,t4,0x1
        while (p)
     510:	f021                	bnez	s0,450 <core_bench_list+0x13a>
        tail->next = NULL;
     512:	00002023          	sw	zero,0(zero) # 0 <__crt0_entry>
     516:	9002                	ebreak
        while (list && ((list->info->data16 & 0xff) != info->data16))
     518:	10040f63          	beqz	s0,636 <core_bench_list+0x320>
     51c:	87a2                	mv	a5,s0
     51e:	a021                	j	526 <core_bench_list+0x210>
            list = list->next;
     520:	439c                	lw	a5,0(a5)
        while (list && ((list->info->data16 & 0xff) != info->data16))
     522:	e40783e3          	beqz	a5,368 <core_bench_list+0x52>
     526:	43d8                	lw	a4,4(a5)
     528:	00074703          	lbu	a4,0(a4)
     52c:	feec9ae3          	bne	s9,a4,520 <core_bench_list+0x20a>
     530:	bd25                	j	368 <core_bench_list+0x52>
            retval += (list->next->info->data16 >> 8) & 1;
     532:	401c                	lw	a5,0(s0)
            missed++;
     534:	0805                	add	a6,a6,1
     536:	0842                	sll	a6,a6,0x10
            retval += (list->next->info->data16 >> 8) & 1;
     538:	43dc                	lw	a5,4(a5)
            missed++;
     53a:	01085813          	srl	a6,a6,0x10
            retval += (list->next->info->data16 >> 8) & 1;
     53e:	00178783          	lb	a5,1(a5)
     542:	8b85                	and	a5,a5,1
     544:	97a6                	add	a5,a5,s1
     546:	01079493          	sll	s1,a5,0x10
     54a:	80c1                	srl	s1,s1,0x10
     54c:	bdb9                	j	3aa <core_bench_list+0x94>
    finder = list->next;
     54e:	00092403          	lw	s0,0(s2)
    while (finder)
     552:	c819                	beqz	s0,568 <core_bench_list+0x252>
        retval = crc16(list->info->data16, retval);
     554:	00492783          	lw	a5,4(s2)
     558:	85a6                	mv	a1,s1
     55a:	00079503          	lh	a0,0(a5)
     55e:	4d3020ef          	jal	3230 <crc16>
        finder = finder->next;
     562:	4000                	lw	s0,0(s0)
        retval = crc16(list->info->data16, retval);
     564:	84aa                	mv	s1,a0
    while (finder)
     566:	f47d                	bnez	s0,554 <core_bench_list+0x23e>
}
     568:	50f2                	lw	ra,60(sp)
     56a:	5462                	lw	s0,56(sp)
     56c:	5942                	lw	s2,48(sp)
     56e:	59b2                	lw	s3,44(sp)
     570:	5a22                	lw	s4,40(sp)
     572:	5a92                	lw	s5,36(sp)
     574:	5b02                	lw	s6,32(sp)
     576:	4bf2                	lw	s7,28(sp)
     578:	4c62                	lw	s8,24(sp)
     57a:	4cd2                	lw	s9,20(sp)
     57c:	4d42                	lw	s10,16(sp)
     57e:	4db2                	lw	s11,12(sp)
     580:	8526                	mv	a0,s1
     582:	54d2                	lw	s1,52(sp)
     584:	6121                	add	sp,sp,64
     586:	8082                	ret
    insize = 1;
     588:	4a05                	li	s4,1
        while (p)
     58a:	d441                	beqz	s0,512 <core_bench_list+0x1fc>
        tail = NULL;
     58c:	4981                	li	s3,0
        list = NULL;
     58e:	4a81                	li	s5,0
        nmerges = 0; /* count number of merges we do in this pass */
     590:	4c01                	li	s8,0
            nmerges++; /* there exists a merge to be done */
     592:	0c05                	add	s8,s8,1
            q     = p;
     594:	87a2                	mv	a5,s0
            psize = 0;
     596:	4901                	li	s2,0
            for (i = 0; i < insize; i++)
     598:	01495563          	bge	s2,s4,5a2 <core_bench_list+0x28c>
                q = q->next;
     59c:	439c                	lw	a5,0(a5)
                psize++;
     59e:	0905                	add	s2,s2,1
                if (!q)
     5a0:	ffe5                	bnez	a5,598 <core_bench_list+0x282>
                    list = e;
     5a2:	8da2                	mv	s11,s0
     5a4:	8d52                	mv	s10,s4
     5a6:	843e                	mv	s0,a5
            while (psize > 0 || (qsize > 0 && q))
     5a8:	01205f63          	blez	s2,5c6 <core_bench_list+0x2b0>
                else if (qsize == 0 || !q)
     5ac:	020d1a63          	bnez	s10,5e0 <core_bench_list+0x2ca>
                    e = p;
     5b0:	87ee                	mv	a5,s11
                    p = p->next;
     5b2:	000dad83          	lw	s11,0(s11)
                    psize--;
     5b6:	197d                	add	s2,s2,-1
                if (tail)
     5b8:	02098163          	beqz	s3,5da <core_bench_list+0x2c4>
                    tail->next = e;
     5bc:	00f9a023          	sw	a5,0(s3)
                    list = e;
     5c0:	89be                	mv	s3,a5
            while (psize > 0 || (qsize > 0 && q))
     5c2:	ff2045e3          	bgtz	s2,5ac <core_bench_list+0x296>
     5c6:	03a05963          	blez	s10,5f8 <core_bench_list+0x2e2>
     5ca:	c805                	beqz	s0,5fa <core_bench_list+0x2e4>
                if (psize == 0)
     5cc:	00091b63          	bnez	s2,5e2 <core_bench_list+0x2cc>
                    e = q;
     5d0:	87a2                	mv	a5,s0
                    qsize--;
     5d2:	1d7d                	add	s10,s10,-1
                    q = q->next;
     5d4:	4000                	lw	s0,0(s0)
                if (tail)
     5d6:	fe0993e3          	bnez	s3,5bc <core_bench_list+0x2a6>
                    list = e;
     5da:	8abe                	mv	s5,a5
     5dc:	89be                	mv	s3,a5
     5de:	b7d5                	j	5c2 <core_bench_list+0x2ac>
                else if (qsize == 0 || !q)
     5e0:	d861                	beqz	s0,5b0 <core_bench_list+0x29a>
                else if (cmp(p->info, q->info, res) <= 0)
     5e2:	404c                	lw	a1,4(s0)
     5e4:	004da503          	lw	a0,4(s11)
     5e8:	865a                	mv	a2,s6
     5ea:	3645                	jal	18a <cmp_complex>
     5ec:	fca052e3          	blez	a0,5b0 <core_bench_list+0x29a>
                    e = q;
     5f0:	87a2                	mv	a5,s0
                    qsize--;
     5f2:	1d7d                	add	s10,s10,-1
                    q = q->next;
     5f4:	4000                	lw	s0,0(s0)
     5f6:	b7c9                	j	5b8 <core_bench_list+0x2a2>
        while (p)
     5f8:	fc49                	bnez	s0,592 <core_bench_list+0x27c>
        tail->next = NULL;
     5fa:	0009a023          	sw	zero,0(s3)
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     5fe:	4785                	li	a5,1
     600:	02fc0563          	beq	s8,a5,62a <core_bench_list+0x314>
        insize *= 2;
     604:	0a06                	sll	s4,s4,0x1
        p    = list;
     606:	8456                	mv	s0,s5
     608:	b749                	j	58a <core_bench_list+0x274>
        finder = list->next;
     60a:	00042903          	lw	s2,0(s0)
    while (finder)
     60e:	e20902e3          	beqz	s2,432 <core_bench_list+0x11c>
        retval = crc16(list->info->data16, retval);
     612:	405c                	lw	a5,4(s0)
     614:	85a6                	mv	a1,s1
     616:	00079503          	lh	a0,0(a5)
     61a:	417020ef          	jal	3230 <crc16>
        finder = finder->next;
     61e:	00092903          	lw	s2,0(s2)
        retval = crc16(list->info->data16, retval);
     622:	84aa                	mv	s1,a0
    while (finder)
     624:	de0918e3          	bnez	s2,414 <core_bench_list+0xfe>
     628:	b509                	j	42a <core_bench_list+0x114>
        list = core_list_mergesort(list, cmp_complex, res);
     62a:	8456                	mv	s0,s5
     62c:	b35d                	j	3d2 <core_bench_list+0xbc>
     62e:	4c81                	li	s9,0
    info.idx = finder_idx;
     630:	8bae                	mv	s7,a1
    for (i = 0; i < find_num; i++)
     632:	4481                	li	s1,0
     634:	bb69                	j	3ce <core_bench_list+0xb8>
            retval += (list->next->info->data16 >> 8) & 1;
     636:	00002783          	lw	a5,0(zero) # 0 <__crt0_entry>
     63a:	9002                	ebreak

0000063c <core_list_init>:
    ee_u32 size     = (blksize / per_item)
     63c:	47d1                	li	a5,20
     63e:	02f55533          	divu	a0,a0,a5
    list->next         = NULL;
     642:	0005a023          	sw	zero,0(a1)
{
     646:	872e                	mv	a4,a1
    if ((*memblock + 1) >= memblock_end)
     648:	01058893          	add	a7,a1,16
    memblock++;
     64c:	00858693          	add	a3,a1,8
    list->info->data16 = (ee_s16)0x8080;
     650:	77e1                	lui	a5,0xffff8
     652:	08078793          	add	a5,a5,128 # ffff8080 <__crt0_ram_last+0x7fff4081>
{
     656:	8f32                	mv	t5,a2
     658:	4301                	li	t1,0
    ee_u32 size     = (blksize / per_item)
     65a:	ffe50593          	add	a1,a0,-2
    list_head *memblock_end  = memblock + size;
     65e:	00359813          	sll	a6,a1,0x3
     662:	983a                	add	a6,a6,a4
    list->info         = datablock;
     664:	01072223          	sw	a6,4(a4)
    list_data *datablock_end = datablock + size;
     668:	00259f93          	sll	t6,a1,0x2
    list->info->idx    = 0x0000;
     66c:	00081123          	sh	zero,2(a6)
    list->info->data16 = (ee_s16)0x8080;
     670:	00f81023          	sh	a5,0(a6)
    list_data *datablock_end = datablock + size;
     674:	9fc2                	add	t6,t6,a6
    datablock++;
     676:	00480613          	add	a2,a6,4
    if ((*memblock + 1) >= memblock_end)
     67a:	0308f563          	bgeu	a7,a6,6a4 <core_list_init+0x68>
    if ((*datablock + 1) >= datablock_end)
     67e:	00880513          	add	a0,a6,8
     682:	03f57163          	bgeu	a0,t6,6a4 <core_list_init+0x68>
    to->idx    = from->idx;
     686:	77e1                	lui	a5,0xffff8
    insert_point->next = newitem;
     688:	c314                	sw	a3,0(a4)
    newitem->info = *datablock;
     68a:	c750                	sw	a2,12(a4)
    newitem->next      = insert_point->next;
     68c:	00072423          	sw	zero,8(a4)
    return newitem;
     690:	8336                	mv	t1,a3
    to->idx    = from->idx;
     692:	fff7c793          	not	a5,a5
    to->data16 = from->data16;
     696:	56fd                	li	a3,-1
     698:	00d81223          	sh	a3,4(a6)
    to->idx    = from->idx;
     69c:	00f81323          	sh	a5,6(a6)
    (*datablock)++;
     6a0:	862a                	mv	a2,a0
    (*memblock)++;
     6a2:	86c6                	mv	a3,a7
    for (i = 0; i < size; i++)
     6a4:	c1bd                	beqz	a1,70a <core_list_init+0xce>
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
     6a6:	010f1393          	sll	t2,t5,0x10
    to->idx    = from->idx;
     6aa:	72e1                	lui	t0,0xffff8
    if ((*memblock + 1) >= memblock_end)
     6ac:	00868e13          	add	t3,a3,8
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
     6b0:	0103d393          	srl	t2,t2,0x10
     6b4:	4501                	li	a0,0
    to->idx    = from->idx;
     6b6:	fff2c293          	not	t0,t0
    if ((*memblock + 1) >= memblock_end)
     6ba:	050e7863          	bgeu	t3,a6,70a <core_list_init+0xce>
    if ((*datablock + 1) >= datablock_end)
     6be:	00460e93          	add	t4,a2,4
     6c2:	17fef863          	bgeu	t4,t6,832 <core_list_init+0x1f6>
     6c6:	01051893          	sll	a7,a0,0x10
     6ca:	0108d893          	srl	a7,a7,0x10
        ee_u16 datpat = ((ee_u16)(seed ^ i) & 0xf);
     6ce:	0078c7b3          	xor	a5,a7,t2
            = (datpat << 3) | (i & 0x7); /* alternate between algorithms */
     6d2:	078e                	sll	a5,a5,0x3
     6d4:	0078f893          	and	a7,a7,7
     6d8:	0787f793          	and	a5,a5,120
    newitem->next      = insert_point->next;
     6dc:	0066a023          	sw	t1,0(a3)
        ee_u16 dat
     6e0:	0117e7b3          	or	a5,a5,a7
    insert_point->next = newitem;
     6e4:	c314                	sw	a3,0(a4)
        info.data16 = (dat << 8) | dat;  /* fill the data with actual data and
     6e6:	00879893          	sll	a7,a5,0x8
    newitem->info = *datablock;
     6ea:	c2d0                	sw	a2,4(a3)
        info.data16 = (dat << 8) | dat;  /* fill the data with actual data and
     6ec:	97c6                	add	a5,a5,a7
    to->data16 = from->data16;
     6ee:	00f61023          	sh	a5,0(a2)
    to->idx    = from->idx;
     6f2:	00561123          	sh	t0,2(a2)
    for (i = 0; i < size; i++)
     6f6:	0505                	add	a0,a0,1
     6f8:	12a58b63          	beq	a1,a0,82e <core_list_init+0x1f2>
     6fc:	8336                	mv	t1,a3
     6fe:	86f2                	mv	a3,t3
    if ((*memblock + 1) >= memblock_end)
     700:	00868e13          	add	t3,a3,8
     704:	8676                	mv	a2,t4
     706:	fb0e6ce3          	bltu	t3,a6,6be <core_list_init+0x82>
    while (finder->next != NULL)
     70a:	00032603          	lw	a2,0(t1)
     70e:	ca31                	beqz	a2,762 <core_list_init+0x126>
        if (i < size / 5) /* first 20% of the list in order */
     710:	4795                	li	a5,5
                                & (((i & 0x07) << 8)
     712:	6e11                	lui	t3,0x4
        if (i < size / 5) /* first 20% of the list in order */
     714:	02f5d5b3          	divu	a1,a1,a5
     718:	4685                	li	a3,1
     71a:	20000793          	li	a5,512
                                & (((i & 0x07) << 8)
     71e:	1e7d                	add	t3,t3,-1 # 3fff <printf+0x6c5>
     720:	a821                	j	738 <core_list_init+0xfc>
    while (finder->next != NULL)
     722:	4208                	lw	a0,0(a2)
     724:	10078793          	add	a5,a5,256 # ffff8100 <__crt0_ram_last+0x7fff4101>
            finder->info->idx = i++;
     728:	00d89123          	sh	a3,2(a7)
    while (finder->next != NULL)
     72c:	07c2                	sll	a5,a5,0x10
     72e:	0685                	add	a3,a3,1
     730:	83c1                	srl	a5,a5,0x10
     732:	c905                	beqz	a0,762 <core_list_init+0x126>
        if (i < size / 5) /* first 20% of the list in order */
     734:	8332                	mv	t1,a2
    while (finder->next != NULL)
     736:	862a                	mv	a2,a0
            finder->info->idx = i++;
     738:	00432883          	lw	a7,4(t1)
        if (i < size / 5) /* first 20% of the list in order */
     73c:	feb6e3e3          	bltu	a3,a1,722 <core_list_init+0xe6>
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
     740:	00df4533          	xor	a0,t5,a3
                                & (((i & 0x07) << 8)
     744:	7007f813          	and	a6,a5,1792
                                   | pat); /* make sure the mixed items end up
     748:	00a86833          	or	a6,a6,a0
    while (finder->next != NULL)
     74c:	4208                	lw	a0,0(a2)
                                & (((i & 0x07) << 8)
     74e:	01c87833          	and	a6,a6,t3
    while (finder->next != NULL)
     752:	10078793          	add	a5,a5,256
     756:	07c2                	sll	a5,a5,0x10
            finder->info->idx = i++;
     758:	01089123          	sh	a6,2(a7)
    while (finder->next != NULL)
     75c:	0685                	add	a3,a3,1
     75e:	83c1                	srl	a5,a5,0x10
     760:	f971                	bnez	a0,734 <core_list_init+0xf8>
    insize = 1;
     762:	4f85                	li	t6,1
        tail = NULL;
     764:	4801                	li	a6,0
        list = NULL;
     766:	4501                	li	a0,0
        nmerges = 0; /* count number of merges we do in this pass */
     768:	4281                	li	t0,0
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     76a:	4385                	li	t2,1
            nmerges++; /* there exists a merge to be done */
     76c:	0285                	add	t0,t0,1 # ffff8001 <__crt0_ram_last+0x7fff4002>
            q     = p;
     76e:	87ba                	mv	a5,a4
            psize = 0;
     770:	4681                	li	a3,0
            for (i = 0; i < insize; i++)
     772:	01f6d563          	bge	a3,t6,77c <core_list_init+0x140>
                q = q->next;
     776:	439c                	lw	a5,0(a5)
                psize++;
     778:	0685                	add	a3,a3,1
                if (!q)
     77a:	ffe5                	bnez	a5,772 <core_list_init+0x136>
                    list = e;
     77c:	85fe                	mv	a1,t6
            while (psize > 0 || (qsize > 0 && q))
     77e:	00d05d63          	blez	a3,798 <core_list_init+0x15c>
                else if (qsize == 0 || !q)
     782:	e59d                	bnez	a1,7b0 <core_list_init+0x174>
                    p = p->next;
     784:	4310                	lw	a2,0(a4)
                    psize--;
     786:	16fd                	add	a3,a3,-1
                if (tail)
     788:	02080263          	beqz	a6,7ac <core_list_init+0x170>
                    tail->next = e;
     78c:	00e82023          	sw	a4,0(a6)
                    list = e;
     790:	883a                	mv	a6,a4
     792:	8732                	mv	a4,a2
            while (psize > 0 || (qsize > 0 && q))
     794:	fed047e3          	bgtz	a3,782 <core_list_init+0x146>
     798:	06b05863          	blez	a1,808 <core_list_init+0x1cc>
     79c:	cbad                	beqz	a5,80e <core_list_init+0x1d2>
                if (psize == 0)
     79e:	ea91                	bnez	a3,7b2 <core_list_init+0x176>
                    qsize--;
     7a0:	863a                	mv	a2,a4
     7a2:	15fd                	add	a1,a1,-1
                    e = q;
     7a4:	873e                	mv	a4,a5
                    q = q->next;
     7a6:	439c                	lw	a5,0(a5)
                if (tail)
     7a8:	fe0812e3          	bnez	a6,78c <core_list_init+0x150>
                    list = e;
     7ac:	853a                	mv	a0,a4
     7ae:	b7cd                	j	790 <core_list_init+0x154>
                else if (qsize == 0 || !q)
     7b0:	dbf1                	beqz	a5,784 <core_list_init+0x148>
                else if (cmp(p->info, q->info, res) <= 0)
     7b2:	00472303          	lw	t1,4(a4)
     7b6:	0047a883          	lw	a7,4(a5)
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
     7ba:	00031603          	lh	a2,0(t1)
    return a->idx - b->idx;
     7be:	00289e83          	lh	t4,2(a7)
     7c2:	00231f03          	lh	t5,2(t1)
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
     7c6:	01061e13          	sll	t3,a2,0x10
     7ca:	010e5e13          	srl	t3,t3,0x10
     7ce:	f0067613          	and	a2,a2,-256
     7d2:	008e5e13          	srl	t3,t3,0x8
     7d6:	01c66633          	or	a2,a2,t3
     7da:	00c31023          	sh	a2,0(t1)
        b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16 >> 8));
     7de:	00089603          	lh	a2,0(a7)
     7e2:	01061313          	sll	t1,a2,0x10
     7e6:	01035313          	srl	t1,t1,0x10
     7ea:	f0067613          	and	a2,a2,-256
     7ee:	00835313          	srl	t1,t1,0x8
     7f2:	00666633          	or	a2,a2,t1
     7f6:	00c89023          	sh	a2,0(a7)
                else if (cmp(p->info, q->info, res) <= 0)
     7fa:	f9eed5e3          	bge	t4,t5,784 <core_list_init+0x148>
                    qsize--;
     7fe:	863a                	mv	a2,a4
     800:	15fd                	add	a1,a1,-1
                    e = q;
     802:	873e                	mv	a4,a5
                    q = q->next;
     804:	439c                	lw	a5,0(a5)
     806:	b749                	j	788 <core_list_init+0x14c>
        while (p)
     808:	c399                	beqz	a5,80e <core_list_init+0x1d2>
        nmerges = 0; /* count number of merges we do in this pass */
     80a:	873e                	mv	a4,a5
     80c:	b785                	j	76c <core_list_init+0x130>
        tail->next = NULL;
     80e:	00082023          	sw	zero,0(a6)
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     812:	00728a63          	beq	t0,t2,826 <core_list_init+0x1ea>
        insize *= 2;
     816:	0f86                	sll	t6,t6,0x1
        while (p)
     818:	c901                	beqz	a0,828 <core_list_init+0x1ec>
        p    = list;
     81a:	87aa                	mv	a5,a0
        tail = NULL;
     81c:	4801                	li	a6,0
        list = NULL;
     81e:	4501                	li	a0,0
        nmerges = 0; /* count number of merges we do in this pass */
     820:	4281                	li	t0,0
     822:	873e                	mv	a4,a5
     824:	b7a1                	j	76c <core_list_init+0x130>
}
     826:	8082                	ret
        tail->next = NULL;
     828:	00002023          	sw	zero,0(zero) # 0 <__crt0_entry>
     82c:	9002                	ebreak
    for (i = 0; i < size; i++)
     82e:	8336                	mv	t1,a3
     830:	bde9                	j	70a <core_list_init+0xce>
     832:	0505                	add	a0,a0,1
     834:	eca58be3          	beq	a1,a0,70a <core_list_init+0xce>
     838:	8e36                	mv	t3,a3
     83a:	8eb2                	mv	t4,a2
     83c:	869a                	mv	a3,t1
     83e:	bd7d                	j	6fc <core_list_init+0xc0>

00000840 <iterate>:
                                    (ee_u16)0xe5a4,
                                    (ee_u16)0x8e3a,
                                    (ee_u16)0x8d84 };
void *
iterate(void *pres)
{
     840:	1141                	add	sp,sp,-16
     842:	c04a                	sw	s2,0(sp)
    ee_u32        i;
    ee_u16        crc;
    core_results *res        = (core_results *)pres;
    ee_u32        iterations = res->iterations;
     844:	01c52903          	lw	s2,28(a0)
{
     848:	c606                	sw	ra,12(sp)
    res->crc                 = 0;
     84a:	02052c23          	sw	zero,56(a0)
     84e:	02052e23          	sw	zero,60(a0)
    res->crclist             = 0;
    res->crcmatrix           = 0;
    res->crcstate            = 0;

    for (i = 0; i < iterations; i++)
     852:	02090e63          	beqz	s2,88e <iterate+0x4e>
     856:	c422                	sw	s0,8(sp)
     858:	c226                	sw	s1,4(sp)
     85a:	842a                	mv	s0,a0
     85c:	4481                	li	s1,0
    {
        crc      = core_bench_list(res, 1);
     85e:	4585                	li	a1,1
     860:	8522                	mv	a0,s0
     862:	3c55                	jal	316 <core_bench_list>
        res->crc = crcu16(crc, res->crc);
     864:	03845583          	lhu	a1,56(s0)
     868:	596020ef          	jal	2dfe <crcu16>
     86c:	02a41c23          	sh	a0,56(s0)
        crc      = core_bench_list(res, -1);
     870:	55fd                	li	a1,-1
     872:	8522                	mv	a0,s0
     874:	344d                	jal	316 <core_bench_list>
        res->crc = crcu16(crc, res->crc);
     876:	03845583          	lhu	a1,56(s0)
     87a:	584020ef          	jal	2dfe <crcu16>
     87e:	02a41c23          	sh	a0,56(s0)
        if (i == 0)
     882:	c899                	beqz	s1,898 <iterate+0x58>
    for (i = 0; i < iterations; i++)
     884:	0485                	add	s1,s1,1
     886:	fc991ce3          	bne	s2,s1,85e <iterate+0x1e>
     88a:	4422                	lw	s0,8(sp)
     88c:	4492                	lw	s1,4(sp)
            res->crclist = res->crc;
    }
    return NULL;
}
     88e:	40b2                	lw	ra,12(sp)
     890:	4902                	lw	s2,0(sp)
     892:	4501                	li	a0,0
     894:	0141                	add	sp,sp,16
     896:	8082                	ret
            res->crclist = res->crc;
     898:	02a41d23          	sh	a0,58(s0)
    for (i = 0; i < iterations; i++)
     89c:	4785                	li	a5,1
     89e:	fef906e3          	beq	s2,a5,88a <iterate+0x4a>
     8a2:	4485                	li	s1,1
     8a4:	bf6d                	j	85e <iterate+0x1e>

000008a6 <main>:
    int   argc = 0;
    char *argv[1];
#else
MAIN_RETURN_TYPE
main(int argc, char *argv[])
{
     8a6:	7171                	add	sp,sp,-176
     8a8:	862e                	mv	a2,a1
     8aa:	ce2a                	sw	a0,28(sp)
    core_results results[MULTITHREAD];
#if (MEM_METHOD == MEM_STACK)
    ee_u8 stack_memblock[TOTAL_DATA_SIZE * MULTITHREAD];
#endif
    /* first call any initializations needed */
    portable_init(&(results[0].port), &argc, argv);
     8ac:	086c                	add	a1,sp,28
     8ae:	06e10513          	add	a0,sp,110
{
     8b2:	d706                	sw	ra,172(sp)
     8b4:	d522                	sw	s0,168(sp)
     8b6:	d326                	sw	s1,164(sp)
     8b8:	d14a                	sw	s2,160(sp)
     8ba:	cf4e                	sw	s3,156(sp)
     8bc:	cd52                	sw	s4,152(sp)
     8be:	cb56                	sw	s5,148(sp)
     8c0:	c95a                	sw	s6,144(sp)
     8c2:	c75e                	sw	s7,140(sp)
     8c4:	c562                	sw	s8,136(sp)
     8c6:	c366                	sw	s9,132(sp)
    portable_init(&(results[0].port), &argc, argv);
     8c8:	507010ef          	jal	25ce <portable_init>
    if (sizeof(struct list_head_s) > 128)
    {
        ee_printf("list_head structure too big for comparable data!\n");
        return MAIN_RETURN_VAL;
    }
    results[0].seed1      = get_seed(1);
     8cc:	4505                	li	a0,1
     8ce:	4e6020ef          	jal	2db4 <get_seed_32>
     8d2:	87aa                	mv	a5,a0
    results[0].seed2      = get_seed(2);
     8d4:	4509                	li	a0,2
    results[0].seed1      = get_seed(1);
     8d6:	02f11623          	sh	a5,44(sp)
    results[0].seed2      = get_seed(2);
     8da:	4da020ef          	jal	2db4 <get_seed_32>
     8de:	87aa                	mv	a5,a0
    results[0].seed3      = get_seed(3);
     8e0:	450d                	li	a0,3
    results[0].seed2      = get_seed(2);
     8e2:	02f11723          	sh	a5,46(sp)
    results[0].seed3      = get_seed(3);
     8e6:	4ce020ef          	jal	2db4 <get_seed_32>
     8ea:	87aa                	mv	a5,a0
    results[0].iterations = get_seed_32(4);
     8ec:	4511                	li	a0,4
    results[0].seed3      = get_seed(3);
     8ee:	02f11823          	sh	a5,48(sp)
    results[0].iterations = get_seed_32(4);
     8f2:	4c2020ef          	jal	2db4 <get_seed_32>
     8f6:	87aa                	mv	a5,a0
#if CORE_DEBUG
    results[0].iterations = 1;
#endif
    results[0].execs = get_seed_32(5);
     8f8:	4515                	li	a0,5
    results[0].iterations = get_seed_32(4);
     8fa:	c4be                	sw	a5,72(sp)
    results[0].execs = get_seed_32(5);
     8fc:	4b8020ef          	jal	2db4 <get_seed_32>
    if (results[0].execs == 0)
     900:	e111                	bnez	a0,904 <main+0x5e>
    { /* if not supplied, execute all algorithms */
        results[0].execs = ALL_ALGORITHMS_MASK;
     902:	451d                	li	a0,7
    }
    /* put in some default values based on one seed only for easy testing */
    if ((results[0].seed1 == 0) && (results[0].seed2 == 0)
     904:	57b2                	lw	a5,44(sp)
     906:	c6aa                	sw	a0,76(sp)
     908:	1c079763          	bnez	a5,ad6 <main+0x230>
        && (results[0].seed3 == 0))
     90c:	03011783          	lh	a5,48(sp)
     910:	1c078f63          	beqz	a5,aee <main+0x248>
#error "Cannot use a static data area with multiple contexts!"
#endif
#elif (MEM_METHOD == MEM_MALLOC)
    for (i = 0; i < MULTITHREAD; i++)
    {
        ee_s32 malloc_override = get_seed(7);
     914:	451d                	li	a0,7
     916:	49e020ef          	jal	2db4 <get_seed_32>
     91a:	0542                	sll	a0,a0,0x10
     91c:	8541                	sra	a0,a0,0x10
        if (malloc_override != 0)
     91e:	e119                	bnez	a0,924 <main+0x7e>
     920:	7d000513          	li	a0,2000
     924:	c2aa                	sw	a0,68(sp)
            results[i].size = malloc_override;
        else
            results[i].size = TOTAL_DATA_SIZE;
        results[i].memblock[0] = portable_malloc(results[i].size);
     926:	749010ef          	jal	286e <portable_malloc>
#endif
    /* Data init */
    /* Find out how space much we have based on number of algorithms */
    for (i = 0; i < NUM_ALGORITHMS; i++)
    {
        if ((1 << (ee_u32)i) & results[0].execs)
     92a:	47b6                	lw	a5,76(sp)
            num_algorithms++;
    }
    for (i = 0; i < MULTITHREAD; i++)
        results[i].size = results[i].size / num_algorithms;
     92c:	4716                	lw	a4,68(sp)
        results[i].memblock[0] = portable_malloc(results[i].size);
     92e:	86aa                	mv	a3,a0
        if ((1 << (ee_u32)i) & results[0].execs)
     930:	0027f313          	and	t1,a5,2
     934:	0017f813          	and	a6,a5,1
            num_algorithms++;
     938:	00603633          	snez	a2,t1
        if ((1 << (ee_u32)i) & results[0].execs)
     93c:	0047f893          	and	a7,a5,4
            num_algorithms++;
     940:	9642                	add	a2,a2,a6
     942:	011035b3          	snez	a1,a7
     946:	95b2                	add	a1,a1,a2
        results[i].size = results[i].size / num_algorithms;
     948:	02b75533          	divu	a0,a4,a1
        results[i].memblock[0] = portable_malloc(results[i].size);
     94c:	da36                	sw	a3,52(sp)
        results[i].err         = 0;
     94e:	06011623          	sh	zero,108(sp)
        results[i].size = results[i].size / num_algorithms;
     952:	c2aa                	sw	a0,68(sp)
    /* Assign pointers */
    for (i = 0; i < NUM_ALGORITHMS; i++)
    {
        ee_u32 ctx;
        if ((1 << (ee_u32)i) & results[0].execs)
     954:	1a081263          	bnez	a6,af8 <main+0x252>
     958:	2e031463          	bnez	t1,c40 <main+0x39a>
     95c:	2e089863          	bnez	a7,c4c <main+0x3a6>
        }
    }
    /* call inits */
    for (i = 0; i < MULTITHREAD; i++)
    {
        if (results[i].execs & ID_LIST)
     960:	0017f713          	and	a4,a5,1
     964:	c719                	beqz	a4,972 <main+0xcc>
        {
            results[i].list = core_list_init(
     966:	02c11603          	lh	a2,44(sp)
     96a:	55e2                	lw	a1,56(sp)
     96c:	39c1                	jal	63c <core_list_init>
                results[0].size, results[i].memblock[1], results[i].seed1);
        }
        if (results[i].execs & ID_MATRIX)
     96e:	47b6                	lw	a5,76(sp)
            results[i].list = core_list_init(
     970:	c8aa                	sw	a0,80(sp)
        if (results[i].execs & ID_MATRIX)
     972:	0027f713          	and	a4,a5,2
     976:	14071063          	bnez	a4,ab6 <main+0x210>
                             results[i].memblock[2],
                             (ee_s32)results[i].seed1
                                 | (((ee_s32)results[i].seed2) << 16),
                             &(results[i].mat));
        }
        if (results[i].execs & ID_STATE)
     97a:	8b91                	and	a5,a5,4
     97c:	c799                	beqz	a5,98a <main+0xe4>
        {
            core_init_state(
     97e:	4606                	lw	a2,64(sp)
     980:	02c11583          	lh	a1,44(sp)
     984:	4516                	lw	a0,68(sp)
     986:	70f010ef          	jal	2894 <core_init_state>
                results[0].size, results[i].seed1, results[i].memblock[3]);
        }
    }

    /* automatically determine number of iterations if not set */
    if (results[0].iterations == 0)
     98a:	47a6                	lw	a5,72(sp)
     98c:	ebd1                	bnez	a5,a20 <main+0x17a>
    {
        secs_ret secs_passed = 0;
        ee_u32   divisor;
        results[0].iterations = 1;
     98e:	800007b7          	lui	a5,0x80000
        while (secs_passed < (secs_ret)1)
     992:	5387a903          	lw	s2,1336(a5) # 80000538 <__sglue+0x10>
     996:	53c7a983          	lw	s3,1340(a5)
        results[0].iterations = 1;
     99a:	4785                	li	a5,1
     99c:	c4be                	sw	a5,72(sp)
        {
            results[0].iterations *= 10;
     99e:	4726                	lw	a4,72(sp)
    for (i = 0; i < iterations; i++)
     9a0:	4401                	li	s0,0
            results[0].iterations *= 10;
     9a2:	00271793          	sll	a5,a4,0x2
     9a6:	97ba                	add	a5,a5,a4
     9a8:	0786                	sll	a5,a5,0x1
     9aa:	c4be                	sw	a5,72(sp)
            start_time();
     9ac:	3a5010ef          	jal	2550 <start_time>
    ee_u32        iterations = res->iterations;
     9b0:	44a6                	lw	s1,72(sp)
    res->crc                 = 0;
     9b2:	d282                	sw	zero,100(sp)
     9b4:	d482                	sw	zero,104(sp)
    for (i = 0; i < iterations; i++)
     9b6:	c88d                	beqz	s1,9e8 <main+0x142>
        crc      = core_bench_list(res, 1);
     9b8:	4585                	li	a1,1
     9ba:	1068                	add	a0,sp,44
     9bc:	3aa9                	jal	316 <core_bench_list>
        res->crc = crcu16(crc, res->crc);
     9be:	06415583          	lhu	a1,100(sp)
     9c2:	43c020ef          	jal	2dfe <crcu16>
     9c6:	87aa                	mv	a5,a0
        crc      = core_bench_list(res, -1);
     9c8:	55fd                	li	a1,-1
     9ca:	1068                	add	a0,sp,44
        res->crc = crcu16(crc, res->crc);
     9cc:	06f11223          	sh	a5,100(sp)
        crc      = core_bench_list(res, -1);
     9d0:	3299                	jal	316 <core_bench_list>
        res->crc = crcu16(crc, res->crc);
     9d2:	06415583          	lhu	a1,100(sp)
     9d6:	428020ef          	jal	2dfe <crcu16>
     9da:	06a11223          	sh	a0,100(sp)
        if (i == 0)
     9de:	0c040563          	beqz	s0,aa8 <main+0x202>
    for (i = 0; i < iterations; i++)
     9e2:	0405                	add	s0,s0,1
     9e4:	fc849ae3          	bne	s1,s0,9b8 <main+0x112>
            iterate(&results[0]);
            stop_time();
     9e8:	389010ef          	jal	2570 <stop_time>
            secs_passed = time_in_secs(get_time());
     9ec:	3a5010ef          	jal	2590 <get_time>
     9f0:	3c7010ef          	jal	25b6 <time_in_secs>
        while (secs_passed < (secs_ret)1)
     9f4:	864a                	mv	a2,s2
     9f6:	86ce                	mv	a3,s3
            secs_passed = time_in_secs(get_time());
     9f8:	84aa                	mv	s1,a0
     9fa:	842e                	mv	s0,a1
        while (secs_passed < (secs_ret)1)
     9fc:	427070ef          	jal	8622 <__ledf2>
     a00:	f8054fe3          	bltz	a0,99e <main+0xf8>
        }
        /* now we know it executes for at least 1 sec, set actual run time at
         * about 10 secs */
        divisor = (ee_u32)secs_passed;
     a04:	8526                	mv	a0,s1
     a06:	85a2                	mv	a1,s0
     a08:	1ad080ef          	jal	93b4 <__fixunsdfsi>
        if (divisor == 0) /* some machines cast float to int as 0 since this
                             conversion is not defined by ANSI, but we know at
                             least one second passed */
            divisor = 1;
        results[0].iterations *= 1 + 10 / divisor;
     a0c:	24050563          	beqz	a0,c56 <main+0x3b0>
     a10:	47a9                	li	a5,10
     a12:	02a7d7b3          	divu	a5,a5,a0
     a16:	4726                	lw	a4,72(sp)
     a18:	0785                	add	a5,a5,1
     a1a:	02f707b3          	mul	a5,a4,a5
     a1e:	c4be                	sw	a5,72(sp)
    }
    /* perform actual benchmark */
    start_time();
     a20:	331010ef          	jal	2550 <start_time>
    for (i = 0; i < default_num_contexts; i++)
    {
        core_stop_parallel(&results[i]);
    }
#else
    iterate(&results[0]);
     a24:	1068                	add	a0,sp,44
     a26:	3d29                	jal	840 <iterate>
#endif
    stop_time();
     a28:	349010ef          	jal	2570 <stop_time>
    total_time = get_time();
     a2c:	365010ef          	jal	2590 <get_time>
     a30:	842a                	mv	s0,a0
    /* get a function of the input to report */
    seedcrc = crc16(results[0].seed1, seedcrc);
     a32:	02c11503          	lh	a0,44(sp)
    total_time = get_time();
     a36:	84ae                	mv	s1,a1
    seedcrc = crc16(results[0].seed1, seedcrc);
     a38:	4581                	li	a1,0
     a3a:	7f6020ef          	jal	3230 <crc16>
     a3e:	85aa                	mv	a1,a0
    seedcrc = crc16(results[0].seed2, seedcrc);
     a40:	02e11503          	lh	a0,46(sp)
     a44:	7ec020ef          	jal	3230 <crc16>
     a48:	85aa                	mv	a1,a0
    seedcrc = crc16(results[0].seed3, seedcrc);
     a4a:	03011503          	lh	a0,48(sp)
     a4e:	7e2020ef          	jal	3230 <crc16>
     a52:	85aa                	mv	a1,a0
    seedcrc = crc16(results[0].size, seedcrc);
     a54:	04411503          	lh	a0,68(sp)
     a58:	7d8020ef          	jal	3230 <crc16>

    switch (seedcrc)
     a5c:	67a1                	lui	a5,0x8
     a5e:	b0578793          	add	a5,a5,-1275 # 7b05 <__adddf3+0x2e9>
    seedcrc = crc16(results[0].size, seedcrc);
     a62:	892a                	mv	s2,a0
    switch (seedcrc)
     a64:	52f50263          	beq	a0,a5,f88 <main+0x6e2>
     a68:	08a7fc63          	bgeu	a5,a0,b00 <main+0x25a>
     a6c:	67a5                	lui	a5,0x9
     a6e:	a0278793          	add	a5,a5,-1534 # 8a02 <__muldf3+0x31e>
     a72:	4ef50863          	beq	a0,a5,f62 <main+0x6bc>
     a76:	67bd                	lui	a5,0xf
     a78:	9f578793          	add	a5,a5,-1547 # e9f5 <__crt0_copy_data_src_begin+0x43bd>
     a7c:	1cf51f63          	bne	a0,a5,c5a <main+0x3b4>
            known_id = 2;
            ee_printf("Profile generation run parameters for coremark.\n");
            break;
        case 0xe9f5: /* seed1=0, seed2=0, seed3=0x66, size 666 per algorithm */
            known_id = 3;
            ee_printf("2K performance run parameters for coremark.\n");
     a80:	6525                	lui	a0,0x9
     a82:	70050513          	add	a0,a0,1792 # 9700 <__fini_array_end+0x8c>
     a86:	05c050ef          	jal	5ae2 <puts>
            break;
     a8a:	6789                	lui	a5,0x2
     a8c:	6a25                	lui	s4,0x9
     a8e:	6739                	lui	a4,0xe
     a90:	fd778b93          	add	s7,a5,-41 # 1fd7 <matrix_mul_matrix+0x71d>
     a94:	e3aa0a13          	add	s4,s4,-454 # 8e3a <__subdf3+0x238>
     a98:	71470b13          	add	s6,a4,1812 # e714 <__crt0_copy_data_src_begin+0x40dc>
            known_id = 3;
     a9c:	478d                	li	a5,3
            break;
     a9e:	ca5e                	sw	s7,20(sp)
     aa0:	c85a                	sw	s6,16(sp)
     aa2:	8c52                	mv	s8,s4
            known_id = 3;
     aa4:	cc3e                	sw	a5,24(sp)
            break;
     aa6:	a851                	j	b3a <main+0x294>
            res->crclist = res->crc;
     aa8:	06a11323          	sh	a0,102(sp)
    for (i = 0; i < iterations; i++)
     aac:	4785                	li	a5,1
     aae:	f2f48de3          	beq	s1,a5,9e8 <main+0x142>
     ab2:	4405                	li	s0,1
     ab4:	b711                	j	9b8 <main+0x112>
                                 | (((ee_s32)results[i].seed2) << 16),
     ab6:	02e11783          	lh	a5,46(sp)
                             (ee_s32)results[i].seed1
     aba:	02c11603          	lh	a2,44(sp)
            core_init_matrix(results[0].size,
     abe:	55f2                	lw	a1,60(sp)
     ac0:	4516                	lw	a0,68(sp)
                                 | (((ee_s32)results[i].seed2) << 16),
     ac2:	07c2                	sll	a5,a5,0x10
            core_init_matrix(results[0].size,
     ac4:	8e5d                	or	a2,a2,a5
     ac6:	08d4                	add	a3,sp,84
     ac8:	513000ef          	jal	17da <core_init_matrix>
        if (results[i].execs & ID_STATE)
     acc:	47b6                	lw	a5,76(sp)
     ace:	8b91                	and	a5,a5,4
     ad0:	ea0797e3          	bnez	a5,97e <main+0xd8>
     ad4:	bd5d                	j	98a <main+0xe4>
    if ((results[0].seed1 == 1) && (results[0].seed2 == 0)
     ad6:	4705                	li	a4,1
     ad8:	e2e79ee3          	bne	a5,a4,914 <main+0x6e>
        && (results[0].seed3 == 0))
     adc:	03011783          	lh	a5,48(sp)
     ae0:	e2079ae3          	bnez	a5,914 <main+0x6e>
        results[0].seed1 = 0x3415;
     ae4:	341537b7          	lui	a5,0x34153
     ae8:	41578793          	add	a5,a5,1045 # 34153415 <__neorv32_rom_size+0x34143415>
     aec:	d63e                	sw	a5,44(sp)
        results[0].seed3 = 0x66;
     aee:	06600793          	li	a5,102
     af2:	02f11823          	sh	a5,48(sp)
     af6:	bd39                	j	914 <main+0x6e>
                    = (char *)(results[ctx].memblock[0]) + results[0].size * j;
     af8:	dc36                	sw	a3,56(sp)
        if ((1 << (ee_u32)i) & results[0].execs)
     afa:	e60301e3          	beqz	t1,95c <main+0xb6>
     afe:	a289                	j	c40 <main+0x39a>
    switch (seedcrc)
     b00:	6789                	lui	a5,0x2
     b02:	8f278793          	add	a5,a5,-1806 # 18f2 <matrix_mul_matrix+0x38>
     b06:	42f50963          	beq	a0,a5,f38 <main+0x692>
     b0a:	6795                	lui	a5,0x5
     b0c:	eaf78793          	add	a5,a5,-337 # 4eaf <neorv32_rte_debug_handler+0x3c3>
     b10:	14f51563          	bne	a0,a5,c5a <main+0x3b4>
            ee_printf("Profile generation run parameters for coremark.\n");
     b14:	6525                	lui	a0,0x9
     b16:	6d050513          	add	a0,a0,1744 # 96d0 <__fini_array_end+0x5c>
     b1a:	7c9040ef          	jal	5ae2 <puts>
            break;
     b1e:	6795                	lui	a5,0x5
     b20:	6a39                	lui	s4,0xe
     b22:	671d                	lui	a4,0x7
     b24:	60878b93          	add	s7,a5,1544 # 5608 <_malloc_r+0x1be>
     b28:	5a4a0a13          	add	s4,s4,1444 # e5a4 <__crt0_copy_data_src_begin+0x3f6c>
     b2c:	a7970b13          	add	s6,a4,-1415 # 6a79 <__swsetup_r+0xbb>
            known_id = 2;
     b30:	4789                	li	a5,2
            break;
     b32:	ca5e                	sw	s7,20(sp)
     b34:	c85a                	sw	s6,16(sp)
     b36:	8c52                	mv	s8,s4
            known_id = 2;
     b38:	cc3e                	sw	a5,24(sp)
            total_errors = -1;
            break;
    }
    if (known_id >= 0)
    {
        for (i = 0; i < default_num_contexts; i++)
     b3a:	80000cb7          	lui	s9,0x80000
     b3e:	550ca783          	lw	a5,1360(s9) # 80000550 <default_num_contexts>
     b42:	4681                	li	a3,0
     b44:	12f05163          	blez	a5,c66 <main+0x3c0>
     b48:	c16a                	sw	s10,128(sp)
     b4a:	deee                	sw	s11,124(sp)
     b4c:	4a81                	li	s5,0
     b4e:	4d81                	li	s11,0
     b50:	4d01                	li	s10,0
     b52:	a889                	j	ba4 <main+0x2fe>
                          results[i].crcmatrix,
                          matrix_known_crc[known_id]);
                results[i].err++;
            }
            if ((results[i].execs & ID_STATE)
                && (results[i].crcstate != state_known_crc[known_id]))
     b54:	ffa7d603          	lhu	a2,-6(a5)
     b58:	0f860163          	beq	a2,s8,c3a <main+0x394>
     b5c:	c63e                	sw	a5,12(sp)
            {
                ee_printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",
     b5e:	67a5                	lui	a5,0x9
     b60:	86d2                	mv	a3,s4
     b62:	7bc78513          	add	a0,a5,1980 # 97bc <__fini_array_end+0x148>
     b66:	85ea                	mv	a1,s10
     b68:	5d3020ef          	jal	393a <printf>
                          i,
                          results[i].crcstate,
                          state_known_crc[known_id]);
                results[i].err++;
     b6c:	47b2                	lw	a5,12(sp)
     b6e:	ffc7d683          	lhu	a3,-4(a5)
     b72:	0685                	add	a3,a3,1
     b74:	06c2                	sll	a3,a3,0x10
     b76:	82c1                	srl	a3,a3,0x10
     b78:	fed79e23          	sh	a3,-4(a5)
        for (i = 0; i < default_num_contexts; i++)
     b7c:	001d8893          	add	a7,s11,1
     b80:	550ca603          	lw	a2,1360(s9)
            }
            total_errors += results[i].err;
     b84:	015687b3          	add	a5,a3,s5
        for (i = 0; i < default_num_contexts; i++)
     b88:	01089d93          	sll	s11,a7,0x10
     b8c:	010ddd93          	srl	s11,s11,0x10
            total_errors += results[i].err;
     b90:	01079693          	sll	a3,a5,0x10
     b94:	01079a93          	sll	s5,a5,0x10
     b98:	82c1                	srl	a3,a3,0x10
     b9a:	410ada93          	sra	s5,s5,0x10
        for (i = 0; i < default_num_contexts; i++)
     b9e:	8d6e                	mv	s10,s11
     ba0:	30cdd863          	bge	s11,a2,eb0 <main+0x60a>
            results[i].err = 0;
     ba4:	004d1993          	sll	s3,s10,0x4
     ba8:	01a987b3          	add	a5,s3,s10
     bac:	078a                	sll	a5,a5,0x2
     bae:	06078793          	add	a5,a5,96
     bb2:	0818                	add	a4,sp,16
     bb4:	97ba                	add	a5,a5,a4
            if ((results[i].execs & ID_LIST)
     bb6:	fdc7a683          	lw	a3,-36(a5)
            results[i].err = 0;
     bba:	fe079e23          	sh	zero,-4(a5)
            if ((results[i].execs & ID_LIST)
     bbe:	0016f613          	and	a2,a3,1
     bc2:	c60d                	beqz	a2,bec <main+0x346>
                && (results[i].crclist != list_known_crc[known_id]))
     bc4:	ff67d603          	lhu	a2,-10(a5)
     bc8:	c63e                	sw	a5,12(sp)
     bca:	03660163          	beq	a2,s6,bec <main+0x346>
                ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",
     bce:	46c2                	lw	a3,16(sp)
     bd0:	67a5                	lui	a5,0x9
     bd2:	75878513          	add	a0,a5,1880 # 9758 <__fini_array_end+0xe4>
     bd6:	85ea                	mv	a1,s10
     bd8:	563020ef          	jal	393a <printf>
                results[i].err++;
     bdc:	47b2                	lw	a5,12(sp)
     bde:	ffc7d603          	lhu	a2,-4(a5)
            if ((results[i].execs & ID_MATRIX)
     be2:	fdc7a683          	lw	a3,-36(a5)
                results[i].err++;
     be6:	0605                	add	a2,a2,1
     be8:	fec79e23          	sh	a2,-4(a5)
            if ((results[i].execs & ID_MATRIX)
     bec:	0026f793          	and	a5,a3,2
     bf0:	cf85                	beqz	a5,c28 <main+0x382>
                && (results[i].crcmatrix != matrix_known_crc[known_id]))
     bf2:	01a987b3          	add	a5,s3,s10
     bf6:	078a                	sll	a5,a5,0x2
     bf8:	06078793          	add	a5,a5,96
     bfc:	0818                	add	a4,sp,16
     bfe:	97ba                	add	a5,a5,a4
     c00:	ff87d603          	lhu	a2,-8(a5)
     c04:	c63e                	sw	a5,12(sp)
     c06:	03760163          	beq	a2,s7,c28 <main+0x382>
                ee_printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n",
     c0a:	46d2                	lw	a3,20(sp)
     c0c:	67a5                	lui	a5,0x9
     c0e:	78878513          	add	a0,a5,1928 # 9788 <__fini_array_end+0x114>
     c12:	85ea                	mv	a1,s10
     c14:	527020ef          	jal	393a <printf>
                results[i].err++;
     c18:	47b2                	lw	a5,12(sp)
     c1a:	ffc7d603          	lhu	a2,-4(a5)
            if ((results[i].execs & ID_STATE)
     c1e:	fdc7a683          	lw	a3,-36(a5)
                results[i].err++;
     c22:	0605                	add	a2,a2,1
     c24:	fec79e23          	sh	a2,-4(a5)
                && (results[i].crcstate != state_known_crc[known_id]))
     c28:	01a987b3          	add	a5,s3,s10
     c2c:	078a                	sll	a5,a5,0x2
     c2e:	06078793          	add	a5,a5,96
     c32:	0818                	add	a4,sp,16
            if ((results[i].execs & ID_STATE)
     c34:	8a91                	and	a3,a3,4
                && (results[i].crcstate != state_known_crc[known_id]))
     c36:	97ba                	add	a5,a5,a4
            if ((results[i].execs & ID_STATE)
     c38:	fe91                	bnez	a3,b54 <main+0x2ae>
            total_errors += results[i].err;
     c3a:	ffc7d683          	lhu	a3,-4(a5)
     c3e:	bf3d                	j	b7c <main+0x2d6>
                    = (char *)(results[ctx].memblock[0]) + results[0].size * j;
     c40:	02a80733          	mul	a4,a6,a0
     c44:	9736                	add	a4,a4,a3
     c46:	de3a                	sw	a4,60(sp)
        if ((1 << (ee_u32)i) & results[0].execs)
     c48:	d0088ce3          	beqz	a7,960 <main+0xba>
                    = (char *)(results[ctx].memblock[0]) + results[0].size * j;
     c4c:	02a60633          	mul	a2,a2,a0
     c50:	96b2                	add	a3,a3,a2
     c52:	c0b6                	sw	a3,64(sp)
            j++;
     c54:	b331                	j	960 <main+0xba>
        results[0].iterations *= 1 + 10 / divisor;
     c56:	4505                	li	a0,1
     c58:	bb65                	j	a10 <main+0x16a>
    switch (seedcrc)
     c5a:	66c1                	lui	a3,0x10
     c5c:	57fd                	li	a5,-1
     c5e:	16fd                	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
     c60:	cc3e                	sw	a5,24(sp)
     c62:	80000cb7          	lui	s9,0x80000
        }
    }
    total_errors += check_data_types();
     c66:	c636                	sw	a3,12(sp)
     c68:	730020ef          	jal	3398 <check_data_types>
     c6c:	46b2                	lw	a3,12(sp)
    /* and report results */
    ee_printf("CoreMark Size    : %lu\n", (long unsigned)results[0].size);
     c6e:	4596                	lw	a1,68(sp)
    total_errors += check_data_types();
     c70:	00d509b3          	add	s3,a0,a3
    ee_printf("CoreMark Size    : %lu\n", (long unsigned)results[0].size);
     c74:	6525                	lui	a0,0x9
     c76:	7ec50513          	add	a0,a0,2028 # 97ec <__fini_array_end+0x178>
     c7a:	4c1020ef          	jal	393a <printf>
    ee_printf("Total ticks      : %lu k\n", (long unsigned)(total_time / 1000));
     c7e:	3e800613          	li	a2,1000
     c82:	4681                	li	a3,0
     c84:	8522                	mv	a0,s0
     c86:	85a6                	mv	a1,s1
     c88:	7ec060ef          	jal	7474 <__udivdi3>
     c8c:	85aa                	mv	a1,a0
     c8e:	6529                	lui	a0,0xa
     c90:	80450513          	add	a0,a0,-2044 # 9804 <__fini_array_end+0x190>
     c94:	4a7020ef          	jal	393a <printf>
#if HAS_FLOAT
    ee_printf("Total time (secs): %f\n", time_in_secs(total_time));
     c98:	8522                	mv	a0,s0
     c9a:	85a6                	mv	a1,s1
     c9c:	11b010ef          	jal	25b6 <time_in_secs>
     ca0:	862a                	mv	a2,a0
     ca2:	6529                	lui	a0,0xa
     ca4:	86ae                	mv	a3,a1
     ca6:	82050513          	add	a0,a0,-2016 # 9820 <__fini_array_end+0x1ac>
     caa:	491020ef          	jal	393a <printf>
    if (time_in_secs(total_time) > 0)
     cae:	8522                	mv	a0,s0
     cb0:	85a6                	mv	a1,s1
     cb2:	105010ef          	jal	25b6 <time_in_secs>
    total_errors += check_data_types();
     cb6:	09c2                	sll	s3,s3,0x10
    if (time_in_secs(total_time) > 0)
     cb8:	4601                	li	a2,0
     cba:	4681                	li	a3,0
    total_errors += check_data_types();
     cbc:	0109d993          	srl	s3,s3,0x10
    if (time_in_secs(total_time) > 0)
     cc0:	0a5070ef          	jal	8564 <__gedf2>
     cc4:	02a05c63          	blez	a0,cfc <main+0x456>
        ee_printf("Iterations/Sec   : %f\n",
                  default_num_contexts * results[0].iterations
     cc8:	550ca783          	lw	a5,1360(s9) # 80000550 <default_num_contexts>
        ee_printf("Iterations/Sec   : %f\n",
     ccc:	4526                	lw	a0,72(sp)
     cce:	02f50533          	mul	a0,a0,a5
     cd2:	73a080ef          	jal	940c <__floatunsidf>
     cd6:	8aaa                	mv	s5,a0
     cd8:	8a2e                	mv	s4,a1
                      / time_in_secs(total_time));
     cda:	8522                	mv	a0,s0
     cdc:	85a6                	mv	a1,s1
     cde:	0d9010ef          	jal	25b6 <time_in_secs>
     ce2:	862a                	mv	a2,a0
     ce4:	86ae                	mv	a3,a1
        ee_printf("Iterations/Sec   : %f\n",
     ce6:	8556                	mv	a0,s5
     ce8:	85d2                	mv	a1,s4
     cea:	24e070ef          	jal	7f38 <__divdf3>
     cee:	862a                	mv	a2,a0
     cf0:	6529                	lui	a0,0xa
     cf2:	86ae                	mv	a3,a1
     cf4:	83850513          	add	a0,a0,-1992 # 9838 <__fini_array_end+0x1c4>
     cf8:	443020ef          	jal	393a <printf>
    if (time_in_secs(total_time) > 0)
        ee_printf("Iterations/Sec   : %d\n",
                  default_num_contexts * results[0].iterations
                      / time_in_secs(total_time));
#endif
    if (time_in_secs(total_time) < 10)
     cfc:	8522                	mv	a0,s0
     cfe:	85a6                	mv	a1,s1
     d00:	0b7010ef          	jal	25b6 <time_in_secs>
     d04:	800007b7          	lui	a5,0x80000
     d08:	5407a603          	lw	a2,1344(a5) # 80000540 <__sglue+0x18>
     d0c:	5447a683          	lw	a3,1348(a5)
     d10:	113070ef          	jal	8622 <__ledf2>
     d14:	1a054763          	bltz	a0,ec2 <main+0x61c>
        ee_printf(
            "ERROR! Must execute for at least 10 secs for a valid result!\n");
        total_errors++;
    }

    ee_printf("Iterations       : %lu\n",
     d18:	550ca783          	lw	a5,1360(s9)
     d1c:	45a6                	lw	a1,72(sp)
     d1e:	6529                	lui	a0,0xa
     d20:	89050513          	add	a0,a0,-1904 # 9890 <__fini_array_end+0x21c>
     d24:	02f585b3          	mul	a1,a1,a5
              (long unsigned)default_num_contexts * results[0].iterations);
    ee_printf("Compiler version : %s\n", COMPILER_VERSION);
     d28:	6aa9                	lui	s5,0xa
    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
     d2a:	6b29                	lui	s6,0xa
#if (MULTITHREAD > 1)
    ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts);
#endif
    ee_printf("Memory location  : %s\n", MEM_LOCATION);
     d2c:	6a29                	lui	s4,0xa
        total_errors++;
     d2e:	09c2                	sll	s3,s3,0x10
     d30:	4109d993          	sra	s3,s3,0x10
    ee_printf("Iterations       : %lu\n",
     d34:	407020ef          	jal	393a <printf>
    ee_printf("Compiler version : %s\n", COMPILER_VERSION);
     d38:	6529                	lui	a0,0xa
     d3a:	8a8a8593          	add	a1,s5,-1880 # 98a8 <__fini_array_end+0x234>
     d3e:	8b450513          	add	a0,a0,-1868 # 98b4 <__fini_array_end+0x240>
     d42:	3f9020ef          	jal	393a <printf>
    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
     d46:	6529                	lui	a0,0xa
     d48:	8ccb0593          	add	a1,s6,-1844 # 98cc <__fini_array_end+0x258>
     d4c:	8dc50513          	add	a0,a0,-1828 # 98dc <__fini_array_end+0x268>
     d50:	3eb020ef          	jal	393a <printf>
    ee_printf("Memory location  : %s\n", MEM_LOCATION);
     d54:	6529                	lui	a0,0xa
     d56:	8f4a0593          	add	a1,s4,-1804 # 98f4 <__fini_array_end+0x280>
     d5a:	8fc50513          	add	a0,a0,-1796 # 98fc <__fini_array_end+0x288>
     d5e:	3dd020ef          	jal	393a <printf>
    /* output for verification */
    ee_printf("seedcrc          : 0x%04x\n", seedcrc);
     d62:	6529                	lui	a0,0xa
     d64:	85ca                	mv	a1,s2
     d66:	91450513          	add	a0,a0,-1772 # 9914 <__fini_array_end+0x2a0>
     d6a:	3d1020ef          	jal	393a <printf>
    if (results[0].execs & ID_LIST)
     d6e:	47b6                	lw	a5,76(sp)
     d70:	0017f693          	and	a3,a5,1
     d74:	c2a1                	beqz	a3,db4 <main+0x50e>
        for (i = 0; i < default_num_contexts; i++)
     d76:	550ca683          	lw	a3,1360(s9)
     d7a:	02d05d63          	blez	a3,db4 <main+0x50e>
     d7e:	4b81                	li	s7,0
     d80:	4581                	li	a1,0
     d82:	6929                	lui	s2,0xa
            ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
     d84:	00459793          	sll	a5,a1,0x4
     d88:	97ae                	add	a5,a5,a1
     d8a:	078a                	sll	a5,a5,0x2
     d8c:	0818                	add	a4,sp,16
     d8e:	06078793          	add	a5,a5,96
     d92:	97ba                	add	a5,a5,a4
     d94:	ff67d603          	lhu	a2,-10(a5)
     d98:	93090513          	add	a0,s2,-1744 # 9930 <__fini_array_end+0x2bc>
        for (i = 0; i < default_num_contexts; i++)
     d9c:	0b85                	add	s7,s7,1
            ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
     d9e:	39d020ef          	jal	393a <printf>
        for (i = 0; i < default_num_contexts; i++)
     da2:	550ca783          	lw	a5,1360(s9)
     da6:	0bc2                	sll	s7,s7,0x10
     da8:	010bdb93          	srl	s7,s7,0x10
     dac:	85de                	mv	a1,s7
     dae:	fcfbcbe3          	blt	s7,a5,d84 <main+0x4de>
     db2:	47b6                	lw	a5,76(sp)
    if (results[0].execs & ID_MATRIX)
     db4:	0027f693          	and	a3,a5,2
     db8:	c2a1                	beqz	a3,df8 <main+0x552>
        for (i = 0; i < default_num_contexts; i++)
     dba:	550ca683          	lw	a3,1360(s9)
     dbe:	1ed05963          	blez	a3,fb0 <main+0x70a>
     dc2:	4b81                	li	s7,0
     dc4:	4581                	li	a1,0
     dc6:	6929                	lui	s2,0xa
            ee_printf("[%d]crcmatrix     : 0x%04x\n", i, results[i].crcmatrix);
     dc8:	00459793          	sll	a5,a1,0x4
     dcc:	97ae                	add	a5,a5,a1
     dce:	078a                	sll	a5,a5,0x2
     dd0:	0818                	add	a4,sp,16
     dd2:	06078793          	add	a5,a5,96
     dd6:	97ba                	add	a5,a5,a4
     dd8:	ff87d603          	lhu	a2,-8(a5)
     ddc:	94c90513          	add	a0,s2,-1716 # 994c <__fini_array_end+0x2d8>
        for (i = 0; i < default_num_contexts; i++)
     de0:	0b85                	add	s7,s7,1
            ee_printf("[%d]crcmatrix     : 0x%04x\n", i, results[i].crcmatrix);
     de2:	359020ef          	jal	393a <printf>
        for (i = 0; i < default_num_contexts; i++)
     de6:	550ca783          	lw	a5,1360(s9)
     dea:	0bc2                	sll	s7,s7,0x10
     dec:	010bdb93          	srl	s7,s7,0x10
     df0:	85de                	mv	a1,s7
     df2:	fcfbcbe3          	blt	s7,a5,dc8 <main+0x522>
     df6:	47b6                	lw	a5,76(sp)
    if (results[0].execs & ID_STATE)
     df8:	8b91                	and	a5,a5,4
        for (i = 0; i < default_num_contexts; i++)
     dfa:	550ca683          	lw	a3,1360(s9)
    if (results[0].execs & ID_STATE)
     dfe:	cf8d                	beqz	a5,e38 <main+0x592>
        for (i = 0; i < default_num_contexts; i++)
     e00:	06d05a63          	blez	a3,e74 <main+0x5ce>
     e04:	4b81                	li	s7,0
     e06:	4581                	li	a1,0
     e08:	6929                	lui	s2,0xa
            ee_printf("[%d]crcstate      : 0x%04x\n", i, results[i].crcstate);
     e0a:	00459793          	sll	a5,a1,0x4
     e0e:	97ae                	add	a5,a5,a1
     e10:	078a                	sll	a5,a5,0x2
     e12:	0818                	add	a4,sp,16
     e14:	06078793          	add	a5,a5,96
     e18:	97ba                	add	a5,a5,a4
     e1a:	ffa7d603          	lhu	a2,-6(a5)
     e1e:	96890513          	add	a0,s2,-1688 # 9968 <__fini_array_end+0x2f4>
        for (i = 0; i < default_num_contexts; i++)
     e22:	0b85                	add	s7,s7,1
            ee_printf("[%d]crcstate      : 0x%04x\n", i, results[i].crcstate);
     e24:	317020ef          	jal	393a <printf>
        for (i = 0; i < default_num_contexts; i++)
     e28:	550ca783          	lw	a5,1360(s9)
     e2c:	0bc2                	sll	s7,s7,0x10
     e2e:	010bdb93          	srl	s7,s7,0x10
     e32:	85de                	mv	a1,s7
     e34:	fcfbcbe3          	blt	s7,a5,e0a <main+0x564>
    for (i = 0; i < default_num_contexts; i++)
     e38:	550ca783          	lw	a5,1360(s9)
     e3c:	4b81                	li	s7,0
     e3e:	4581                	li	a1,0
     e40:	6929                	lui	s2,0xa
     e42:	02f05963          	blez	a5,e74 <main+0x5ce>
        ee_printf("[%d]crcfinal      : 0x%04x\n", i, results[i].crc);
     e46:	00459793          	sll	a5,a1,0x4
     e4a:	97ae                	add	a5,a5,a1
     e4c:	078a                	sll	a5,a5,0x2
     e4e:	0818                	add	a4,sp,16
     e50:	06078793          	add	a5,a5,96
     e54:	97ba                	add	a5,a5,a4
     e56:	ff47d603          	lhu	a2,-12(a5)
     e5a:	98490513          	add	a0,s2,-1660 # 9984 <__fini_array_end+0x310>
    for (i = 0; i < default_num_contexts; i++)
     e5e:	0b85                	add	s7,s7,1
        ee_printf("[%d]crcfinal      : 0x%04x\n", i, results[i].crc);
     e60:	2db020ef          	jal	393a <printf>
    for (i = 0; i < default_num_contexts; i++)
     e64:	550ca783          	lw	a5,1360(s9)
     e68:	0bc2                	sll	s7,s7,0x10
     e6a:	010bdb93          	srl	s7,s7,0x10
     e6e:	85de                	mv	a1,s7
     e70:	fcfbcbe3          	blt	s7,a5,e46 <main+0x5a0>
    if (total_errors == 0)
     e74:	04098e63          	beqz	s3,ed0 <main+0x62a>
#endif
            ee_printf("\n");
        }
#endif
    }
    if (total_errors > 0)
     e78:	03304f63          	bgtz	s3,eb6 <main+0x610>
        ee_printf("Errors detected\n");
    if (total_errors < 0)
        ee_printf(
     e7c:	6529                	lui	a0,0xa
     e7e:	a0c50513          	add	a0,a0,-1524 # 9a0c <__fini_array_end+0x398>
     e82:	461040ef          	jal	5ae2 <puts>
            "Cannot validate operation for these seed values, please compare "
            "with results on a known platform.\n");

#if (MEM_METHOD == MEM_MALLOC)
    for (i = 0; i < MULTITHREAD; i++)
        portable_free(results[i].memblock[0]);
     e86:	5552                	lw	a0,52(sp)
     e88:	209010ef          	jal	2890 <portable_free>
#endif
    /* And last call any target specific code for finalizing */
    portable_fini(&(results[0].port));
     e8c:	06e10513          	add	a0,sp,110
     e90:	067010ef          	jal	26f6 <portable_fini>

    return MAIN_RETURN_VAL;
}
     e94:	50ba                	lw	ra,172(sp)
     e96:	542a                	lw	s0,168(sp)
     e98:	549a                	lw	s1,164(sp)
     e9a:	590a                	lw	s2,160(sp)
     e9c:	49fa                	lw	s3,156(sp)
     e9e:	4a6a                	lw	s4,152(sp)
     ea0:	4ada                	lw	s5,148(sp)
     ea2:	4b4a                	lw	s6,144(sp)
     ea4:	4bba                	lw	s7,140(sp)
     ea6:	4c2a                	lw	s8,136(sp)
     ea8:	4c9a                	lw	s9,132(sp)
     eaa:	4501                	li	a0,0
     eac:	614d                	add	sp,sp,176
     eae:	8082                	ret
     eb0:	4d0a                	lw	s10,128(sp)
     eb2:	5df6                	lw	s11,124(sp)
     eb4:	bb4d                	j	c66 <main+0x3c0>
        ee_printf("Errors detected\n");
     eb6:	6529                	lui	a0,0xa
     eb8:	a7050513          	add	a0,a0,-1424 # 9a70 <__fini_array_end+0x3fc>
     ebc:	427040ef          	jal	5ae2 <puts>
    if (total_errors < 0)
     ec0:	b7d9                	j	e86 <main+0x5e0>
        ee_printf(
     ec2:	6529                	lui	a0,0xa
     ec4:	85050513          	add	a0,a0,-1968 # 9850 <__fini_array_end+0x1dc>
     ec8:	41b040ef          	jal	5ae2 <puts>
        total_errors++;
     ecc:	0985                	add	s3,s3,1
     ece:	b5a9                	j	d18 <main+0x472>
        ee_printf(
     ed0:	6529                	lui	a0,0xa
     ed2:	9a050513          	add	a0,a0,-1632 # 99a0 <__fini_array_end+0x32c>
     ed6:	40d040ef          	jal	5ae2 <puts>
        if (known_id == 3)
     eda:	4762                	lw	a4,24(sp)
     edc:	478d                	li	a5,3
     ede:	faf714e3          	bne	a4,a5,e86 <main+0x5e0>
                      default_num_contexts * results[0].iterations
     ee2:	550ca783          	lw	a5,1360(s9)
            ee_printf("CoreMark 1.0 : %f / %s %s",
     ee6:	4526                	lw	a0,72(sp)
     ee8:	02f50533          	mul	a0,a0,a5
     eec:	520080ef          	jal	940c <__floatunsidf>
     ef0:	872a                	mv	a4,a0
     ef2:	87ae                	mv	a5,a1
                          / time_in_secs(total_time),
     ef4:	8522                	mv	a0,s0
     ef6:	85a6                	mv	a1,s1
            ee_printf("CoreMark 1.0 : %f / %s %s",
     ef8:	843e                	mv	s0,a5
     efa:	84ba                	mv	s1,a4
                          / time_in_secs(total_time),
     efc:	6ba010ef          	jal	25b6 <time_in_secs>
     f00:	862a                	mv	a2,a0
     f02:	86ae                	mv	a3,a1
            ee_printf("CoreMark 1.0 : %f / %s %s",
     f04:	8526                	mv	a0,s1
     f06:	85a2                	mv	a1,s0
     f08:	030070ef          	jal	7f38 <__divdf3>
     f0c:	862a                	mv	a2,a0
     f0e:	6529                	lui	a0,0xa
     f10:	86ae                	mv	a3,a1
     f12:	8ccb0793          	add	a5,s6,-1844
     f16:	8a8a8713          	add	a4,s5,-1880
     f1a:	9e850513          	add	a0,a0,-1560 # 99e8 <__fini_array_end+0x374>
     f1e:	21d020ef          	jal	393a <printf>
            ee_printf(" / %s", MEM_LOCATION);
     f22:	6529                	lui	a0,0xa
     f24:	8f4a0593          	add	a1,s4,-1804
     f28:	a0450513          	add	a0,a0,-1532 # 9a04 <__fini_array_end+0x390>
     f2c:	20f020ef          	jal	393a <printf>
            ee_printf("\n");
     f30:	4529                	li	a0,10
     f32:	2eb040ef          	jal	5a1c <putchar>
    if (total_errors < 0)
     f36:	bf81                	j	e86 <main+0x5e0>
            ee_printf("2K validation run parameters for coremark.\n");
     f38:	6525                	lui	a0,0x9
     f3a:	72c50513          	add	a0,a0,1836 # 972c <__fini_array_end+0xb8>
     f3e:	3a5040ef          	jal	5ae2 <puts>
            break;
     f42:	67b9                	lui	a5,0xe
     f44:	3c178b13          	add	s6,a5,961 # e3c1 <__crt0_copy_data_src_begin+0x3d89>
     f48:	6a25                	lui	s4,0x9
     f4a:	74700793          	li	a5,1863
     f4e:	d84a0a13          	add	s4,s4,-636 # 8d84 <__subdf3+0x182>
     f52:	ca3e                	sw	a5,20(sp)
            known_id = 4;
     f54:	4791                	li	a5,4
            break;
     f56:	c85a                	sw	s6,16(sp)
     f58:	8c52                	mv	s8,s4
     f5a:	74700b93          	li	s7,1863
            known_id = 4;
     f5e:	cc3e                	sw	a5,24(sp)
            break;
     f60:	bee9                	j	b3a <main+0x294>
            ee_printf("6k performance run parameters for coremark.\n");
     f62:	6525                	lui	a0,0x9
     f64:	67450513          	add	a0,a0,1652 # 9674 <__fini_array_end>
     f68:	37b040ef          	jal	5ae2 <puts>
            break;
     f6c:	6a19                	lui	s4,0x6
     f6e:	67b1                	lui	a5,0xc
     f70:	6735                	lui	a4,0xd
     f72:	e47a0a13          	add	s4,s4,-441 # 5e47 <strlen+0x5f>
     f76:	e5278b93          	add	s7,a5,-430 # be52 <__crt0_copy_data_src_begin+0x181a>
     f7a:	4b070b13          	add	s6,a4,1200 # d4b0 <__crt0_copy_data_src_begin+0x2e78>
     f7e:	ca5e                	sw	s7,20(sp)
     f80:	c85a                	sw	s6,16(sp)
     f82:	8c52                	mv	s8,s4
            known_id = 0;
     f84:	cc02                	sw	zero,24(sp)
            break;
     f86:	be55                	j	b3a <main+0x294>
            ee_printf("6k validation run parameters for coremark.\n");
     f88:	6525                	lui	a0,0x9
     f8a:	6a050513          	add	a0,a0,1696 # 96a0 <__fini_array_end+0x2c>
     f8e:	355040ef          	jal	5ae2 <puts>
            break;
     f92:	6785                	lui	a5,0x1
     f94:	6a11                	lui	s4,0x4
     f96:	670d                	lui	a4,0x3
     f98:	19978b93          	add	s7,a5,409 # 1199 <cfs_stream_4xK_Kx4.constprop.0+0x1e1>
     f9c:	9bfa0a13          	add	s4,s4,-1601 # 39bf <printf+0x85>
     fa0:	34070b13          	add	s6,a4,832 # 3340 <crc16+0x110>
            known_id = 1;
     fa4:	4785                	li	a5,1
            break;
     fa6:	ca5e                	sw	s7,20(sp)
     fa8:	c85a                	sw	s6,16(sp)
     faa:	8c52                	mv	s8,s4
            known_id = 1;
     fac:	cc3e                	sw	a5,24(sp)
            break;
     fae:	b671                	j	b3a <main+0x294>
    if (results[0].execs & ID_STATE)
     fb0:	8b91                	and	a5,a5,4
     fb2:	e80783e3          	beqz	a5,e38 <main+0x592>
     fb6:	bd7d                	j	e74 <main+0x5ce>

00000fb8 <cfs_stream_4xK_Kx4.constprop.0>:
#define CFS_B1         6
#define CFS_B2         7
#define CFS_B3         8
#define CFS_C0        16  /* .. CFS_C15 = 31 */

static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     fb8:	ffeb07b7          	lui	a5,0xffeb0
     fbc:	4709                	li	a4,2
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}

/* Stream 4×K and K×4 with systolic skew; ldaA/k_len = K, ldbB=4 */
static void cfs_stream_4xK_Kx4(const int8_t *A4xK, const int8_t *Kx4,
     fbe:	7159                	add	sp,sp,-112
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     fc0:	c398                	sw	a4,0(a5)
                               int k_len, int ldaA, int ldbB) {
  const int T = k_len + 6; /* (4-1)+(4-1) flush */
     fc2:	00660e93          	add	t4,a2,6
static void cfs_stream_4xK_Kx4(const int8_t *A4xK, const int8_t *Kx4,
     fc6:	c62a                	sw	a0,12(sp)
  cfs_clear();
  for (int t=0; t<T; t+=4){
     fc8:	55d05e63          	blez	t4,1524 <cfs_stream_4xK_Kx4.constprop.0+0x56c>
    int8_t a_bytes[4][4] = {{0}}, b_bytes[4][4] = {{0}};
    for (int i=0;i<4;i++) for (int s=0;s<4;s++){
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
     fcc:	00169793          	sll	a5,a3,0x1
     fd0:	00d78733          	add	a4,a5,a3
     fd4:	d6a2                	sw	s0,108(sp)
     fd6:	d4a6                	sw	s1,104(sp)
     fd8:	d2ca                	sw	s2,100(sp)
     fda:	d0ce                	sw	s3,96(sp)
     fdc:	ced2                	sw	s4,92(sp)
     fde:	ccd6                	sw	s5,88(sp)
     fe0:	cada                	sw	s6,84(sp)
     fe2:	c8de                	sw	s7,80(sp)
     fe4:	c6e2                	sw	s8,76(sp)
     fe6:	c4e6                	sw	s9,72(sp)
     fe8:	c2ea                	sw	s10,68(sp)
     fea:	c0ee                	sw	s11,64(sp)
     fec:	dc3e                	sw	a5,56(sp)
     fee:	ca3a                	sw	a4,20(sp)
     ff0:	842e                	mv	s0,a1
     ff2:	85b6                	mv	a1,a3
     ff4:	5ac05863          	blez	a2,15a4 <cfs_stream_4xK_Kx4.constprop.0+0x5ec>
     ff8:	00f50cb3          	add	s9,a0,a5
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     ffc:	ffeb0737          	lui	a4,0xffeb0
    1000:	40dc8bb3          	sub	s7,s9,a3
    1004:	0711                	add	a4,a4,4 # ffeb0004 <__crt0_ram_last+0x7feac005>
    1006:	ffeb06b7          	lui	a3,0xffeb0
    100a:	83aa                	mv	t2,a0
    100c:	cc3a                	sw	a4,24(sp)
    100e:	ffeb0537          	lui	a0,0xffeb0
    1012:	00868713          	add	a4,a3,8 # ffeb0008 <__crt0_ram_last+0x7feac009>
    1016:	ffeb04b7          	lui	s1,0xffeb0
    101a:	ce3a                	sw	a4,28(sp)
    101c:	00c50713          	add	a4,a0,12 # ffeb000c <__crt0_ram_last+0x7feac00d>
    1020:	ffeb0837          	lui	a6,0xffeb0
    1024:	d03a                	sw	a4,32(sp)
    1026:	01048713          	add	a4,s1,16 # ffeb0010 <__crt0_ram_last+0x7feac011>
    102a:	ffeb0fb7          	lui	t6,0xffeb0
    102e:	d23a                	sw	a4,36(sp)
    1030:	01480713          	add	a4,a6,20 # ffeb0014 <__crt0_ram_last+0x7feac015>
    1034:	ffeb0937          	lui	s2,0xffeb0
    1038:	d43a                	sw	a4,40(sp)
    103a:	018f8713          	add	a4,t6,24 # ffeb0018 <__crt0_ram_last+0x7feac019>
    103e:	ffeb09b7          	lui	s3,0xffeb0
    1042:	d63a                	sw	a4,44(sp)
    1044:	01c90713          	add	a4,s2,28 # ffeb001c <__crt0_ram_last+0x7feac01d>
    1048:	d83a                	sw	a4,48(sp)
    104a:	02098713          	add	a4,s3,32 # ffeb0020 <__crt0_ram_last+0x7feac021>
    104e:	00fb8db3          	add	s11,s7,a5
    1052:	8322                	mv	t1,s0
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1054:	5af9                	li	s5,-2
    1056:	5a7d                	li	s4,-1
    1058:	4f09                	li	t5,2
    105a:	5e75                	li	t3,-3
    105c:	428d                	li	t0,3
    105e:	4885                	li	a7,1
  for (int t=0; t<T; t+=4){
    1060:	4781                	li	a5,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
    1062:	da3a                	sw	a4,52(sp)
    1064:	4685                	li	a3,1
    1066:	de2e                	sw	a1,60(sp)
  return  ((uint32_t)(uint8_t)x0)        |
    1068:	0003c483          	lbu	s1,0(t2)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    106c:	00c8d663          	bge	a7,a2,1078 <cfs_stream_4xK_Kx4.constprop.0+0xc0>
         (((uint32_t)(uint8_t)x1) << 8)  |
    1070:	0013c703          	lbu	a4,1(t2)
    1074:	0722                	sll	a4,a4,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    1076:	8cd9                	or	s1,s1,a4
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1078:	00cf5663          	bge	t5,a2,1084 <cfs_stream_4xK_Kx4.constprop.0+0xcc>
         (((uint32_t)(uint8_t)x2) << 16) |
    107c:	0023c703          	lbu	a4,2(t2)
    1080:	0742                	sll	a4,a4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1082:	8cd9                	or	s1,s1,a4
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1084:	8752                	mv	a4,s4
    1086:	52c2d163          	bge	t0,a2,15a8 <cfs_stream_4xK_Kx4.constprop.0+0x5f0>
         (((uint32_t)(uint8_t)x3) << 24);
    108a:	0033c583          	lbu	a1,3(t2)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    108e:	4f81                	li	t6,0
         (((uint32_t)(uint8_t)x3) << 24);
    1090:	05e2                	sll	a1,a1,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1092:	8ccd                	or	s1,s1,a1
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1094:	55fd                	li	a1,-1
    1096:	50ba0d63          	beq	s4,a1,15b0 <cfs_stream_4xK_Kx4.constprop.0+0x5f8>
    109a:	4f81                	li	t6,0
    109c:	00ca5463          	bge	s4,a2,10a4 <cfs_stream_4xK_Kx4.constprop.0+0xec>
  return  ((uint32_t)(uint8_t)x0)        |
    10a0:	fffbcf83          	lbu	t6,-1(s7)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    10a4:	50c7c663          	blt	a5,a2,15b0 <cfs_stream_4xK_Kx4.constprop.0+0x5f8>
    10a8:	00c8d763          	bge	a7,a2,10b6 <cfs_stream_4xK_Kx4.constprop.0+0xfe>
         (((uint32_t)(uint8_t)x2) << 16) |
    10ac:	001bc583          	lbu	a1,1(s7)
    10b0:	05c2                	sll	a1,a1,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    10b2:	00bfefb3          	or	t6,t6,a1
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    10b6:	85d6                	mv	a1,s5
    10b8:	50cf5263          	bge	t5,a2,15bc <cfs_stream_4xK_Kx4.constprop.0+0x604>
         (((uint32_t)(uint8_t)x3) << 24);
    10bc:	002bc803          	lbu	a6,2(s7)
    10c0:	0862                	sll	a6,a6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    10c2:	010fefb3          	or	t6,t6,a6
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    10c6:	460ac163          	bltz	s5,1528 <cfs_stream_4xK_Kx4.constprop.0+0x570>
    10ca:	4901                	li	s2,0
    10cc:	00cad463          	bge	s5,a2,10d4 <cfs_stream_4xK_Kx4.constprop.0+0x11c>
  return  ((uint32_t)(uint8_t)x0)        |
    10d0:	ffecc903          	lbu	s2,-2(s9)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    10d4:	4801                	li	a6,0
    10d6:	46c74063          	blt	a4,a2,1536 <cfs_stream_4xK_Kx4.constprop.0+0x57e>
    10da:	4ec7ca63          	blt	a5,a2,15ce <cfs_stream_4xK_Kx4.constprop.0+0x616>
         (((uint32_t)(uint8_t)x1) << 8)  |
    10de:	01096933          	or	s2,s2,a6
    10e2:	c84a                	sw	s2,16(sp)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    10e4:	00c8d863          	bge	a7,a2,10f4 <cfs_stream_4xK_Kx4.constprop.0+0x13c>
         (((uint32_t)(uint8_t)x3) << 24);
    10e8:	001cc803          	lbu	a6,1(s9)
    10ec:	0862                	sll	a6,a6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    10ee:	01096833          	or	a6,s2,a6
    10f2:	c842                	sw	a6,16(sp)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    10f4:	5a0e4763          	bltz	t3,16a2 <cfs_stream_4xK_Kx4.constprop.0+0x6ea>
    10f8:	60ce5a63          	bge	t3,a2,170c <cfs_stream_4xK_Kx4.constprop.0+0x754>
  return  ((uint32_t)(uint8_t)x0)        |
    10fc:	ffddcb03          	lbu	s6,-3(s11)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1100:	4801                	li	a6,0
    1102:	0005cc63          	bltz	a1,111a <cfs_stream_4xK_Kx4.constprop.0+0x162>
    1106:	4801                	li	a6,0
    1108:	00c5d963          	bge	a1,a2,111a <cfs_stream_4xK_Kx4.constprop.0+0x162>
    110c:	4832                	lw	a6,12(sp)
    110e:	4952                	lw	s2,20(sp)
    1110:	982e                	add	a6,a6,a1
    1112:	984a                	add	a6,a6,s2
         (((uint32_t)(uint8_t)x1) << 8)  |
    1114:	00084803          	lbu	a6,0(a6)
    1118:	0822                	sll	a6,a6,0x8
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    111a:	00c75b63          	bge	a4,a2,1130 <cfs_stream_4xK_Kx4.constprop.0+0x178>
    111e:	4932                	lw	s2,12(sp)
    1120:	49d2                	lw	s3,20(sp)
    1122:	993a                	add	s2,s2,a4
    1124:	994e                	add	s2,s2,s3
         (((uint32_t)(uint8_t)x2) << 16) |
    1126:	00094903          	lbu	s2,0(s2)
    112a:	0942                	sll	s2,s2,0x10
    112c:	01286833          	or	a6,a6,s2
         (((uint32_t)(uint8_t)x1) << 8)  |
    1130:	010b6b33          	or	s6,s6,a6
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1134:	4981                	li	s3,0
    1136:	00c7d963          	bge	a5,a2,1148 <cfs_stream_4xK_Kx4.constprop.0+0x190>
         (((uint32_t)(uint8_t)x3) << 24);
    113a:	000dc803          	lbu	a6,0(s11)
  return  ((uint32_t)(uint8_t)x0)        |
    113e:	00034983          	lbu	s3,0(t1)
         (((uint32_t)(uint8_t)x3) << 24);
    1142:	0862                	sll	a6,a6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1144:	010b6b33          	or	s6,s6,a6
    }
    for (int j=0;j<4;j++) for (int s=0;s<4;s++){
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1148:	00c8d763          	bge	a7,a2,1156 <cfs_stream_4xK_Kx4.constprop.0+0x19e>
         (((uint32_t)(uint8_t)x1) << 8)  |
    114c:	00434803          	lbu	a6,4(t1)
    1150:	0822                	sll	a6,a6,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    1152:	0109e9b3          	or	s3,s3,a6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1156:	00cf5763          	bge	t5,a2,1164 <cfs_stream_4xK_Kx4.constprop.0+0x1ac>
         (((uint32_t)(uint8_t)x2) << 16) |
    115a:	00834803          	lbu	a6,8(t1)
    115e:	0842                	sll	a6,a6,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1160:	0109e9b3          	or	s3,s3,a6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1164:	48c2d263          	bge	t0,a2,15e8 <cfs_stream_4xK_Kx4.constprop.0+0x630>
         (((uint32_t)(uint8_t)x3) << 24);
    1168:	00c34803          	lbu	a6,12(t1)
    116c:	0862                	sll	a6,a6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    116e:	0109e9b3          	or	s3,s3,a6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1172:	587d                	li	a6,-1
    1174:	3d070963          	beq	a4,a6,1546 <cfs_stream_4xK_Kx4.constprop.0+0x58e>
    1178:	4801                	li	a6,0
    117a:	00c75763          	bge	a4,a2,1188 <cfs_stream_4xK_Kx4.constprop.0+0x1d0>
    117e:	00271813          	sll	a6,a4,0x2
    1182:	9822                	add	a6,a6,s0
  return  ((uint32_t)(uint8_t)x0)        |
    1184:	00184803          	lbu	a6,1(a6)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1188:	3cc7c063          	blt	a5,a2,1548 <cfs_stream_4xK_Kx4.constprop.0+0x590>
    118c:	00c8d763          	bge	a7,a2,119a <cfs_stream_4xK_Kx4.constprop.0+0x1e2>
         (((uint32_t)(uint8_t)x2) << 16) |
    1190:	00534903          	lbu	s2,5(t1)
    1194:	0942                	sll	s2,s2,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1196:	01286833          	or	a6,a6,s2
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    119a:	44cf5e63          	bge	t5,a2,15f6 <cfs_stream_4xK_Kx4.constprop.0+0x63e>
         (((uint32_t)(uint8_t)x3) << 24);
    119e:	00934903          	lbu	s2,9(t1)
    11a2:	0962                	sll	s2,s2,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    11a4:	01286833          	or	a6,a6,s2
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    11a8:	5c05c963          	bltz	a1,177a <cfs_stream_4xK_Kx4.constprop.0+0x7c2>
    11ac:	4901                	li	s2,0
    11ae:	00c5d763          	bge	a1,a2,11bc <cfs_stream_4xK_Kx4.constprop.0+0x204>
    11b2:	00259913          	sll	s2,a1,0x2
    11b6:	9922                	add	s2,s2,s0
  return  ((uint32_t)(uint8_t)x0)        |
    11b8:	00294903          	lbu	s2,2(s2)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    11bc:	52c75d63          	bge	a4,a2,16f6 <cfs_stream_4xK_Kx4.constprop.0+0x73e>
    11c0:	00271c13          	sll	s8,a4,0x2
    11c4:	9c22                	add	s8,s8,s0
         (((uint32_t)(uint8_t)x1) << 8)  |
    11c6:	002c4c03          	lbu	s8,2(s8)
    11ca:	0c22                	sll	s8,s8,0x8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    11cc:	52c7c863          	blt	a5,a2,16fc <cfs_stream_4xK_Kx4.constprop.0+0x744>
         (((uint32_t)(uint8_t)x1) << 8)  |
    11d0:	01896933          	or	s2,s2,s8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    11d4:	00c8d763          	bge	a7,a2,11e2 <cfs_stream_4xK_Kx4.constprop.0+0x22a>
         (((uint32_t)(uint8_t)x3) << 24);
    11d8:	00634c03          	lbu	s8,6(t1)
    11dc:	0c62                	sll	s8,s8,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    11de:	01896933          	or	s2,s2,s8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    11e2:	4a0e5863          	bgez	t3,1692 <cfs_stream_4xK_Kx4.constprop.0+0x6da>
    11e6:	4205c463          	bltz	a1,160e <cfs_stream_4xK_Kx4.constprop.0+0x656>
    11ea:	4d01                	li	s10,0
    11ec:	4c01                	li	s8,0
    11ee:	00c5d763          	bge	a1,a2,11fc <cfs_stream_4xK_Kx4.constprop.0+0x244>
    11f2:	058a                	sll	a1,a1,0x2
    11f4:	95a2                	add	a1,a1,s0
         (((uint32_t)(uint8_t)x1) << 8)  |
    11f6:	0035cc03          	lbu	s8,3(a1)
    11fa:	0c22                	sll	s8,s8,0x8
    11fc:	018d65b3          	or	a1,s10,s8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1200:	00c75b63          	bge	a4,a2,1216 <cfs_stream_4xK_Kx4.constprop.0+0x25e>
    1204:	070a                	sll	a4,a4,0x2
    1206:	9722                	add	a4,a4,s0
         (((uint32_t)(uint8_t)x2) << 16) |
    1208:	00374703          	lbu	a4,3(a4)
         (((uint32_t)(uint8_t)x1) << 8)  |
    120c:	018d6c33          	or	s8,s10,s8
         (((uint32_t)(uint8_t)x2) << 16) |
    1210:	0742                	sll	a4,a4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1212:	018765b3          	or	a1,a4,s8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1216:	00c7d663          	bge	a5,a2,1222 <cfs_stream_4xK_Kx4.constprop.0+0x26a>
         (((uint32_t)(uint8_t)x3) << 24);
    121a:	00334703          	lbu	a4,3(t1)
    121e:	0762                	sll	a4,a4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1220:	8dd9                	or	a1,a1,a4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
    1222:	4762                	lw	a4,24(sp)
    1224:	c304                	sw	s1,0(a4)
    1226:	4772                	lw	a4,28(sp)
    1228:	44c2                	lw	s1,16(sp)
    122a:	01f72023          	sw	t6,0(a4)
    122e:	5702                	lw	a4,32(sp)
    1230:	c304                	sw	s1,0(a4)
    1232:	5712                	lw	a4,36(sp)
    1234:	01672023          	sw	s6,0(a4)
    1238:	5722                	lw	a4,40(sp)
    123a:	01372023          	sw	s3,0(a4)
    123e:	5732                	lw	a4,44(sp)
    1240:	01072023          	sw	a6,0(a4)
    1244:	5742                	lw	a4,48(sp)
    1246:	01272023          	sw	s2,0(a4)
    124a:	5752                	lw	a4,52(sp)
    124c:	c30c                	sw	a1,0(a4)
    cfs_write(CFS_A3, pack4_s8(a_bytes[3][0],a_bytes[3][1],a_bytes[3][2],a_bytes[3][3]));
    cfs_write(CFS_B0, pack4_s8(b_bytes[0][0],b_bytes[0][1],b_bytes[0][2],b_bytes[0][3]));
    cfs_write(CFS_B1, pack4_s8(b_bytes[1][0],b_bytes[1][1],b_bytes[1][2],b_bytes[1][3]));
    cfs_write(CFS_B2, pack4_s8(b_bytes[2][0],b_bytes[2][1],b_bytes[2][2],b_bytes[2][3]));
    cfs_write(CFS_B3, pack4_s8(b_bytes[3][0],b_bytes[3][1],b_bytes[3][2],b_bytes[3][3]));
    int steps=(t+4<=T)?4:(T-t);
    124e:	4591                	li	a1,4
    1250:	31d2d263          	bge	t0,t4,1554 <cfs_stream_4xK_Kx4.constprop.0+0x59c>
    for (int s=0;s<steps;s++) cfs_step();
    1254:	4701                	li	a4,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
    1256:	c114                	sw	a3,0(a0)
    for (int s=0;s<steps;s++) cfs_step();
    1258:	0705                	add	a4,a4,1
    125a:	feb71ee3          	bne	a4,a1,1256 <cfs_stream_4xK_Kx4.constprop.0+0x29e>
  for (int t=0; t<T; t+=4){
    125e:	0791                	add	a5,a5,4 # ffeb0004 <__crt0_ram_last+0x7feac005>
    1260:	0391                	add	t2,t2,4
    1262:	0891                	add	a7,a7,4
    1264:	0291                	add	t0,t0,4
    1266:	0341                	add	t1,t1,16
    1268:	0e11                	add	t3,t3,4
    126a:	0f11                	add	t5,t5,4
    126c:	0c91                	add	s9,s9,4
    126e:	0b91                	add	s7,s7,4
    1270:	0a11                	add	s4,s4,4
    1272:	0a91                	add	s5,s5,4
    1274:	0d91                	add	s11,s11,4
    1276:	dec7c9e3          	blt	a5,a2,1068 <cfs_stream_4xK_Kx4.constprop.0+0xb0>
    127a:	55f2                	lw	a1,60(sp)
    127c:	29d7d863          	bge	a5,t4,150c <cfs_stream_4xK_Kx4.constprop.0+0x554>
    1280:	5762                	lw	a4,56(sp)
    1282:	46b2                	lw	a3,12(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
    1284:	ffeb0537          	lui	a0,0xffeb0
    1288:	00e78c33          	add	s8,a5,a4
    128c:	4752                	lw	a4,20(sp)
    128e:	ffeb04b7          	lui	s1,0xffeb0
    1292:	ffeb0e37          	lui	t3,0xffeb0
    1296:	973e                	add	a4,a4,a5
    1298:	00e68db3          	add	s11,a3,a4
    129c:	00450713          	add	a4,a0,4 # ffeb0004 <__crt0_ram_last+0x7feac005>
    12a0:	cc3a                	sw	a4,24(sp)
    12a2:	00848713          	add	a4,s1,8 # ffeb0008 <__crt0_ram_last+0x7feac009>
    12a6:	ffeb0fb7          	lui	t6,0xffeb0
    12aa:	ce3a                	sw	a4,28(sp)
    12ac:	00ce0713          	add	a4,t3,12 # ffeb000c <__crt0_ram_last+0x7feac00d>
    12b0:	ffeb0937          	lui	s2,0xffeb0
    12b4:	d03a                	sw	a4,32(sp)
    12b6:	010f8713          	add	a4,t6,16 # ffeb0010 <__crt0_ram_last+0x7feac011>
    12ba:	ffeb09b7          	lui	s3,0xffeb0
    12be:	d23a                	sw	a4,36(sp)
    12c0:	01490713          	add	a4,s2,20 # ffeb0014 <__crt0_ram_last+0x7feac015>
    12c4:	ffeb0a37          	lui	s4,0xffeb0
    12c8:	d43a                	sw	a4,40(sp)
    12ca:	01898713          	add	a4,s3,24 # ffeb0018 <__crt0_ram_last+0x7feac019>
    12ce:	ffeb0ab7          	lui	s5,0xffeb0
    12d2:	d63a                	sw	a4,44(sp)
    12d4:	01ca0713          	add	a4,s4,28 # ffeb001c <__crt0_ram_last+0x7feac01d>
    12d8:	00178813          	add	a6,a5,1
    12dc:	00279893          	sll	a7,a5,0x2
    12e0:	95be                	add	a1,a1,a5
    12e2:	d83a                	sw	a4,48(sp)
    12e4:	020a8713          	add	a4,s5,32 # ffeb0020 <__crt0_ram_last+0x7feac021>
    12e8:	9c36                	add	s8,s8,a3
    12ea:	00b683b3          	add	t2,a3,a1
    12ee:	01068cb3          	add	s9,a3,a6
    12f2:	da3a                	sw	a4,52(sp)
    12f4:	00378293          	add	t0,a5,3
    12f8:	98a2                	add	a7,a7,s0
    12fa:	ffd78313          	add	t1,a5,-3
    12fe:	00278f13          	add	t5,a5,2
    1302:	fff78b93          	add	s7,a5,-1
    1306:	ffe78b13          	add	s6,a5,-2
    130a:	ffeb06b7          	lui	a3,0xffeb0
    130e:	4705                	li	a4,1
    1310:	c822                	sw	s0,16(sp)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1312:	4401                	li	s0,0
    1314:	00c85563          	bge	a6,a2,131e <cfs_stream_4xK_Kx4.constprop.0+0x366>
         (((uint32_t)(uint8_t)x1) << 8)  |
    1318:	000cc403          	lbu	s0,0(s9)
    131c:	0422                	sll	s0,s0,0x8
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    131e:	00cf5663          	bge	t5,a2,132a <cfs_stream_4xK_Kx4.constprop.0+0x372>
         (((uint32_t)(uint8_t)x2) << 16) |
    1322:	001cc583          	lbu	a1,1(s9)
    1326:	05c2                	sll	a1,a1,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1328:	8c4d                	or	s0,s0,a1
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    132a:	85de                	mv	a1,s7
    132c:	2ac2d763          	bge	t0,a2,15da <cfs_stream_4xK_Kx4.constprop.0+0x622>
         (((uint32_t)(uint8_t)x3) << 24);
    1330:	002cc503          	lbu	a0,2(s9)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1334:	4481                	li	s1,0
         (((uint32_t)(uint8_t)x3) << 24);
    1336:	0562                	sll	a0,a0,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1338:	8c49                	or	s0,s0,a0
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    133a:	557d                	li	a0,-1
    133c:	24ab8c63          	beq	s7,a0,1594 <cfs_stream_4xK_Kx4.constprop.0+0x5dc>
    1340:	4481                	li	s1,0
    1342:	00cbd463          	bge	s7,a2,134a <cfs_stream_4xK_Kx4.constprop.0+0x392>
  return  ((uint32_t)(uint8_t)x0)        |
    1346:	fff3c483          	lbu	s1,-1(t2)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    134a:	24c7c563          	blt	a5,a2,1594 <cfs_stream_4xK_Kx4.constprop.0+0x5dc>
    134e:	00c85663          	bge	a6,a2,135a <cfs_stream_4xK_Kx4.constprop.0+0x3a2>
         (((uint32_t)(uint8_t)x2) << 16) |
    1352:	0013c503          	lbu	a0,1(t2)
    1356:	0542                	sll	a0,a0,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1358:	8cc9                	or	s1,s1,a0
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    135a:	855a                	mv	a0,s6
    135c:	2ccf5063          	bge	t5,a2,161c <cfs_stream_4xK_Kx4.constprop.0+0x664>
         (((uint32_t)(uint8_t)x3) << 24);
    1360:	0023ce03          	lbu	t3,2(t2)
    1364:	0e62                	sll	t3,t3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1366:	01c4e4b3          	or	s1,s1,t3
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    136a:	1e0b4863          	bltz	s6,155a <cfs_stream_4xK_Kx4.constprop.0+0x5a2>
    136e:	4901                	li	s2,0
    1370:	00cb5463          	bge	s6,a2,1378 <cfs_stream_4xK_Kx4.constprop.0+0x3c0>
  return  ((uint32_t)(uint8_t)x0)        |
    1374:	ffec4903          	lbu	s2,-2(s8)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1378:	4e01                	li	t3,0
    137a:	1ec5c763          	blt	a1,a2,1568 <cfs_stream_4xK_Kx4.constprop.0+0x5b0>
    137e:	1ec7ce63          	blt	a5,a2,157a <cfs_stream_4xK_Kx4.constprop.0+0x5c2>
         (((uint32_t)(uint8_t)x1) << 8)  |
    1382:	01c96933          	or	s2,s2,t3
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1386:	00c85763          	bge	a6,a2,1394 <cfs_stream_4xK_Kx4.constprop.0+0x3dc>
         (((uint32_t)(uint8_t)x3) << 24);
    138a:	001c4e03          	lbu	t3,1(s8)
    138e:	0e62                	sll	t3,t3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1390:	01c96933          	or	s2,s2,t3
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1394:	30034b63          	bltz	t1,16aa <cfs_stream_4xK_Kx4.constprop.0+0x6f2>
    1398:	38c35263          	bge	t1,a2,171c <cfs_stream_4xK_Kx4.constprop.0+0x764>
  return  ((uint32_t)(uint8_t)x0)        |
    139c:	ffddcf83          	lbu	t6,-3(s11)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    13a0:	3e054963          	bltz	a0,1792 <cfs_stream_4xK_Kx4.constprop.0+0x7da>
    13a4:	4e01                	li	t3,0
    13a6:	00c55963          	bge	a0,a2,13b8 <cfs_stream_4xK_Kx4.constprop.0+0x400>
    13aa:	4e32                	lw	t3,12(sp)
    13ac:	49d2                	lw	s3,20(sp)
    13ae:	9e2a                	add	t3,t3,a0
    13b0:	9e4e                	add	t3,t3,s3
         (((uint32_t)(uint8_t)x1) << 8)  |
    13b2:	000e4e03          	lbu	t3,0(t3)
    13b6:	0e22                	sll	t3,t3,0x8
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    13b8:	00c5db63          	bge	a1,a2,13ce <cfs_stream_4xK_Kx4.constprop.0+0x416>
    13bc:	49b2                	lw	s3,12(sp)
    13be:	4a52                	lw	s4,20(sp)
    13c0:	99ae                	add	s3,s3,a1
    13c2:	99d2                	add	s3,s3,s4
         (((uint32_t)(uint8_t)x2) << 16) |
    13c4:	0009c983          	lbu	s3,0(s3)
    13c8:	09c2                	sll	s3,s3,0x10
    13ca:	013e6e33          	or	t3,t3,s3
         (((uint32_t)(uint8_t)x1) << 8)  |
    13ce:	01fe6e33          	or	t3,t3,t6
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    13d2:	4a01                	li	s4,0
    13d4:	00c7d963          	bge	a5,a2,13e6 <cfs_stream_4xK_Kx4.constprop.0+0x42e>
         (((uint32_t)(uint8_t)x3) << 24);
    13d8:	000dcf83          	lbu	t6,0(s11)
  return  ((uint32_t)(uint8_t)x0)        |
    13dc:	0008ca03          	lbu	s4,0(a7)
         (((uint32_t)(uint8_t)x3) << 24);
    13e0:	0fe2                	sll	t6,t6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    13e2:	01fe6e33          	or	t3,t3,t6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    13e6:	00c85763          	bge	a6,a2,13f4 <cfs_stream_4xK_Kx4.constprop.0+0x43c>
         (((uint32_t)(uint8_t)x1) << 8)  |
    13ea:	0048cf83          	lbu	t6,4(a7)
    13ee:	0fa2                	sll	t6,t6,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    13f0:	01fa6a33          	or	s4,s4,t6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    13f4:	00cf5763          	bge	t5,a2,1402 <cfs_stream_4xK_Kx4.constprop.0+0x44a>
         (((uint32_t)(uint8_t)x2) << 16) |
    13f8:	0088cf83          	lbu	t6,8(a7)
    13fc:	0fc2                	sll	t6,t6,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    13fe:	01fa6a33          	or	s4,s4,t6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1402:	24c2dd63          	bge	t0,a2,165c <cfs_stream_4xK_Kx4.constprop.0+0x6a4>
         (((uint32_t)(uint8_t)x3) << 24);
    1406:	00c8cf83          	lbu	t6,12(a7)
    140a:	0fe2                	sll	t6,t6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    140c:	01fa6a33          	or	s4,s4,t6
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1410:	5ffd                	li	t6,-1
    1412:	17f58a63          	beq	a1,t6,1586 <cfs_stream_4xK_Kx4.constprop.0+0x5ce>
    1416:	4f81                	li	t6,0
    1418:	00c5d863          	bge	a1,a2,1428 <cfs_stream_4xK_Kx4.constprop.0+0x470>
    141c:	49c2                	lw	s3,16(sp)
    141e:	00259f93          	sll	t6,a1,0x2
    1422:	9fce                	add	t6,t6,s3
  return  ((uint32_t)(uint8_t)x0)        |
    1424:	001fcf83          	lbu	t6,1(t6)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1428:	16c7c063          	blt	a5,a2,1588 <cfs_stream_4xK_Kx4.constprop.0+0x5d0>
    142c:	00c85763          	bge	a6,a2,143a <cfs_stream_4xK_Kx4.constprop.0+0x482>
         (((uint32_t)(uint8_t)x2) << 16) |
    1430:	0058c983          	lbu	s3,5(a7)
    1434:	09c2                	sll	s3,s3,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1436:	013fefb3          	or	t6,t6,s3
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    143a:	20cf5063          	bge	t5,a2,163a <cfs_stream_4xK_Kx4.constprop.0+0x682>
         (((uint32_t)(uint8_t)x3) << 24);
    143e:	0098c983          	lbu	s3,9(a7)
    1442:	09e2                	sll	s3,s3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1444:	013fefb3          	or	t6,t6,s3
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1448:	32054f63          	bltz	a0,1786 <cfs_stream_4xK_Kx4.constprop.0+0x7ce>
    144c:	4981                	li	s3,0
    144e:	00c55863          	bge	a0,a2,145e <cfs_stream_4xK_Kx4.constprop.0+0x4a6>
    1452:	4ac2                	lw	s5,16(sp)
    1454:	00251993          	sll	s3,a0,0x2
    1458:	99d6                	add	s3,s3,s5
  return  ((uint32_t)(uint8_t)x0)        |
    145a:	0029c983          	lbu	s3,2(s3)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    145e:	26c5d963          	bge	a1,a2,16d0 <cfs_stream_4xK_Kx4.constprop.0+0x718>
    1462:	4d42                	lw	s10,16(sp)
    1464:	00259a93          	sll	s5,a1,0x2
    1468:	9aea                	add	s5,s5,s10
         (((uint32_t)(uint8_t)x1) << 8)  |
    146a:	002aca83          	lbu	s5,2(s5)
    146e:	0aa2                	sll	s5,s5,0x8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1470:	26c7c363          	blt	a5,a2,16d6 <cfs_stream_4xK_Kx4.constprop.0+0x71e>
         (((uint32_t)(uint8_t)x1) << 8)  |
    1474:	0159e9b3          	or	s3,s3,s5
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1478:	00c85763          	bge	a6,a2,1486 <cfs_stream_4xK_Kx4.constprop.0+0x4ce>
         (((uint32_t)(uint8_t)x3) << 24);
    147c:	0068ca83          	lbu	s5,6(a7)
    1480:	0ae2                	sll	s5,s5,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1482:	0159e9b3          	or	s3,s3,s5
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1486:	1e035263          	bgez	t1,166a <cfs_stream_4xK_Kx4.constprop.0+0x6b2>
    148a:	4d01                	li	s10,0
    148c:	1c054363          	bltz	a0,1652 <cfs_stream_4xK_Kx4.constprop.0+0x69a>
    1490:	4a81                	li	s5,0
    1492:	00c55863          	bge	a0,a2,14a2 <cfs_stream_4xK_Kx4.constprop.0+0x4ea>
    1496:	4ac2                	lw	s5,16(sp)
    1498:	050a                	sll	a0,a0,0x2
    149a:	9556                	add	a0,a0,s5
         (((uint32_t)(uint8_t)x1) << 8)  |
    149c:	00354a83          	lbu	s5,3(a0)
    14a0:	0aa2                	sll	s5,s5,0x8
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    14a2:	1cc5cd63          	blt	a1,a2,167c <cfs_stream_4xK_Kx4.constprop.0+0x6c4>
         (((uint32_t)(uint8_t)x1) << 8)  |
    14a6:	01aae5b3          	or	a1,s5,s10
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    14aa:	00c7d663          	bge	a5,a2,14b6 <cfs_stream_4xK_Kx4.constprop.0+0x4fe>
         (((uint32_t)(uint8_t)x3) << 24);
    14ae:	0038c503          	lbu	a0,3(a7)
    14b2:	0562                	sll	a0,a0,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    14b4:	8dc9                	or	a1,a1,a0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
    14b6:	4562                	lw	a0,24(sp)
    14b8:	c100                	sw	s0,0(a0)
    14ba:	4572                	lw	a0,28(sp)
    14bc:	c104                	sw	s1,0(a0)
    14be:	5502                	lw	a0,32(sp)
    14c0:	01252023          	sw	s2,0(a0)
    14c4:	5512                	lw	a0,36(sp)
    14c6:	01c52023          	sw	t3,0(a0)
    14ca:	5522                	lw	a0,40(sp)
    14cc:	01452023          	sw	s4,0(a0)
    14d0:	5532                	lw	a0,44(sp)
    14d2:	01f52023          	sw	t6,0(a0)
    14d6:	5542                	lw	a0,48(sp)
    14d8:	01352023          	sw	s3,0(a0)
    14dc:	5552                	lw	a0,52(sp)
    14de:	c10c                	sw	a1,0(a0)
    int steps=(t+4<=T)?4:(T-t);
    14e0:	4511                	li	a0,4
    14e2:	0bd2de63          	bge	t0,t4,159e <cfs_stream_4xK_Kx4.constprop.0+0x5e6>
    for (int s=0;s<steps;s++) cfs_step();
    14e6:	4581                	li	a1,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
    14e8:	c298                	sw	a4,0(a3)
    for (int s=0;s<steps;s++) cfs_step();
    14ea:	0585                	add	a1,a1,1
    14ec:	fea59ee3          	bne	a1,a0,14e8 <cfs_stream_4xK_Kx4.constprop.0+0x530>
  for (int t=0; t<T; t+=4){
    14f0:	0791                	add	a5,a5,4
    14f2:	0811                	add	a6,a6,4
    14f4:	0291                	add	t0,t0,4
    14f6:	08c1                	add	a7,a7,16
    14f8:	0311                	add	t1,t1,4
    14fa:	0f11                	add	t5,t5,4
    14fc:	0c11                	add	s8,s8,4
    14fe:	0391                	add	t2,t2,4
    1500:	0b91                	add	s7,s7,4
    1502:	0c91                	add	s9,s9,4
    1504:	0b11                	add	s6,s6,4
    1506:	0d91                	add	s11,s11,4
    1508:	e1d7c5e3          	blt	a5,t4,1312 <cfs_stream_4xK_Kx4.constprop.0+0x35a>
    150c:	5436                	lw	s0,108(sp)
    150e:	54a6                	lw	s1,104(sp)
    1510:	5916                	lw	s2,100(sp)
    1512:	5986                	lw	s3,96(sp)
    1514:	4a76                	lw	s4,92(sp)
    1516:	4ae6                	lw	s5,88(sp)
    1518:	4b56                	lw	s6,84(sp)
    151a:	4bc6                	lw	s7,80(sp)
    151c:	4c36                	lw	s8,76(sp)
    151e:	4ca6                	lw	s9,72(sp)
    1520:	4d16                	lw	s10,68(sp)
    1522:	4d86                	lw	s11,64(sp)
  }
}
    1524:	6165                	add	sp,sp,112
    1526:	8082                	ret
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1528:	55fd                	li	a1,-1
    152a:	08b70f63          	beq	a4,a1,15c8 <cfs_stream_4xK_Kx4.constprop.0+0x610>
    152e:	08c75d63          	bge	a4,a2,15c8 <cfs_stream_4xK_Kx4.constprop.0+0x610>
    1532:	4901                	li	s2,0
    1534:	55f9                	li	a1,-2
    1536:	4832                	lw	a6,12(sp)
    1538:	59e2                	lw	s3,56(sp)
    153a:	983a                	add	a6,a6,a4
    153c:	984e                	add	a6,a6,s3
         (((uint32_t)(uint8_t)x1) << 8)  |
    153e:	00084803          	lbu	a6,0(a6)
    1542:	0822                	sll	a6,a6,0x8
    1544:	be59                	j	10da <cfs_stream_4xK_Kx4.constprop.0+0x122>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1546:	4801                	li	a6,0
         (((uint32_t)(uint8_t)x1) << 8)  |
    1548:	00134903          	lbu	s2,1(t1)
    154c:	0922                	sll	s2,s2,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    154e:	01286833          	or	a6,a6,s2
    1552:	b92d                	j	118c <cfs_stream_4xK_Kx4.constprop.0+0x1d4>
    int steps=(t+4<=T)?4:(T-t);
    1554:	40fe85b3          	sub	a1,t4,a5
    for (int s=0;s<steps;s++) cfs_step();
    1558:	b9f5                	j	1254 <cfs_stream_4xK_Kx4.constprop.0+0x29c>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    155a:	557d                	li	a0,-1
    155c:	1ca58963          	beq	a1,a0,172e <cfs_stream_4xK_Kx4.constprop.0+0x776>
    1560:	1cc5d763          	bge	a1,a2,172e <cfs_stream_4xK_Kx4.constprop.0+0x776>
    1564:	4901                	li	s2,0
    1566:	5579                	li	a0,-2
    1568:	4e32                	lw	t3,12(sp)
    156a:	5fe2                	lw	t6,56(sp)
    156c:	9e2e                	add	t3,t3,a1
    156e:	9e7e                	add	t3,t3,t6
         (((uint32_t)(uint8_t)x1) << 8)  |
    1570:	000e4e03          	lbu	t3,0(t3)
    1574:	0e22                	sll	t3,t3,0x8
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1576:	e0c7d6e3          	bge	a5,a2,1382 <cfs_stream_4xK_Kx4.constprop.0+0x3ca>
         (((uint32_t)(uint8_t)x2) << 16) |
    157a:	000c4f83          	lbu	t6,0(s8)
    157e:	0fc2                	sll	t6,t6,0x10
    1580:	01fe6e33          	or	t3,t3,t6
    1584:	bbfd                	j	1382 <cfs_stream_4xK_Kx4.constprop.0+0x3ca>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1586:	4f81                	li	t6,0
         (((uint32_t)(uint8_t)x1) << 8)  |
    1588:	0018c983          	lbu	s3,1(a7)
    158c:	09a2                	sll	s3,s3,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    158e:	013fefb3          	or	t6,t6,s3
    1592:	bd69                	j	142c <cfs_stream_4xK_Kx4.constprop.0+0x474>
         (((uint32_t)(uint8_t)x1) << 8)  |
    1594:	0003c503          	lbu	a0,0(t2)
    1598:	0522                	sll	a0,a0,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    159a:	8cc9                	or	s1,s1,a0
    159c:	bb4d                	j	134e <cfs_stream_4xK_Kx4.constprop.0+0x396>
    int steps=(t+4<=T)?4:(T-t);
    159e:	40fe8533          	sub	a0,t4,a5
    for (int s=0;s<steps;s++) cfs_step();
    15a2:	b791                	j	14e6 <cfs_stream_4xK_Kx4.constprop.0+0x52e>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    15a4:	4781                	li	a5,0
    15a6:	b9e9                	j	1280 <cfs_stream_4xK_Kx4.constprop.0+0x2c8>
    15a8:	ae0799e3          	bnez	a5,109a <cfs_stream_4xK_Kx4.constprop.0+0xe2>
    15ac:	4f81                	li	t6,0
    15ae:	577d                	li	a4,-1
         (((uint32_t)(uint8_t)x1) << 8)  |
    15b0:	000bc583          	lbu	a1,0(s7)
    15b4:	05a2                	sll	a1,a1,0x8
  return  ((uint32_t)(uint8_t)x0)        |
    15b6:	00bfefb3          	or	t6,t6,a1
    15ba:	b4fd                	j	10a8 <cfs_stream_4xK_Kx4.constprop.0+0xf0>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    15bc:	4805                	li	a6,1
    15be:	b0f846e3          	blt	a6,a5,10ca <cfs_stream_4xK_Kx4.constprop.0+0x112>
    15c2:	55fd                	li	a1,-1
    15c4:	1eb71f63          	bne	a4,a1,17c2 <cfs_stream_4xK_Kx4.constprop.0+0x80a>
    15c8:	4801                	li	a6,0
    15ca:	4901                	li	s2,0
    15cc:	55f9                	li	a1,-2
         (((uint32_t)(uint8_t)x2) << 16) |
    15ce:	000cc983          	lbu	s3,0(s9)
    15d2:	09c2                	sll	s3,s3,0x10
    15d4:	01386833          	or	a6,a6,s3
    15d8:	b619                	j	10de <cfs_stream_4xK_Kx4.constprop.0+0x126>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    15da:	d60793e3          	bnez	a5,1340 <cfs_stream_4xK_Kx4.constprop.0+0x388>
    15de:	4481                	li	s1,0
    15e0:	55fd                	li	a1,-1
    15e2:	d6c7d6e3          	bge	a5,a2,134e <cfs_stream_4xK_Kx4.constprop.0+0x396>
    15e6:	b77d                	j	1594 <cfs_stream_4xK_Kx4.constprop.0+0x5dc>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    15e8:	597d                	li	s2,-1
    15ea:	4801                	li	a6,0
    15ec:	b92716e3          	bne	a4,s2,1178 <cfs_stream_4xK_Kx4.constprop.0+0x1c0>
    15f0:	b8c7dee3          	bge	a5,a2,118c <cfs_stream_4xK_Kx4.constprop.0+0x1d4>
    15f4:	bf91                	j	1548 <cfs_stream_4xK_Kx4.constprop.0+0x590>
    15f6:	ba05dbe3          	bgez	a1,11ac <cfs_stream_4xK_Kx4.constprop.0+0x1f4>
    15fa:	597d                	li	s2,-1
    15fc:	1d271163          	bne	a4,s2,17be <cfs_stream_4xK_Kx4.constprop.0+0x806>
    1600:	14c7c963          	blt	a5,a2,1752 <cfs_stream_4xK_Kx4.constprop.0+0x79a>
    1604:	4901                	li	s2,0
    1606:	bcc8c9e3          	blt	a7,a2,11d8 <cfs_stream_4xK_Kx4.constprop.0+0x220>
    160a:	080e5463          	bgez	t3,1692 <cfs_stream_4xK_Kx4.constprop.0+0x6da>
    160e:	5c7d                	li	s8,-1
    1610:	4581                	li	a1,0
    1612:	c18702e3          	beq	a4,s8,1216 <cfs_stream_4xK_Kx4.constprop.0+0x25e>
    1616:	4c01                	li	s8,0
    1618:	4d01                	li	s10,0
    161a:	b6cd                	j	11fc <cfs_stream_4xK_Kx4.constprop.0+0x244>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    161c:	4e05                	li	t3,1
    161e:	d4fe48e3          	blt	t3,a5,136e <cfs_stream_4xK_Kx4.constprop.0+0x3b6>
    1622:	557d                	li	a0,-1
    1624:	18a59a63          	bne	a1,a0,17b8 <cfs_stream_4xK_Kx4.constprop.0+0x800>
    1628:	10c04363          	bgtz	a2,172e <cfs_stream_4xK_Kx4.constprop.0+0x776>
    162c:	5579                	li	a0,-2
    162e:	4901                	li	s2,0
    1630:	4a01                	li	s4,0
    1632:	4e01                	li	t3,0
    1634:	da0359e3          	bgez	t1,13e6 <cfs_stream_4xK_Kx4.constprop.0+0x42e>
    1638:	bb75                	j	13f4 <cfs_stream_4xK_Kx4.constprop.0+0x43c>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    163a:	e00559e3          	bgez	a0,144c <cfs_stream_4xK_Kx4.constprop.0+0x494>
    163e:	59fd                	li	s3,-1
    1640:	17359a63          	bne	a1,s3,17b4 <cfs_stream_4xK_Kx4.constprop.0+0x7fc>
    1644:	12c7c163          	blt	a5,a2,1766 <cfs_stream_4xK_Kx4.constprop.0+0x7ae>
    1648:	4981                	li	s3,0
    164a:	e2c849e3          	blt	a6,a2,147c <cfs_stream_4xK_Kx4.constprop.0+0x4c4>
    164e:	00035e63          	bgez	t1,166a <cfs_stream_4xK_Kx4.constprop.0+0x6b2>
    1652:	557d                	li	a0,-1
    1654:	16a59d63          	bne	a1,a0,17ce <cfs_stream_4xK_Kx4.constprop.0+0x816>
    1658:	4581                	li	a1,0
    165a:	bd81                	j	14aa <cfs_stream_4xK_Kx4.constprop.0+0x4f2>
    165c:	59fd                	li	s3,-1
    165e:	4f81                	li	t6,0
    1660:	db359be3          	bne	a1,s3,1416 <cfs_stream_4xK_Kx4.constprop.0+0x45e>
    1664:	dcc7d4e3          	bge	a5,a2,142c <cfs_stream_4xK_Kx4.constprop.0+0x474>
    1668:	b705                	j	1588 <cfs_stream_4xK_Kx4.constprop.0+0x5d0>
    166a:	04c35c63          	bge	t1,a2,16c2 <cfs_stream_4xK_Kx4.constprop.0+0x70a>
  return  ((uint32_t)(uint8_t)x0)        |
    166e:	ff78cd03          	lbu	s10,-9(a7)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1672:	4a81                	li	s5,0
    1674:	e0055ee3          	bgez	a0,1490 <cfs_stream_4xK_Kx4.constprop.0+0x4d8>
    1678:	e2c5d7e3          	bge	a1,a2,14a6 <cfs_stream_4xK_Kx4.constprop.0+0x4ee>
    167c:	4542                	lw	a0,16(sp)
    167e:	058a                	sll	a1,a1,0x2
         (((uint32_t)(uint8_t)x1) << 8)  |
    1680:	01aaeab3          	or	s5,s5,s10
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1684:	95aa                	add	a1,a1,a0
         (((uint32_t)(uint8_t)x2) << 16) |
    1686:	0035c583          	lbu	a1,3(a1)
    168a:	05c2                	sll	a1,a1,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    168c:	0155e5b3          	or	a1,a1,s5
    1690:	bd29                	j	14aa <cfs_stream_4xK_Kx4.constprop.0+0x4f2>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1692:	04ce5a63          	bge	t3,a2,16e6 <cfs_stream_4xK_Kx4.constprop.0+0x72e>
  return  ((uint32_t)(uint8_t)x0)        |
    1696:	ff734d03          	lbu	s10,-9(t1)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    169a:	4c01                	li	s8,0
    169c:	b405d8e3          	bgez	a1,11ec <cfs_stream_4xK_Kx4.constprop.0+0x234>
    16a0:	beb1                	j	11fc <cfs_stream_4xK_Kx4.constprop.0+0x244>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    16a2:	0805cf63          	bltz	a1,1740 <cfs_stream_4xK_Kx4.constprop.0+0x788>
    16a6:	4b01                	li	s6,0
    16a8:	bcb9                	j	1106 <cfs_stream_4xK_Kx4.constprop.0+0x14e>
    16aa:	4f81                	li	t6,0
    16ac:	ce055ce3          	bgez	a0,13a4 <cfs_stream_4xK_Kx4.constprop.0+0x3ec>
    16b0:	557d                	li	a0,-1
    16b2:	0ea59063          	bne	a1,a0,1792 <cfs_stream_4xK_Kx4.constprop.0+0x7da>
    16b6:	5579                	li	a0,-2
    16b8:	4e01                	li	t3,0
    16ba:	4a01                	li	s4,0
    16bc:	d0c7cee3          	blt	a5,a2,13d8 <cfs_stream_4xK_Kx4.constprop.0+0x420>
    16c0:	bb15                	j	13f4 <cfs_stream_4xK_Kx4.constprop.0+0x43c>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    16c2:	4d01                	li	s10,0
    16c4:	dc0556e3          	bgez	a0,1490 <cfs_stream_4xK_Kx4.constprop.0+0x4d8>
    16c8:	0cc5c863          	blt	a1,a2,1798 <cfs_stream_4xK_Kx4.constprop.0+0x7e0>
    16cc:	4581                	li	a1,0
    16ce:	b3e5                	j	14b6 <cfs_stream_4xK_Kx4.constprop.0+0x4fe>
    16d0:	dac7d4e3          	bge	a5,a2,1478 <cfs_stream_4xK_Kx4.constprop.0+0x4c0>
    16d4:	4a81                	li	s5,0
         (((uint32_t)(uint8_t)x2) << 16) |
    16d6:	0028cd03          	lbu	s10,2(a7)
         (((uint32_t)(uint8_t)x1) << 8)  |
    16da:	013aeab3          	or	s5,s5,s3
         (((uint32_t)(uint8_t)x2) << 16) |
    16de:	0d42                	sll	s10,s10,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    16e0:	015d69b3          	or	s3,s10,s5
    16e4:	bb51                	j	1478 <cfs_stream_4xK_Kx4.constprop.0+0x4c0>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    16e6:	4d01                	li	s10,0
    16e8:	b005d2e3          	bgez	a1,11ec <cfs_stream_4xK_Kx4.constprop.0+0x234>
    16ec:	4581                	li	a1,0
    16ee:	b2c75ae3          	bge	a4,a2,1222 <cfs_stream_4xK_Kx4.constprop.0+0x26a>
    16f2:	4c01                	li	s8,0
    16f4:	be01                	j	1204 <cfs_stream_4xK_Kx4.constprop.0+0x24c>
    16f6:	acc7dfe3          	bge	a5,a2,11d4 <cfs_stream_4xK_Kx4.constprop.0+0x21c>
    16fa:	4c01                	li	s8,0
         (((uint32_t)(uint8_t)x2) << 16) |
    16fc:	00234d03          	lbu	s10,2(t1)
         (((uint32_t)(uint8_t)x1) << 8)  |
    1700:	01896c33          	or	s8,s2,s8
         (((uint32_t)(uint8_t)x2) << 16) |
    1704:	0d42                	sll	s10,s10,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1706:	018d6933          	or	s2,s10,s8
    170a:	b4e9                	j	11d4 <cfs_stream_4xK_Kx4.constprop.0+0x21c>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    170c:	4b01                	li	s6,0
    170e:	9e05dce3          	bgez	a1,1106 <cfs_stream_4xK_Kx4.constprop.0+0x14e>
    1712:	08c74f63          	blt	a4,a2,17b0 <cfs_stream_4xK_Kx4.constprop.0+0x7f8>
    1716:	4981                	li	s3,0
    1718:	4b01                	li	s6,0
    171a:	b43d                	j	1148 <cfs_stream_4xK_Kx4.constprop.0+0x190>
    171c:	4f81                	li	t6,0
    171e:	c80553e3          	bgez	a0,13a4 <cfs_stream_4xK_Kx4.constprop.0+0x3ec>
    1722:	5579                	li	a0,-2
    1724:	4e01                	li	t3,0
    1726:	4a01                	li	s4,0
    1728:	c8c5cae3          	blt	a1,a2,13bc <cfs_stream_4xK_Kx4.constprop.0+0x404>
    172c:	b96d                	j	13e6 <cfs_stream_4xK_Kx4.constprop.0+0x42e>
         (((uint32_t)(uint8_t)x2) << 16) |
    172e:	000c4f83          	lbu	t6,0(s8)
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1732:	4e01                	li	t3,0
    1734:	4901                	li	s2,0
         (((uint32_t)(uint8_t)x2) << 16) |
    1736:	0fc2                	sll	t6,t6,0x10
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1738:	5579                	li	a0,-2
    173a:	01fe6e33          	or	t3,t3,t6
    173e:	b191                	j	1382 <cfs_stream_4xK_Kx4.constprop.0+0x3ca>
    1740:	587d                	li	a6,-1
    1742:	09071963          	bne	a4,a6,17d4 <cfs_stream_4xK_Kx4.constprop.0+0x81c>
    1746:	4981                	li	s3,0
    1748:	4b01                	li	s6,0
    174a:	a0c7d6e3          	bge	a5,a2,1156 <cfs_stream_4xK_Kx4.constprop.0+0x19e>
    174e:	4b01                	li	s6,0
    1750:	b2ed                	j	113a <cfs_stream_4xK_Kx4.constprop.0+0x182>
         (((uint32_t)(uint8_t)x2) << 16) |
    1752:	00234d03          	lbu	s10,2(t1)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1756:	4901                	li	s2,0
    1758:	4c01                	li	s8,0
         (((uint32_t)(uint8_t)x1) << 8)  |
    175a:	01896c33          	or	s8,s2,s8
         (((uint32_t)(uint8_t)x2) << 16) |
    175e:	0d42                	sll	s10,s10,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1760:	018d6933          	or	s2,s10,s8
    1764:	bc85                	j	11d4 <cfs_stream_4xK_Kx4.constprop.0+0x21c>
         (((uint32_t)(uint8_t)x2) << 16) |
    1766:	0028cd03          	lbu	s10,2(a7)
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    176a:	4981                	li	s3,0
    176c:	4a81                	li	s5,0
         (((uint32_t)(uint8_t)x1) << 8)  |
    176e:	013aeab3          	or	s5,s5,s3
         (((uint32_t)(uint8_t)x2) << 16) |
    1772:	0d42                	sll	s10,s10,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1774:	015d69b3          	or	s3,s10,s5
    1778:	b301                	j	1478 <cfs_stream_4xK_Kx4.constprop.0+0x4c0>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    177a:	5c7d                	li	s8,-1
    177c:	4901                	li	s2,0
    177e:	a3871fe3          	bne	a4,s8,11bc <cfs_stream_4xK_Kx4.constprop.0+0x204>
    1782:	4c01                	li	s8,0
    1784:	bfa5                	j	16fc <cfs_stream_4xK_Kx4.constprop.0+0x744>
    1786:	5afd                	li	s5,-1
    1788:	4981                	li	s3,0
    178a:	cd559ae3          	bne	a1,s5,145e <cfs_stream_4xK_Kx4.constprop.0+0x4a6>
    178e:	4a81                	li	s5,0
    1790:	b799                	j	16d6 <cfs_stream_4xK_Kx4.constprop.0+0x71e>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    1792:	5579                	li	a0,-2
    1794:	4e01                	li	t3,0
    1796:	b10d                	j	13b8 <cfs_stream_4xK_Kx4.constprop.0+0x400>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    1798:	4542                	lw	a0,16(sp)
    179a:	058a                	sll	a1,a1,0x2
    179c:	4a81                	li	s5,0
    179e:	95aa                	add	a1,a1,a0
         (((uint32_t)(uint8_t)x2) << 16) |
    17a0:	0035c583          	lbu	a1,3(a1)
         (((uint32_t)(uint8_t)x1) << 8)  |
    17a4:	01aaeab3          	or	s5,s5,s10
         (((uint32_t)(uint8_t)x2) << 16) |
    17a8:	05c2                	sll	a1,a1,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    17aa:	0155e5b3          	or	a1,a1,s5
    17ae:	b9f5                	j	14aa <cfs_stream_4xK_Kx4.constprop.0+0x4f2>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    17b0:	4801                	li	a6,0
    17b2:	b2b5                	j	111e <cfs_stream_4xK_Kx4.constprop.0+0x166>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    17b4:	4981                	li	s3,0
    17b6:	b165                	j	145e <cfs_stream_4xK_Kx4.constprop.0+0x4a6>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    17b8:	4901                	li	s2,0
    17ba:	5579                	li	a0,-2
    17bc:	be75                	j	1378 <cfs_stream_4xK_Kx4.constprop.0+0x3c0>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    17be:	4901                	li	s2,0
    17c0:	baf5                	j	11bc <cfs_stream_4xK_Kx4.constprop.0+0x204>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    17c2:	4901                	li	s2,0
    17c4:	55f9                	li	a1,-2
    17c6:	4801                	li	a6,0
    17c8:	d6c747e3          	blt	a4,a2,1536 <cfs_stream_4xK_Kx4.constprop.0+0x57e>
    17cc:	b509                	j	15ce <cfs_stream_4xK_Kx4.constprop.0+0x616>
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    17ce:	4a81                	li	s5,0
    17d0:	4d01                	li	s10,0
    17d2:	b9c1                	j	14a2 <cfs_stream_4xK_Kx4.constprop.0+0x4ea>
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    17d4:	4801                	li	a6,0
    17d6:	4b01                	li	s6,0
    17d8:	b289                	j	111a <cfs_stream_4xK_Kx4.constprop.0+0x162>

000017da <core_init_matrix>:

    matrix_add_const(N, A, -val);
    return crc;
}

ee_u32 core_init_matrix(ee_u32 blksize, void *memblk, ee_s32 seed, mat_params *p){
    17da:	1141                	add	sp,sp,-16
    17dc:	c426                	sw	s1,8(sp)
    17de:	c24a                	sw	s2,4(sp)
    17e0:	882a                	mv	a6,a0
    MATDAT *A;
    MATDAT *B;
    ee_s32  order = 1;
    MATDAT  val;
    ee_u32  i = 0, j = 0;
    if (seed == 0) seed = 1;
    17e2:	e211                	bnez	a2,17e6 <core_init_matrix+0xc>
    17e4:	4605                	li	a2,1
    while (j < blksize){ i++; j = i * i * 2 * 4; }
    17e6:	4781                	li	a5,0
    17e8:	0a080c63          	beqz	a6,18a0 <core_init_matrix+0xc6>
    17ec:	853e                	mv	a0,a5
    17ee:	0785                	add	a5,a5,1
    17f0:	02f78733          	mul	a4,a5,a5
    17f4:	070e                	sll	a4,a4,0x3
    17f6:	ff076be3          	bltu	a4,a6,17ec <core_init_matrix+0x12>
    N = i - 1;
    A = (MATDAT *)align_mem(memblk);
    B = A + N * N;
    17fa:	02a502b3          	mul	t0,a0,a0
    A = (MATDAT *)align_mem(memblk);
    17fe:	15fd                	add	a1,a1,-1
    1800:	ffc5f793          	and	a5,a1,-4
    1804:	00478493          	add	s1,a5,4
    }

    p->A = A;
    p->B = B;
    p->C = (MATRES *)align_mem(B + N * N);
    p->N = N;
    1808:	892a                	mv	s2,a0
    A = (MATDAT *)align_mem(memblk);
    180a:	8e26                	mv	t3,s1
    B = A + N * N;
    180c:	0286                	sll	t0,t0,0x1
    180e:	005483b3          	add	t2,s1,t0
    for (i = 0; i < N; i++){
    1812:	c549                	beqz	a0,189c <core_init_matrix+0xc2>
    1814:	c622                	sw	s0,12(sp)
    1816:	c04e                	sw	s3,0(sp)
            seed         = ((order * seed) % 65536);
    1818:	6ec1                	lui	t4,0x10
    181a:	00150313          	add	t1,a0,1
    181e:	00151413          	sll	s0,a0,0x1
    B = A + N * N;
    1822:	8f1e                	mv	t5,t2
    for (i = 0; i < N; i++){
    1824:	4f81                	li	t6,0
    ee_s32  order = 1;
    1826:	4705                	li	a4,1
    1828:	407e0e33          	sub	t3,t3,t2
            seed         = ((order * seed) % 65536);
    182c:	1efd                	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
        for (j = 0; j < N; j++){
    182e:	89ba                	mv	s3,a4
    B = A + N * N;
    1830:	887a                	mv	a6,t5
            seed         = ((order * seed) % 65536);
    1832:	02e60633          	mul	a2,a2,a4
    1836:	01071793          	sll	a5,a4,0x10
    183a:	83c1                	srl	a5,a5,0x10
            A[i * N + j] = val;
    183c:	010e08b3          	add	a7,t3,a6
        for (j = 0; j < N; j++){
    1840:	0809                	add	a6,a6,2
            order++;
    1842:	0705                	add	a4,a4,1
            seed         = ((order * seed) % 65536);
    1844:	41f65593          	sra	a1,a2,0x1f
    1848:	81c1                	srl	a1,a1,0x10
    184a:	962e                	add	a2,a2,a1
    184c:	01d67633          	and	a2,a2,t4
    1850:	8e0d                	sub	a2,a2,a1
            val          = (seed + order);
    1852:	00c785b3          	add	a1,a5,a2
    1856:	05c2                	sll	a1,a1,0x10
    1858:	81c1                	srl	a1,a1,0x10
            val          = (val + order);
    185a:	97ae                	add	a5,a5,a1
            B[i * N + j] = val;
    185c:	feb81f23          	sh	a1,-2(a6)
            val          = matrix_clip(val, 1);
    1860:	0ff7f793          	zext.b	a5,a5
            A[i * N + j] = val;
    1864:	00f89023          	sh	a5,0(a7)
        for (j = 0; j < N; j++){
    1868:	fc6715e3          	bne	a4,t1,1832 <core_init_matrix+0x58>
    for (i = 0; i < N; i++){
    186c:	0f85                	add	t6,t6,1
    186e:	01350733          	add	a4,a0,s3
    1872:	932a                	add	t1,t1,a0
    1874:	9f22                	add	t5,t5,s0
    1876:	fbf51ce3          	bne	a0,t6,182e <core_init_matrix+0x54>
    187a:	4432                	lw	s0,12(sp)
    187c:	4982                	lw	s3,0(sp)
    p->C = (MATRES *)align_mem(B + N * N);
    187e:	005387b3          	add	a5,t2,t0
    1882:	17fd                	add	a5,a5,-1
    1884:	9bf1                	and	a5,a5,-4
    1886:	0791                	add	a5,a5,4
    p->A = A;
    1888:	c2c4                	sw	s1,4(a3)
    p->N = N;
    188a:	0126a023          	sw	s2,0(a3) # ffeb0000 <__crt0_ram_last+0x7feac001>
    p->B = B;
    188e:	0076a423          	sw	t2,8(a3)
    p->C = (MATRES *)align_mem(B + N * N);
    1892:	c6dc                	sw	a5,12(a3)
#if CORE_DEBUG
    printmat(A, N, "A");
    printmat(B, N, "B");
#endif
    return N;
}
    1894:	44a2                	lw	s1,8(sp)
    1896:	4912                	lw	s2,4(sp)
    1898:	0141                	add	sp,sp,16
    189a:	8082                	ret
    for (i = 0; i < N; i++){
    189c:	4281                	li	t0,0
    189e:	b7c5                	j	187e <core_init_matrix+0xa4>
    A = (MATDAT *)align_mem(memblk);
    18a0:	15fd                	add	a1,a1,-1
    18a2:	ffc5f393          	and	t2,a1,-4
    18a6:	00438e13          	add	t3,t2,4
    18aa:	c622                	sw	s0,12(sp)
    18ac:	c04e                	sw	s3,0(sp)
    18ae:	84f2                	mv	s1,t3
    B = A + N * N;
    18b0:	0399                	add	t2,t2,6
    18b2:	597d                	li	s2,-1
    18b4:	4289                	li	t0,2
    18b6:	557d                	li	a0,-1
    18b8:	b785                	j	1818 <core_init_matrix+0x3e>

000018ba <matrix_mul_matrix>:
}

/* =========================
 * ACCELERATED GEMM (exact)
 * ========================= */
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
    18ba:	81010113          	add	sp,sp,-2032
    18be:	7e812423          	sw	s0,2024(sp)
    18c2:	7d812423          	sw	s8,1992(sp)
    18c6:	7da12023          	sw	s10,1984(sp)
    18ca:	7e112623          	sw	ra,2028(sp)
    18ce:	7e912223          	sw	s1,2020(sp)
    18d2:	7f212023          	sw	s2,2016(sp)
    18d6:	7d312e23          	sw	s3,2012(sp)
    18da:	7d412c23          	sw	s4,2008(sp)
    18de:	7d512a23          	sw	s5,2004(sp)
    18e2:	7d612823          	sw	s6,2000(sp)
    18e6:	7d712623          	sw	s7,1996(sp)
    18ea:	7d912223          	sw	s9,1988(sp)
    18ee:	7bb12e23          	sw	s11,1980(sp)
    18f2:	ce010113          	add	sp,sp,-800
    18f6:	caaa                	sw	a0,84(sp)
                s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
            C[i * N + j] = s;
        }
    }
#else
    const ee_u32 N4 = N & ~3u; /* largest multiple of 4 ≤ N */
    18f8:	ffc57c13          	and	s8,a0,-4
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
    18fc:	cb32                	sw	a2,148(sp)
    18fe:	842e                	mv	s0,a1
    1900:	8d36                	mv	s10,a3

    /* 1) Use CFS on the core N4×N4 block */
    for (ee_u32 i0 = 0; i0 < N4; i0 += 4){
    1902:	040c0de3          	beqz	s8,215c <__neorv32_heap_size+0x15c>
    1906:	00351793          	sll	a5,a0,0x3
    190a:	00f58bb3          	add	s7,a1,a5
    190e:	00851793          	sll	a5,a0,0x8
    1912:	c93e                	sw	a5,144(sp)
      Bl[t*4 + c]   = l;
    1914:	010007b7          	lui	a5,0x1000
    1918:	76fd                	lui	a3,0xfffff
    191a:	fff78e93          	add	t4,a5,-1 # ffffff <__neorv32_rom_size+0xfeffff>
  cfs_stream_4xK_Kx4(Arows_s, Blows, KC, ldaA, ldbB);  /* a_s * l */
    191e:	6785                	lui	a5,0x1
    1920:	60068693          	add	a3,a3,1536 # fffff600 <__crt0_ram_last+0x7fffb601>
    1924:	a0078793          	add	a5,a5,-1536 # a00 <main+0x15a>
    1928:	97b6                	add	a5,a5,a3
    192a:	0998                	add	a4,sp,208
    192c:	00251913          	sll	s2,a0,0x2
    1930:	97ba                	add	a5,a5,a4
    1932:	cd36                	sw	a3,152(sp)
    1934:	00151f13          	sll	t5,a0,0x1
    1938:	8b2e                	mv	s6,a1
    for (ee_u32 i0 = 0; i0 < N4; i0 += 4){
    193a:	4c81                	li	s9,0
    193c:	4d81                	li	s11,0
  cfs_stream_4xK_Kx4(Arows_s, Blows, KC, ldaA, ldbB);  /* a_s * l */
    193e:	c8be                	sw	a5,80(sp)
    1940:	84ca                	mv	s1,s2
    1942:	df2e                	sw	a1,188(sp)
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    1944:	009b07b3          	add	a5,s6,s1
    1948:	009b8ab3          	add	s5,s7,s1
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
    194c:	8456                	mv	s0,s5
    194e:	893e                	mv	s2,a5
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    1950:	4981                	li	s3,0
    1952:	c1ee                	sw	s11,192(sp)
    1954:	c3d6                	sw	s5,196(sp)
    1956:	c5be                	sw	a5,200(sp)
    1958:	c7a6                	sw	s1,204(sp)
    195a:	c77a                	sw	t5,140(sp)

        int32_t acc[4][4] = {{0}};

        /* K-loop chunked for tiny stack footprint */
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    195c:	00199793          	sll	a5,s3,0x1
    1960:	97ea                	add	a5,a5,s10
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1962:	ffeb0737          	lui	a4,0xffeb0
    1966:	ffeb06b7          	lui	a3,0xffeb0
    196a:	c6be                	sw	a5,76(sp)
    196c:	04070793          	add	a5,a4,64 # ffeb0040 <__crt0_ram_last+0x7feac041>
        int32_t acc[4][4] = {{0}};
    1970:	4501                	li	a0,0
    1972:	4581                	li	a1,0
    1974:	4601                	li	a2,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1976:	c43e                	sw	a5,8(sp)
    1978:	04468793          	add	a5,a3,68 # ffeb0044 <__crt0_ram_last+0x7feac045>
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    197c:	c4e6                	sw	s9,72(sp)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    197e:	d14e                	sw	s3,160(sp)
    1980:	d35e                	sw	s7,164(sp)
    1982:	d766                	sw	s9,172(sp)
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    1984:	c282                	sw	zero,68(sp)
        int32_t acc[4][4] = {{0}};
    1986:	c102                	sw	zero,128(sp)
    1988:	4d81                	li	s11,0
    198a:	de82                	sw	zero,124(sp)
    198c:	d082                	sw	zero,96(sp)
    198e:	d282                	sw	zero,100(sp)
    1990:	d482                	sw	zero,104(sp)
    1992:	cc82                	sw	zero,88(sp)
    1994:	d682                	sw	zero,108(sp)
    1996:	d882                	sw	zero,112(sp)
    1998:	ce82                	sw	zero,92(sp)
    199a:	da82                	sw	zero,116(sp)
    199c:	dc82                	sw	zero,120(sp)
    199e:	4a81                	li	s5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    19a0:	c63e                	sw	a5,12(sp)
    19a2:	cf62                	sw	s8,156(sp)
    19a4:	89aa                	mv	s3,a0
    19a6:	8bae                	mv	s7,a1
    19a8:	d55a                	sw	s6,168(sp)
    19aa:	8cb2                	mv	s9,a2
    19ac:	d922                	sw	s0,176(sp)
    19ae:	db4a                	sw	s2,180(sp)
    19b0:	dd6a                	sw	s10,184(sp)
          int KC = (int)((k0 + KCHUNK <= N) ? KCHUNK : (N - k0));
    19b2:	4716                	lw	a4,68(sp)
    19b4:	4656                	lw	a2,84(sp)
    19b6:	08000693          	li	a3,128
    19ba:	87ba                	mv	a5,a4
    19bc:	08070713          	add	a4,a4,128
    19c0:	c2ba                	sw	a4,68(sp)
    19c2:	7ee66b63          	bltu	a2,a4,21b8 <__neorv32_heap_size+0x1b8>
    19c6:	47a6                	lw	a5,72(sp)
    19c8:	476a                	lw	a4,152(sp)
    19ca:	4f3a                	lw	t5,140(sp)
    19cc:	00d78833          	add	a6,a5,a3
    19d0:	6785                	lui	a5,0x1
    19d2:	a0078793          	add	a5,a5,-1536 # a00 <main+0x15a>
    19d6:	97ba                	add	a5,a5,a4
    19d8:	0998                	add	a4,sp,208
    19da:	00e78333          	add	t1,a5,a4
    19de:	47da                	lw	a5,148(sp)
    19e0:	0806                	sll	a6,a6,0x1
    19e2:	40d00e33          	neg	t3,a3
    19e6:	2d010893          	add	a7,sp,720
    19ea:	983e                	add	a6,a6,a5
    19ec:	0e06                	sll	t3,t3,0x1
    19ee:	4511                	li	a0,4
    for (int t=0;t<KC;t++){
    19f0:	010e07b3          	add	a5,t3,a6
          int KC = (int)((k0 + KCHUNK <= N) ? KCHUNK : (N - k0));
    19f4:	85c6                	mv	a1,a7
    19f6:	861a                	mv	a2,t1
      uint8_t au = (uint8_t)Ai[t];       /* low 8-bit of A (per CoreMark init) */
    19f8:	00079f83          	lh	t6,0(a5)
    for (int t=0;t<KC;t++){
    19fc:	0789                	add	a5,a5,2
    19fe:	0605                	add	a2,a2,1
      A_H[r*KC + t] = (int8_t)(au >> 7); /* 0/1 */
    1a00:	0ffff713          	zext.b	a4,t6
    1a04:	831d                	srl	a4,a4,0x7
    1a06:	00e58023          	sb	a4,0(a1)
      A_s[r*KC + t] = (int8_t)au;        /* signed 8 */
    1a0a:	fff60fa3          	sb	t6,-1(a2)
    for (int t=0;t<KC;t++){
    1a0e:	0585                	add	a1,a1,1
    1a10:	fef814e3          	bne	a6,a5,19f8 <matrix_mul_matrix+0x13e>
  for (int r=0;r<4;r++){
    1a14:	157d                	add	a0,a0,-1
    1a16:	9336                	add	t1,t1,a3
    1a18:	98b6                	add	a7,a7,a3
    1a1a:	987a                	add	a6,a6,t5
    1a1c:	f971                	bnez	a0,19f0 <matrix_mul_matrix+0x136>
  for (int t=0;t<KC;t++){
    1a1e:	6785                	lui	a5,0x1
  for (int r=0;r<4;r++){
    1a20:	4536                	lw	a0,76(sp)
    1a22:	483a                	lw	a6,140(sp)
    1a24:	80078f93          	add	t6,a5,-2048 # 800 <core_list_init+0x1c4>
    1a28:	00269093          	sll	ra,a3,0x2
    1a2c:	4d010f13          	add	t5,sp,1232
    1a30:	099c                	add	a5,sp,208
    1a32:	6d010293          	add	t0,sp,1744
    1a36:	9fbe                	add	t6,t6,a5
    1a38:	90fa                	add	ra,ra,t5
      MATDAT b = Bk[c];                      /* CoreMark B is effectively 16-bit signed */
    1a3a:	00451783          	lh	a5,4(a0)
    1a3e:	00251883          	lh	a7,2(a0)
    1a42:	00051703          	lh	a4,0(a0)
    1a46:	00651e03          	lh	t3,6(a0)
      Bl[t*4 + c]   = l;
    1a4a:	0ff8f593          	zext.b	a1,a7
    1a4e:	0ff77313          	zext.b	t1,a4
      int8_t h = (int8_t)((uint16_t)b >> 8); /* high byte as signed8 */
    1a52:	01079613          	sll	a2,a5,0x10
      Bh[t*4 + c]   = h;
    1a56:	6441                	lui	s0,0x10
      int8_t h = (int8_t)((uint16_t)b >> 8); /* high byte as signed8 */
    1a58:	0742                	sll	a4,a4,0x10
      Bl[t*4 + c]   = l;
    1a5a:	0ff7f393          	zext.b	t2,a5
      Bh[t*4 + c]   = h;
    1a5e:	f0040413          	add	s0,s0,-256 # ff00 <__crt0_copy_data_src_begin+0x58c8>
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1a62:	0075d913          	srl	s2,a1,0x7
      int8_t h = (int8_t)((uint16_t)b >> 8); /* high byte as signed8 */
    1a66:	8341                	srl	a4,a4,0x10
    1a68:	8241                	srl	a2,a2,0x10
      Bl[t*4 + c]   = l;
    1a6a:	05a2                	sll	a1,a1,0x8
      Bh[t*4 + c]   = h;
    1a6c:	0088f8b3          	and	a7,a7,s0
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1a70:	00735793          	srl	a5,t1,0x7
    1a74:	0073d493          	srl	s1,t2,0x7
      Bl[t*4 + c]   = l;
    1a78:	00b365b3          	or	a1,t1,a1
      Bh[t*4 + c]   = h;
    1a7c:	8321                	srl	a4,a4,0x8
      int8_t h = (int8_t)((uint16_t)b >> 8); /* high byte as signed8 */
    1a7e:	010e1313          	sll	t1,t3,0x10
      Bh[t*4 + c]   = h;
    1a82:	8221                	srl	a2,a2,0x8
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1a84:	0922                	sll	s2,s2,0x8
      Bl[t*4 + c]   = l;
    1a86:	0ffe7413          	zext.b	s0,t3
      Bh[t*4 + c]   = h;
    1a8a:	01176733          	or	a4,a4,a7
    1a8e:	0642                	sll	a2,a2,0x10
      Bl[t*4 + c]   = l;
    1a90:	03c2                	sll	t2,t2,0x10
      int8_t h = (int8_t)((uint16_t)b >> 8); /* high byte as signed8 */
    1a92:	01035313          	srl	t1,t1,0x10
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1a96:	0127e7b3          	or	a5,a5,s2
    1a9a:	04c2                	sll	s1,s1,0x10
      Bl[t*4 + c]   = l;
    1a9c:	0075e5b3          	or	a1,a1,t2
      Bh[t*4 + c]   = h;
    1aa0:	8f51                	or	a4,a4,a2
    1aa2:	00835313          	srl	t1,t1,0x8
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1aa6:	8fc5                	or	a5,a5,s1
    1aa8:	00745893          	srl	a7,s0,0x7
      Bl[t*4 + c]   = l;
    1aac:	01d5f633          	and	a2,a1,t4
    1ab0:	0e62                	sll	t3,t3,0x18
      Bh[t*4 + c]   = h;
    1ab2:	0362                	sll	t1,t1,0x18
    1ab4:	01d77733          	and	a4,a4,t4
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1ab8:	01889593          	sll	a1,a7,0x18
    1abc:	01d7f7b3          	and	a5,a5,t4
      Bl[t*4 + c]   = l;
    1ac0:	01c66633          	or	a2,a2,t3
      Bh[t*4 + c]   = h;
    1ac4:	00676733          	or	a4,a4,t1
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
    1ac8:	8fcd                	or	a5,a5,a1
      Bl[t*4 + c]   = l;
    1aca:	00cf2023          	sw	a2,0(t5)
      Bh[t*4 + c]   = h;
    1ace:	00e2a023          	sw	a4,0(t0)
      Lmsb[t*4 + c] = f;
    1ad2:	00ffa023          	sw	a5,0(t6)
  for (int t=0;t<KC;t++){
    1ad6:	0f11                	add	t5,t5,4
    1ad8:	9542                	add	a0,a0,a6
    1ada:	0291                	add	t0,t0,4
    1adc:	0f91                	add	t6,t6,4
    1ade:	f5e09ee3          	bne	ra,t5,1a3a <matrix_mul_matrix+0x180>
  cfs_stream_4xK_Kx4(Arows_s, Blows, KC, ldaA, ldbB);  /* a_s * l */
    1ae2:	4546                	lw	a0,80(sp)
    1ae4:	8636                	mv	a2,a3
    1ae6:	4d010593          	add	a1,sp,1232
    1aea:	c336                	sw	a3,132(sp)
    1aec:	cccff0ef          	jal	fb8 <cfs_stream_4xK_Kx4.constprop.0>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1af0:	ffeb04b7          	lui	s1,0xffeb0
    1af4:	ffeb0fb7          	lui	t6,0xffeb0
    1af8:	074f8093          	add	ra,t6,116 # ffeb0074 <__crt0_ram_last+0x7feac075>
    1afc:	06048893          	add	a7,s1,96 # ffeb0060 <__crt0_ram_last+0x7feac061>
    1b00:	4fb2                	lw	t6,12(sp)
    1b02:	44a2                	lw	s1,8(sp)
    1b04:	ffeb0437          	lui	s0,0xffeb0
    1b08:	ffeb0937          	lui	s2,0xffeb0
    1b0c:	05c40813          	add	a6,s0,92 # ffeb005c <__crt0_ram_last+0x7feac05d>
    1b10:	ffeb0f37          	lui	t5,0xffeb0
    1b14:	07c90413          	add	s0,s2,124 # ffeb007c <__crt0_ram_last+0x7feac07d>
    1b18:	ffeb07b7          	lui	a5,0xffeb0
    1b1c:	ffeb0737          	lui	a4,0xffeb0
    1b20:	ffeb06b7          	lui	a3,0xffeb0
    1b24:	ffeb0637          	lui	a2,0xffeb0
    1b28:	ffeb05b7          	lui	a1,0xffeb0
    1b2c:	ffeb0337          	lui	t1,0xffeb0
    1b30:	ffeb0eb7          	lui	t4,0xffeb0
    1b34:	ffeb0e37          	lui	t3,0xffeb0
    1b38:	06ce8e93          	add	t4,t4,108 # ffeb006c <__crt0_ram_last+0x7feac06d>
    1b3c:	070f0393          	add	t2,t5,112 # ffeb0070 <__crt0_ram_last+0x7feac071>
    1b40:	ffeb02b7          	lui	t0,0xffeb0
    1b44:	04878793          	add	a5,a5,72 # ffeb0048 <__crt0_ram_last+0x7feac049>
    1b48:	04c70713          	add	a4,a4,76 # ffeb004c <__crt0_ram_last+0x7feac04d>
    1b4c:	05068693          	add	a3,a3,80 # ffeb0050 <__crt0_ram_last+0x7feac051>
    1b50:	05460613          	add	a2,a2,84 # ffeb0054 <__crt0_ram_last+0x7feac055>
    1b54:	05858593          	add	a1,a1,88 # ffeb0058 <__crt0_ram_last+0x7feac059>
    1b58:	06430313          	add	t1,t1,100 # ffeb0064 <__crt0_ram_last+0x7feac065>
    1b5c:	c222                	sw	s0,4(sp)
    1b5e:	068e0e13          	add	t3,t3,104 # ffeb0068 <__crt0_ram_last+0x7feac069>
    1b62:	0004ad03          	lw	s10,0(s1)
    1b66:	07828513          	add	a0,t0,120 # ffeb0078 <__crt0_ram_last+0x7feac079>
    1b6a:	000fac03          	lw	s8,0(t6)
    1b6e:	0007ab03          	lw	s6,0(a5)
    1b72:	00072a03          	lw	s4,0(a4)
    1b76:	0006a903          	lw	s2,0(a3)
    1b7a:	4204                	lw	s1,0(a2)
    1b7c:	4180                	lw	s0,0(a1)
    1b7e:	00082283          	lw	t0,0(a6)
    1b82:	0008af83          	lw	t6,0(a7)
    1b86:	d446                	sw	a7,40(sp)
    1b88:	00032f03          	lw	t5,0(t1)
    1b8c:	d61a                	sw	t1,44(sp)
    1b8e:	d872                	sw	t3,48(sp)
    1b90:	000e2e03          	lw	t3,0(t3)
    1b94:	000ea303          	lw	t1,0(t4)
    1b98:	0003a883          	lw	a7,0(t2)
    1b9c:	dc1e                	sw	t2,56(sp)
    1b9e:	4392                	lw	t2,4(sp)
    1ba0:	da76                	sw	t4,52(sp)
    1ba2:	de06                	sw	ra,60(sp)
    1ba4:	ca3a                	sw	a4,20(sp)
    1ba6:	cc36                	sw	a3,24(sp)
    1ba8:	ce32                	sw	a2,28(sp)
    1baa:	d02e                	sw	a1,32(sp)
    1bac:	d242                	sw	a6,36(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += tmp[i][j];
    1bae:	9a4e                	add	s4,s4,s3
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1bb0:	0000a803          	lw	a6,0(ra)
    1bb4:	c83e                	sw	a5,16(sp)
    1bb6:	4118                	lw	a4,0(a0)
    1bb8:	c0aa                	sw	a0,64(sp)
    1bba:	0003a783          	lw	a5,0(t2)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += tmp[i][j];
    1bbe:	59e6                	lw	s3,120(sp)
    1bc0:	9b56                	add	s6,s6,s5
    1bc2:	4ae6                	lw	s5,88(sp)
    1bc4:	994e                	add	s2,s2,s3
    1bc6:	59d6                	lw	s3,116(sp)
    1bc8:	9dba                	add	s11,s11,a4
  cfs_stream_4xK_Kx4(Arows_s, Bhigs, KC, ldaA, ldbB);  /* (a_s*h)<<8 */
    1bca:	469a                	lw	a3,132(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += tmp[i][j];
    1bcc:	94ce                	add	s1,s1,s3
    1bce:	49f6                	lw	s3,92(sp)
    1bd0:	9afa                	add	s5,s5,t5
    1bd2:	9d66                	add	s10,s10,s9
    1bd4:	944e                	add	s0,s0,s3
    1bd6:	59c6                	lw	s3,112(sp)
    1bd8:	5c96                	lw	s9,100(sp)
    1bda:	5f06                	lw	t5,96(sp)
    1bdc:	92ce                	add	t0,t0,s3
    1bde:	9c5e                	add	s8,s8,s7
    1be0:	59b6                	lw	s3,108(sp)
    1be2:	5ba6                	lw	s7,104(sp)
    1be4:	ce96                	sw	t0,92(sp)
    1be6:	c36e                	sw	s11,132(sp)
    1be8:	52f6                	lw	t0,124(sp)
    1bea:	4d8a                	lw	s11,128(sp)
  cfs_stream_4xK_Kx4(Arows_s, Bhigs, KC, ldaA, ldbB);  /* (a_s*h)<<8 */
    1bec:	4546                	lw	a0,80(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += tmp[i][j];
    1bee:	99fe                	add	s3,s3,t6
    1bf0:	9bf2                	add	s7,s7,t3
    1bf2:	9c9a                	add	s9,s9,t1
    1bf4:	9f46                	add	t5,t5,a7
    1bf6:	92c2                	add	t0,t0,a6
    1bf8:	9dbe                	add	s11,s11,a5
  cfs_stream_4xK_Kx4(Arows_s, Bhigs, KC, ldaA, ldbB);  /* (a_s*h)<<8 */
    1bfa:	8636                	mv	a2,a3
    1bfc:	6d010593          	add	a1,sp,1744
    1c00:	c536                	sw	a3,136(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += tmp[i][j];
    1c02:	d6ce                	sw	s3,108(sp)
    1c04:	d8d6                	sw	s5,112(sp)
    1c06:	d4de                	sw	s7,104(sp)
    1c08:	dae6                	sw	s9,116(sp)
    1c0a:	dcfa                	sw	t5,120(sp)
    1c0c:	de96                	sw	t0,124(sp)
    1c0e:	c16e                	sw	s11,128(sp)
  cfs_stream_4xK_Kx4(Arows_s, Bhigs, KC, ldaA, ldbB);  /* (a_s*h)<<8 */
    1c10:	ba8ff0ef          	jal	fb8 <cfs_stream_4xK_Kx4.constprop.0>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1c14:	4f22                	lw	t5,8(sp)
    1c16:	4fb2                	lw	t6,12(sp)
    1c18:	47c2                	lw	a5,16(sp)
    1c1a:	4752                	lw	a4,20(sp)
    1c1c:	46e2                	lw	a3,24(sp)
    1c1e:	4672                	lw	a2,28(sp)
    1c20:	5582                	lw	a1,32(sp)
    1c22:	000f2d83          	lw	s11,0(t5)
    1c26:	5812                	lw	a6,36(sp)
    1c28:	000fac83          	lw	s9,0(t6)
    1c2c:	0007ab83          	lw	s7,0(a5)
    1c30:	00072a83          	lw	s5,0(a4)
    1c34:	0006a983          	lw	s3,0(a3)
    1c38:	00062083          	lw	ra,0(a2)
    1c3c:	0005a383          	lw	t2,0(a1)
    1c40:	58a2                	lw	a7,40(sp)
    1c42:	5332                	lw	t1,44(sp)
    1c44:	5ed2                	lw	t4,52(sp)
    1c46:	5562                	lw	a0,56(sp)
    1c48:	5772                	lw	a4,60(sp)
    1c4a:	4612                	lw	a2,4(sp)
    1c4c:	5e42                	lw	t3,48(sp)
    1c4e:	4686                	lw	a3,64(sp)
    1c50:	00082283          	lw	t0,0(a6)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1c54:	03a2                	sll	t2,t2,0x8
    1c56:	0da2                	sll	s11,s11,0x8
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1c58:	0008af83          	lw	t6,0(a7)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1c5c:	9d6e                	add	s10,s10,s11
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1c5e:	00032f03          	lw	t5,0(t1)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1c62:	00838db3          	add	s11,t2,s0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1c66:	000e2e03          	lw	t3,0(t3)
    1c6a:	000ea303          	lw	t1,0(t4)
    1c6e:	00052883          	lw	a7,0(a0)
    1c72:	00072803          	lw	a6,0(a4)
    1c76:	4298                	lw	a4,0(a3)
    1c78:	421c                	lw	a5,0(a2)
  cfs_stream_4xK_Kx4(Arows_H, Blows, KC, ldaA, ldbB);  /* (H*l)<<8 */
    1c7a:	46aa                	lw	a3,136(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1c7c:	4476                	lw	s0,92(sp)
    1c7e:	09a2                	sll	s3,s3,0x8
    1c80:	994e                	add	s2,s2,s3
    1c82:	00a2                	sll	ra,ra,0x8
    1c84:	59b6                	lw	s3,108(sp)
    1c86:	02a2                	sll	t0,t0,0x8
    1c88:	9486                	add	s1,s1,ra
    1c8a:	008280b3          	add	ra,t0,s0
    1c8e:	5466                	lw	s0,120(sp)
    1c90:	0fa2                	sll	t6,t6,0x8
    1c92:	99fe                	add	s3,s3,t6
    1c94:	08a2                	sll	a7,a7,0x8
    1c96:	cece                	sw	s3,92(sp)
    1c98:	008889b3          	add	s3,a7,s0
    1c9c:	441a                	lw	s0,132(sp)
    1c9e:	0722                	sll	a4,a4,0x8
    1ca0:	0aa2                	sll	s5,s5,0x8
    1ca2:	943a                	add	s0,s0,a4
    1ca4:	9a56                	add	s4,s4,s5
    1ca6:	0ca2                	sll	s9,s9,0x8
    1ca8:	5ac6                	lw	s5,112(sp)
    1caa:	0ba2                	sll	s7,s7,0x8
    1cac:	52f6                	lw	t0,124(sp)
    1cae:	9c66                	add	s8,s8,s9
    1cb0:	9b5e                	add	s6,s6,s7
    1cb2:	5cd6                	lw	s9,116(sp)
    1cb4:	5ba6                	lw	s7,104(sp)
    1cb6:	daa2                	sw	s0,116(sp)
    1cb8:	440a                	lw	s0,128(sp)
    1cba:	0f22                	sll	t5,t5,0x8
    1cbc:	9afa                	add	s5,s5,t5
    1cbe:	0e22                	sll	t3,t3,0x8
    1cc0:	0322                	sll	t1,t1,0x8
    1cc2:	0822                	sll	a6,a6,0x8
    1cc4:	07a2                	sll	a5,a5,0x8
  cfs_stream_4xK_Kx4(Arows_H, Blows, KC, ldaA, ldbB);  /* (H*l)<<8 */
    1cc6:	2d010e93          	add	t4,sp,720
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1cca:	9bf2                	add	s7,s7,t3
    1ccc:	9c9a                	add	s9,s9,t1
    1cce:	943e                	add	s0,s0,a5
  cfs_stream_4xK_Kx4(Arows_H, Blows, KC, ldaA, ldbB);  /* (H*l)<<8 */
    1cd0:	8636                	mv	a2,a3
    1cd2:	8576                	mv	a0,t4
    1cd4:	4d010593          	add	a1,sp,1232
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1cd8:	d0d6                	sw	s5,96(sp)
    1cda:	00580ab3          	add	s5,a6,t0
    1cde:	cc86                	sw	ra,88(sp)
    1ce0:	d2de                	sw	s7,100(sp)
    1ce2:	d4e6                	sw	s9,104(sp)
    1ce4:	d6ce                	sw	s3,108(sp)
    1ce6:	d8d6                	sw	s5,112(sp)
    1ce8:	dca2                	sw	s0,120(sp)
  cfs_stream_4xK_Kx4(Arows_H, Blows, KC, ldaA, ldbB);  /* (H*l)<<8 */
    1cea:	aceff0ef          	jal	fb8 <cfs_stream_4xK_Kx4.constprop.0>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1cee:	4f22                	lw	t5,8(sp)
    1cf0:	4fb2                	lw	t6,12(sp)
    1cf2:	47c2                	lw	a5,16(sp)
    1cf4:	4752                	lw	a4,20(sp)
    1cf6:	46e2                	lw	a3,24(sp)
    1cf8:	4672                	lw	a2,28(sp)
    1cfa:	000f2c83          	lw	s9,0(t5)
    1cfe:	5582                	lw	a1,32(sp)
    1d00:	000fab83          	lw	s7,0(t6)
    1d04:	5812                	lw	a6,36(sp)
    1d06:	0007aa83          	lw	s5,0(a5)
    1d0a:	00072983          	lw	s3,0(a4)
    1d0e:	4280                	lw	s0,0(a3)
    1d10:	00062083          	lw	ra,0(a2)
    1d14:	58a2                	lw	a7,40(sp)
    1d16:	5332                	lw	t1,44(sp)
    1d18:	5ed2                	lw	t4,52(sp)
    1d1a:	5562                	lw	a0,56(sp)
    1d1c:	5772                	lw	a4,60(sp)
    1d1e:	4612                	lw	a2,4(sp)
    1d20:	5e42                	lw	t3,48(sp)
    1d22:	4686                	lw	a3,64(sp)
    1d24:	0005a383          	lw	t2,0(a1)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1d28:	00a2                	sll	ra,ra,0x8
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1d2a:	00082283          	lw	t0,0(a6)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1d2e:	9486                	add	s1,s1,ra
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1d30:	0008af83          	lw	t6,0(a7)
    1d34:	00032f03          	lw	t5,0(t1)
    1d38:	000e2e03          	lw	t3,0(t3)
    1d3c:	000ea303          	lw	t1,0(t4)
    1d40:	00052883          	lw	a7,0(a0)
    1d44:	00072803          	lw	a6,0(a4)
    1d48:	4298                	lw	a4,0(a3)
    1d4a:	421c                	lw	a5,0(a2)
  cfs_stream_4xK_Kx4(Arows_H, Bhigs, KC, ldaA, ldbB);  /* (H*h)<<16 */
    1d4c:	46aa                	lw	a3,136(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1d4e:	40e6                	lw	ra,88(sp)
    1d50:	02a2                	sll	t0,t0,0x8
    1d52:	0422                	sll	s0,s0,0x8
    1d54:	944a                	add	s0,s0,s2
    1d56:	00128933          	add	s2,t0,ra
    1d5a:	42f6                	lw	t0,92(sp)
    1d5c:	0fa2                	sll	t6,t6,0x8
    1d5e:	09a2                	sll	s3,s3,0x8
    1d60:	99d2                	add	s3,s3,s4
    1d62:	005f8a33          	add	s4,t6,t0
    1d66:	5286                	lw	t0,96(sp)
    1d68:	0f22                	sll	t5,t5,0x8
    1d6a:	0aa2                	sll	s5,s5,0x8
    1d6c:	9ada                	add	s5,s5,s6
    1d6e:	005f0b33          	add	s6,t5,t0
    1d72:	5296                	lw	t0,100(sp)
    1d74:	0e22                	sll	t3,t3,0x8
    1d76:	0ba2                	sll	s7,s7,0x8
    1d78:	9be2                	add	s7,s7,s8
    1d7a:	005e0c33          	add	s8,t3,t0
    1d7e:	52a6                	lw	t0,104(sp)
    1d80:	0322                	sll	t1,t1,0x8
    1d82:	0ca2                	sll	s9,s9,0x8
    1d84:	9cea                	add	s9,s9,s10
    1d86:	00530d33          	add	s10,t1,t0
    1d8a:	52b6                	lw	t0,108(sp)
    1d8c:	08a2                	sll	a7,a7,0x8
    1d8e:	0822                	sll	a6,a6,0x8
    1d90:	005880b3          	add	ra,a7,t0
    1d94:	52c6                	lw	t0,112(sp)
    1d96:	03a2                	sll	t2,t2,0x8
    1d98:	9d9e                	add	s11,s11,t2
    1d9a:	005803b3          	add	t2,a6,t0
    1d9e:	52d6                	lw	t0,116(sp)
    1da0:	0722                	sll	a4,a4,0x8
    1da2:	07a2                	sll	a5,a5,0x8
    1da4:	92ba                	add	t0,t0,a4
    1da6:	da96                	sw	t0,116(sp)
    1da8:	52e6                	lw	t0,120(sp)
  cfs_stream_4xK_Kx4(Arows_H, Bhigs, KC, ldaA, ldbB);  /* (H*h)<<16 */
    1daa:	2d010e93          	add	t4,sp,720
    1dae:	8636                	mv	a2,a3
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1db0:	92be                	add	t0,t0,a5
  cfs_stream_4xK_Kx4(Arows_H, Bhigs, KC, ldaA, ldbB);  /* (H*h)<<16 */
    1db2:	8576                	mv	a0,t4
    1db4:	6d010593          	add	a1,sp,1744
    1db8:	deb6                	sw	a3,124(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1dba:	ccca                	sw	s2,88(sp)
    1dbc:	ced2                	sw	s4,92(sp)
    1dbe:	d0da                	sw	s6,96(sp)
    1dc0:	d2e2                	sw	s8,100(sp)
    1dc2:	d4ea                	sw	s10,104(sp)
    1dc4:	d686                	sw	ra,108(sp)
    1dc6:	d89e                	sw	t2,112(sp)
    1dc8:	dc96                	sw	t0,120(sp)
  cfs_stream_4xK_Kx4(Arows_H, Bhigs, KC, ldaA, ldbB);  /* (H*h)<<16 */
    1dca:	9eeff0ef          	jal	fb8 <cfs_stream_4xK_Kx4.constprop.0>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1dce:	4f22                	lw	t5,8(sp)
    1dd0:	4fb2                	lw	t6,12(sp)
    1dd2:	47c2                	lw	a5,16(sp)
    1dd4:	4752                	lw	a4,20(sp)
    1dd6:	46e2                	lw	a3,24(sp)
    1dd8:	4672                	lw	a2,28(sp)
    1dda:	000f2d03          	lw	s10,0(t5)
    1dde:	5582                	lw	a1,32(sp)
    1de0:	000fac03          	lw	s8,0(t6)
    1de4:	5812                	lw	a6,36(sp)
    1de6:	0007ab03          	lw	s6,0(a5)
    1dea:	00072a03          	lw	s4,0(a4)
    1dee:	0006a903          	lw	s2,0(a3)
    1df2:	5ed2                	lw	t4,52(sp)
    1df4:	00062083          	lw	ra,0(a2)
    1df8:	58a2                	lw	a7,40(sp)
    1dfa:	5332                	lw	t1,44(sp)
    1dfc:	5562                	lw	a0,56(sp)
    1dfe:	5772                	lw	a4,60(sp)
    1e00:	4612                	lw	a2,4(sp)
    1e02:	5e42                	lw	t3,48(sp)
    1e04:	4686                	lw	a3,64(sp)
    1e06:	0005a383          	lw	t2,0(a1)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e0a:	0942                	sll	s2,s2,0x10
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1e0c:	00082283          	lw	t0,0(a6)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e10:	944a                	add	s0,s0,s2
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1e12:	0008af83          	lw	t6,0(a7)
    1e16:	00032f03          	lw	t5,0(t1)
    1e1a:	000e2e03          	lw	t3,0(t3)
    1e1e:	000ea303          	lw	t1,0(t4)
    1e22:	00052883          	lw	a7,0(a0)
    1e26:	00072803          	lw	a6,0(a4)
    1e2a:	4298                	lw	a4,0(a3)
    1e2c:	421c                	lw	a5,0(a2)
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1e2e:	56f6                	lw	a3,124(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e30:	4966                	lw	s2,88(sp)
    1e32:	02c2                	sll	t0,t0,0x10
    1e34:	0a42                	sll	s4,s4,0x10
    1e36:	9916                	add	s2,s2,t0
    1e38:	52d6                	lw	t0,116(sp)
    1e3a:	0742                	sll	a4,a4,0x10
    1e3c:	0d42                	sll	s10,s10,0x10
    1e3e:	0c42                	sll	s8,s8,0x10
    1e40:	0b42                	sll	s6,s6,0x10
    1e42:	00c2                	sll	ra,ra,0x10
    1e44:	03c2                	sll	t2,t2,0x10
    1e46:	99d2                	add	s3,s3,s4
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1e48:	6585                	lui	a1,0x1
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e4a:	4a76                	lw	s4,92(sp)
    1e4c:	9d9e                	add	s11,s11,t2
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1e4e:	0988                	add	a0,sp,208
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e50:	53c6                	lw	t2,112(sp)
    1e52:	9cea                	add	s9,s9,s10
    1e54:	9be2                	add	s7,s7,s8
    1e56:	5d26                	lw	s10,104(sp)
    1e58:	5c16                	lw	s8,100(sp)
    1e5a:	9ada                	add	s5,s5,s6
    1e5c:	9486                	add	s1,s1,ra
    1e5e:	5b06                	lw	s6,96(sp)
    1e60:	50b6                	lw	ra,108(sp)
    1e62:	ccca                	sw	s2,88(sp)
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1e64:	80058593          	add	a1,a1,-2048 # 800 <core_list_init+0x1c4>
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e68:	00570933          	add	s2,a4,t0
    1e6c:	52e6                	lw	t0,120(sp)
    1e6e:	0fc2                	sll	t6,t6,0x10
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1e70:	95aa                	add	a1,a1,a0
    1e72:	4546                	lw	a0,80(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e74:	9a7e                	add	s4,s4,t6
    1e76:	0f42                	sll	t5,t5,0x10
    1e78:	0e42                	sll	t3,t3,0x10
    1e7a:	0342                	sll	t1,t1,0x10
    1e7c:	08c2                	sll	a7,a7,0x10
    1e7e:	0842                	sll	a6,a6,0x10
    1e80:	07c2                	sll	a5,a5,0x10
    1e82:	9b7a                	add	s6,s6,t5
    1e84:	9c72                	add	s8,s8,t3
    1e86:	9d1a                	add	s10,s10,t1
    1e88:	90c6                	add	ra,ra,a7
    1e8a:	93c2                	add	t2,t2,a6
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1e8c:	8636                	mv	a2,a3
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1e8e:	ced2                	sw	s4,92(sp)
    1e90:	00578a33          	add	s4,a5,t0
    1e94:	d0da                	sw	s6,96(sp)
    1e96:	d2e2                	sw	s8,100(sp)
    1e98:	d4ea                	sw	s10,104(sp)
    1e9a:	d686                	sw	ra,108(sp)
    1e9c:	d89e                	sw	t2,112(sp)
    1e9e:	daca                	sw	s2,116(sp)
    1ea0:	dcd2                	sw	s4,120(sp)
  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
    1ea2:	916ff0ef          	jal	fb8 <cfs_stream_4xK_Kx4.constprop.0>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1ea6:	4f22                	lw	t5,8(sp)
    1ea8:	4fb2                	lw	t6,12(sp)
    1eaa:	47c2                	lw	a5,16(sp)
    1eac:	4752                	lw	a4,20(sp)
    1eae:	46e2                	lw	a3,24(sp)
    1eb0:	4672                	lw	a2,28(sp)
    1eb2:	5582                	lw	a1,32(sp)
    1eb4:	5ed2                	lw	t4,52(sp)
    1eb6:	5812                	lw	a6,36(sp)
    1eb8:	58a2                	lw	a7,40(sp)
    1eba:	5332                	lw	t1,44(sp)
    1ebc:	5e42                	lw	t3,48(sp)
    1ebe:	5562                	lw	a0,56(sp)
    1ec0:	000f2d03          	lw	s10,0(t5)
    1ec4:	000fac03          	lw	s8,0(t6)
    1ec8:	0007ab03          	lw	s6,0(a5)
    1ecc:	00072a03          	lw	s4,0(a4)
    1ed0:	0006a903          	lw	s2,0(a3)
    1ed4:	00062083          	lw	ra,0(a2)
    1ed8:	0005a383          	lw	t2,0(a1)
    1edc:	4612                	lw	a2,4(sp)
    1ede:	00082283          	lw	t0,0(a6)
    1ee2:	4686                	lw	a3,64(sp)
    1ee4:	0008af83          	lw	t6,0(a7)
    1ee8:	00032783          	lw	a5,0(t1)
    1eec:	000e2f03          	lw	t5,0(t3)
    1ef0:	000eae03          	lw	t3,0(t4)
    1ef4:	00052303          	lw	t1,0(a0)
    1ef8:	5572                	lw	a0,60(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1efa:	0922                	sll	s2,s2,0x8
    1efc:	03a2                	sll	t2,t2,0x8
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1efe:	00052883          	lw	a7,0(a0)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f02:	944a                	add	s0,s0,s2
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1f04:	0006a803          	lw	a6,0(a3)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f08:	01b38933          	add	s2,t2,s11
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1f0c:	4218                	lw	a4,0(a2)
  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
    1f0e:	56f6                	lw	a3,124(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f10:	43e6                	lw	t2,88(sp)
    1f12:	0a22                	sll	s4,s4,0x8
    1f14:	02a2                	sll	t0,t0,0x8
    1f16:	99d2                	add	s3,s3,s4
    1f18:	00728a33          	add	s4,t0,t2
    1f1c:	42f6                	lw	t0,92(sp)
    1f1e:	0fa2                	sll	t6,t6,0x8
    1f20:	0b22                	sll	s6,s6,0x8
    1f22:	9ada                	add	s5,s5,s6
    1f24:	005f8b33          	add	s6,t6,t0
    1f28:	5286                	lw	t0,96(sp)
    1f2a:	07a2                	sll	a5,a5,0x8
    1f2c:	0c22                	sll	s8,s8,0x8
    1f2e:	9be2                	add	s7,s7,s8
    1f30:	00578c33          	add	s8,a5,t0
    1f34:	5296                	lw	t0,100(sp)
    1f36:	0f22                	sll	t5,t5,0x8
    1f38:	0822                	sll	a6,a6,0x8
    1f3a:	005f0db3          	add	s11,t5,t0
    1f3e:	52d6                	lw	t0,116(sp)
    1f40:	00a2                	sll	ra,ra,0x8
    1f42:	0d22                	sll	s10,s10,0x8
    1f44:	92c2                	add	t0,t0,a6
    1f46:	9486                	add	s1,s1,ra
    1f48:	50b6                	lw	ra,108(sp)
    1f4a:	53c6                	lw	t2,112(sp)
    1f4c:	9cea                	add	s9,s9,s10
    1f4e:	c316                	sw	t0,132(sp)
    1f50:	5d26                	lw	s10,104(sp)
    1f52:	52e6                	lw	t0,120(sp)
    1f54:	0322                	sll	t1,t1,0x8
  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
    1f56:	6585                	lui	a1,0x1
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f58:	909a                	add	ra,ra,t1
    1f5a:	0e22                	sll	t3,t3,0x8
    1f5c:	08a2                	sll	a7,a7,0x8
    1f5e:	0722                	sll	a4,a4,0x8
  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
    1f60:	0988                	add	a0,sp,208
    1f62:	80058593          	add	a1,a1,-2048 # 800 <core_list_init+0x1c4>
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f66:	9d72                	add	s10,s10,t3
    1f68:	93c6                	add	t2,t2,a7
  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
    1f6a:	8636                	mv	a2,a3
    1f6c:	95aa                	add	a1,a1,a0
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f6e:	de86                	sw	ra,124(sp)
  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
    1f70:	0d88                	add	a0,sp,720
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);
    1f72:	005700b3          	add	ra,a4,t0
    1f76:	d0ee                	sw	s11,96(sp)
    1f78:	d2ea                	sw	s10,100(sp)
    1f7a:	c11e                	sw	t2,128(sp)
    1f7c:	c506                	sw	ra,136(sp)
  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
    1f7e:	83aff0ef          	jal	fb8 <cfs_stream_4xK_Kx4.constprop.0>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1f82:	4f22                	lw	t5,8(sp)
    1f84:	4fb2                	lw	t6,12(sp)
    1f86:	47c2                	lw	a5,16(sp)
    1f88:	000f2d83          	lw	s11,0(t5)
    1f8c:	4752                	lw	a4,20(sp)
    1f8e:	000fad03          	lw	s10,0(t6)
    1f92:	46e2                	lw	a3,24(sp)
    1f94:	0007a383          	lw	t2,0(a5)
    1f98:	4672                	lw	a2,28(sp)
    1f9a:	5582                	lw	a1,32(sp)
    1f9c:	5812                	lw	a6,36(sp)
    1f9e:	57b2                	lw	a5,44(sp)
    1fa0:	58a2                	lw	a7,40(sp)
    1fa2:	00072283          	lw	t0,0(a4)
    1fa6:	0006af83          	lw	t6,0(a3)
    1faa:	00062f03          	lw	t5,0(a2)
    1fae:	0005ae03          	lw	t3,0(a1)
    1fb2:	00082303          	lw	t1,0(a6)
    1fb6:	0008a883          	lw	a7,0(a7)
    1fba:	0007a803          	lw	a6,0(a5)
    1fbe:	57c2                	lw	a5,48(sp)
    1fc0:	5ed2                	lw	t4,52(sp)
    1fc2:	5772                	lw	a4,60(sp)
    1fc4:	4388                	lw	a0,0(a5)
    1fc6:	57e2                	lw	a5,56(sp)
    1fc8:	000ea583          	lw	a1,0(t4)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1fcc:	0fc2                	sll	t6,t6,0x10
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1fce:	4390                	lw	a2,0(a5)
    1fd0:	4786                	lw	a5,64(sp)
    1fd2:	4314                	lw	a3,0(a4)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1fd4:	0dc2                	sll	s11,s11,0x10
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1fd6:	4398                	lw	a4,0(a5)
    1fd8:	4792                	lw	a5,4(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1fda:	02c2                	sll	t0,t0,0x10
    1fdc:	947e                	add	s0,s0,t6
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    1fde:	439c                	lw	a5,0(a5)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    1fe0:	9cee                	add	s9,s9,s11
    1fe2:	dca2                	sw	s0,120(sp)
    1fe4:	9996                	add	s3,s3,t0
    1fe6:	5d86                	lw	s11,96(sp)
    1fe8:	429a                	lw	t0,132(sp)
    1fea:	0742                	sll	a4,a4,0x10
    1fec:	0542                	sll	a0,a0,0x10
    1fee:	956e                	add	a0,a0,s11
    1ff0:	00570db3          	add	s11,a4,t0
    1ff4:	472a                	lw	a4,136(sp)
    1ff6:	07c2                	sll	a5,a5,0x10
    1ff8:	03c2                	sll	t2,t2,0x10
    1ffa:	97ba                	add	a5,a5,a4
    1ffc:	9a9e                	add	s5,s5,t2
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    1ffe:	474a                	lw	a4,144(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    2000:	438a                	lw	t2,128(sp)
    2002:	c13e                	sw	a5,128(sp)
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    2004:	47b6                	lw	a5,76(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    2006:	0d42                	sll	s10,s10,0x10
    2008:	9bea                	add	s7,s7,s10
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    200a:	97ba                	add	a5,a5,a4
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    200c:	5d16                	lw	s10,100(sp)
    200e:	0f42                	sll	t5,t5,0x10
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    2010:	c6be                	sw	a5,76(sp)
    2012:	47a6                	lw	a5,72(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    2014:	05c2                	sll	a1,a1,0x10
    2016:	009f0433          	add	s0,t5,s1
    201a:	0e42                	sll	t3,t3,0x10
    201c:	0342                	sll	t1,t1,0x10
    201e:	daa2                	sw	s0,116(sp)
    2020:	d4aa                	sw	a0,104(sp)
    2022:	012e0433          	add	s0,t3,s2
    2026:	01a58533          	add	a0,a1,s10
    202a:	55f6                	lw	a1,124(sp)
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    202c:	08078793          	add	a5,a5,128
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    2030:	08c2                	sll	a7,a7,0x10
    2032:	cea2                	sw	s0,92(sp)
    2034:	01430433          	add	s0,t1,s4
    2038:	0842                	sll	a6,a6,0x10
    203a:	0642                	sll	a2,a2,0x10
    203c:	06c2                	sll	a3,a3,0x10
    203e:	d8a2                	sw	s0,112(sp)
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    2040:	c4be                	sw	a5,72(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    2042:	01688433          	add	s0,a7,s6
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    2046:	47d6                	lw	a5,84(sp)
    2048:	4716                	lw	a4,68(sp)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    204a:	969e                	add	a3,a3,t2
    204c:	d6a2                	sw	s0,108(sp)
    204e:	962e                	add	a2,a2,a1
    2050:	01880433          	add	s0,a6,s8
    2054:	deb6                	sw	a3,124(sp)
    2056:	cca2                	sw	s0,88(sp)
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    2058:	010006b7          	lui	a3,0x1000
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
    205c:	d2aa                	sw	a0,100(sp)
    205e:	d0b2                	sw	a2,96(sp)
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
    2060:	fff68e93          	add	t4,a3,-1 # ffffff <__neorv32_rom_size+0xfeffff>
    2064:	94f767e3          	bltu	a4,a5,19b2 <matrix_mul_matrix+0xf8>
                      acc);
        }

        for (int r=0;r<4;r++)
          for (int c=0;c<4;c++)
            C[(i0+r)*N + (j0+c)] = (MATRES)acc[r][c];
    2068:	5b2a                	lw	s6,168(sp)
    206a:	595a                	lw	s2,180(sp)
    206c:	57e6                	lw	a5,120(sp)
    206e:	8766                	mv	a4,s9
    2070:	86de                	mv	a3,s7
    2072:	864e                	mv	a2,s3
    2074:	00eb2023          	sw	a4,0(s6)
    2078:	00db2223          	sw	a3,4(s6)
    207c:	015b2423          	sw	s5,8(s6)
    2080:	00cb2623          	sw	a2,12(s6)
    2084:	00f92023          	sw	a5,0(s2)
    2088:	57d6                	lw	a5,116(sp)
    208a:	5b9a                	lw	s7,164(sp)
    208c:	544a                	lw	s0,176(sp)
    208e:	00f92223          	sw	a5,4(s2)
    2092:	47f6                	lw	a5,92(sp)
    2094:	598a                	lw	s3,160(sp)
    2096:	4c7a                	lw	s8,156(sp)
    2098:	00f92423          	sw	a5,8(s2)
    209c:	57c6                	lw	a5,112(sp)
    209e:	5cba                	lw	s9,172(sp)
    20a0:	5d6a                	lw	s10,184(sp)
    20a2:	00f92623          	sw	a5,12(s2)
    20a6:	57b6                	lw	a5,108(sp)
    20a8:	00aba623          	sw	a0,12(s7)
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    20ac:	0991                	add	s3,s3,4
            C[(i0+r)*N + (j0+c)] = (MATRES)acc[r][c];
    20ae:	00fba023          	sw	a5,0(s7)
    20b2:	47e6                	lw	a5,88(sp)
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    20b4:	0b41                	add	s6,s6,16
    20b6:	0941                	add	s2,s2,16
            C[(i0+r)*N + (j0+c)] = (MATRES)acc[r][c];
    20b8:	00fba223          	sw	a5,4(s7)
    20bc:	57a6                	lw	a5,104(sp)
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    20be:	0bc1                	add	s7,s7,16
    20c0:	0441                	add	s0,s0,16
            C[(i0+r)*N + (j0+c)] = (MATRES)acc[r][c];
    20c2:	fefbac23          	sw	a5,-8(s7)
    20c6:	5786                	lw	a5,96(sp)
    20c8:	ffb42c23          	sw	s11,-8(s0)
    20cc:	fef42823          	sw	a5,-16(s0)
    20d0:	57f6                	lw	a5,124(sp)
    20d2:	fef42a23          	sw	a5,-12(s0)
    20d6:	478a                	lw	a5,128(sp)
    20d8:	fef42e23          	sw	a5,-4(s0)
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){
    20dc:	8989e0e3          	bltu	s3,s8,195c <matrix_mul_matrix+0xa2>
    for (ee_u32 i0 = 0; i0 < N4; i0 += 4){
    20e0:	4f3a                	lw	t5,140(sp)
    20e2:	4756                	lw	a4,84(sp)
    20e4:	4d8e                	lw	s11,192(sp)
    20e6:	4a9e                	lw	s5,196(sp)
    20e8:	47ae                	lw	a5,200(sp)
    20ea:	44be                	lw	s1,204(sp)
    20ec:	977a                	add	a4,a4,t5
    20ee:	070a                	sll	a4,a4,0x2
    20f0:	0d91                	add	s11,s11,4
    20f2:	9ca6                	add	s9,s9,s1
    20f4:	00e78b33          	add	s6,a5,a4
    20f8:	00ea8bb3          	add	s7,s5,a4
    20fc:	858de4e3          	bltu	s11,s8,1944 <matrix_mul_matrix+0x8a>
    2100:	43d6                	lw	t2,84(sp)
    2102:	547a                	lw	s0,188(sp)
    2104:	8926                	mv	s2,s1
    2106:	0c7c7663          	bgeu	s8,t2,21d2 <__neorv32_heap_size+0x1d2>
    210a:	47da                	lw	a5,148(sp)
    210c:	002c1813          	sll	a6,s8,0x2
    2110:	001c1e93          	sll	t4,s8,0x1
    2114:	82be                	mv	t0,a5
    2116:	01e78533          	add	a0,a5,t5
    211a:	9822                	add	a6,a6,s0
    211c:	9eea                	add	t4,t4,s10
      }
    }

    /* 2) Right fringe columns (SW) */
    for (ee_u32 i = 0; i < N4; i++){
    211e:	4f81                	li	t6,0
      for (ee_u32 j = N4; j < N; j++){
        MATRES s = 0;
    2120:	88f6                	mv	a7,t4
    2122:	8e42                	mv	t3,a6
      for (ee_u32 j = N4; j < N; j++){
    2124:	8362                	mv	t1,s8
    for (ee_u32 i0 = 0; i0 < N4; i0 += 4){
    2126:	86c6                	mv	a3,a7
    2128:	8796                	mv	a5,t0
        MATRES s = 0;
    212a:	4601                	li	a2,0
        for (ee_u32 k = 0; k < N; k++)
          s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    212c:	00079703          	lh	a4,0(a5)
    2130:	00069583          	lh	a1,0(a3)
        for (ee_u32 k = 0; k < N; k++)
    2134:	0789                	add	a5,a5,2
    2136:	96fa                	add	a3,a3,t5
          s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2138:	02b70733          	mul	a4,a4,a1
    213c:	963a                	add	a2,a2,a4
        for (ee_u32 k = 0; k < N; k++)
    213e:	fef517e3          	bne	a0,a5,212c <__neorv32_heap_size+0x12c>
        C[i * N + j] = s;
    2142:	00ce2023          	sw	a2,0(t3)
      for (ee_u32 j = N4; j < N; j++){
    2146:	0305                	add	t1,t1,1
    2148:	0e11                	add	t3,t3,4
    214a:	0889                	add	a7,a7,2
    214c:	fc639de3          	bne	t2,t1,2126 <__neorv32_heap_size+0x126>
    for (ee_u32 i = 0; i < N4; i++){
    2150:	0f85                	add	t6,t6,1
    2152:	92fa                	add	t0,t0,t5
    2154:	957a                	add	a0,a0,t5
    2156:	984a                	add	a6,a6,s2
    2158:	fdfc14e3          	bne	s8,t6,2120 <__neorv32_heap_size+0x120>
      }
    }

    /* 3) Bottom fringe rows (SW) */
    for (ee_u32 i = N4; i < N; i++){
    215c:	42d6                	lw	t0,84(sp)
    215e:	065c7a63          	bgeu	s8,t0,21d2 <__neorv32_heap_size+0x1d2>
    2162:	00129813          	sll	a6,t0,0x1
    2166:	001c0f13          	add	t5,s8,1
    216a:	030c0333          	mul	t1,s8,a6
    216e:	475a                	lw	a4,148(sp)
    2170:	030f07b3          	mul	a5,t5,a6
    2174:	933a                	add	t1,t1,a4
    2176:	03828fb3          	mul	t6,t0,s8
    217a:	00f70633          	add	a2,a4,a5
      for (ee_u32 j = 0; j < N; j++){
    217e:	002f9893          	sll	a7,t6,0x2
    2182:	98a2                	add	a7,a7,s0
    2184:	8e6a                	mv	t3,s10
    2186:	4e81                	li	t4,0
    for (ee_u32 i = 0; i < N4; i++){
    2188:	86f2                	mv	a3,t3
    218a:	879a                	mv	a5,t1
        MATRES s = 0;
    218c:	4581                	li	a1,0
        for (ee_u32 k = 0; k < N; k++)
          s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    218e:	00079703          	lh	a4,0(a5)
    2192:	00069503          	lh	a0,0(a3)
        for (ee_u32 k = 0; k < N; k++)
    2196:	0789                	add	a5,a5,2
    2198:	96c2                	add	a3,a3,a6
          s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    219a:	02a70733          	mul	a4,a4,a0
    219e:	95ba                	add	a1,a1,a4
        for (ee_u32 k = 0; k < N; k++)
    21a0:	fec797e3          	bne	a5,a2,218e <__neorv32_heap_size+0x18e>
        C[i * N + j] = s;
    21a4:	00b8a023          	sw	a1,0(a7)
      for (ee_u32 j = 0; j < N; j++){
    21a8:	001e8793          	add	a5,t4,1
    21ac:	0891                	add	a7,a7,4
    21ae:	0e09                	add	t3,t3,2
    21b0:	00f28963          	beq	t0,a5,21c2 <__neorv32_heap_size+0x1c2>
    21b4:	8ebe                	mv	t4,a5
    21b6:	bfc9                	j	2188 <__neorv32_heap_size+0x188>
          int KC = (int)((k0 + KCHUNK <= N) ? KCHUNK : (N - k0));
    21b8:	40f606b3          	sub	a3,a2,a5
  for (int r=0;r<4;r++){
    21bc:	80d045e3          	bgtz	a3,19c6 <matrix_mul_matrix+0x10c>
    21c0:	b20d                	j	1ae2 <matrix_mul_matrix+0x228>
    for (ee_u32 i = N4; i < N; i++){
    21c2:	9f96                	add	t6,t6,t0
    21c4:	9342                	add	t1,t1,a6
    21c6:	9642                	add	a2,a2,a6
    21c8:	01dc0563          	beq	s8,t4,21d2 <__neorv32_heap_size+0x1d2>
    21cc:	8c7a                	mv	s8,t5
    21ce:	0f05                	add	t5,t5,1
    21d0:	b77d                	j	217e <__neorv32_heap_size+0x17e>
      }
    }
#endif
}
    21d2:	32010113          	add	sp,sp,800
    21d6:	7ec12083          	lw	ra,2028(sp)
    21da:	7e812403          	lw	s0,2024(sp)
    21de:	7e412483          	lw	s1,2020(sp)
    21e2:	7e012903          	lw	s2,2016(sp)
    21e6:	7dc12983          	lw	s3,2012(sp)
    21ea:	7d812a03          	lw	s4,2008(sp)
    21ee:	7d412a83          	lw	s5,2004(sp)
    21f2:	7d012b03          	lw	s6,2000(sp)
    21f6:	7cc12b83          	lw	s7,1996(sp)
    21fa:	7c812c03          	lw	s8,1992(sp)
    21fe:	7c412c83          	lw	s9,1988(sp)
    2202:	7c012d03          	lw	s10,1984(sp)
    2206:	7bc12d83          	lw	s11,1980(sp)
    220a:	7f010113          	add	sp,sp,2032
    220e:	8082                	ret

00002210 <matrix_test>:
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val){
    2210:	7139                	add	sp,sp,-64
    2212:	ce5e                	sw	s7,28(sp)
    2214:	ca66                	sw	s9,20(sp)
    2216:	c66e                	sw	s11,12(sp)
    2218:	de06                	sw	ra,60(sp)
    221a:	dc22                	sw	s0,56(sp)
    221c:	8bae                	mv	s7,a1
    221e:	8db2                	mv	s11,a2
    2220:	8cb6                	mv	s9,a3
    for (ee_u32 i = 0; i < N; i++)
    2222:	2c050f63          	beqz	a0,2500 <matrix_test+0x2f0>
    2226:	d64e                	sw	s3,44(sp)
    2228:	00151993          	sll	s3,a0,0x1
    222c:	d84a                	sw	s2,48(sp)
    222e:	c86a                	sw	s10,16(sp)
    2230:	964e                	add	a2,a2,s3
    2232:	40a00d33          	neg	s10,a0
    matrix_add_const(N, A, -val);
    2236:	01071913          	sll	s2,a4,0x10
    223a:	da26                	sw	s1,52(sp)
    223c:	d256                	sw	s5,36(sp)
    223e:	d452                	sw	s4,40(sp)
    2240:	d05a                	sw	s6,32(sp)
    2242:	cc62                	sw	s8,24(sp)
    2244:	8aaa                	mv	s5,a0
    2246:	84ba                	mv	s1,a4
    2248:	01095913          	srl	s2,s2,0x10
    224c:	86b2                	mv	a3,a2
    for (ee_u32 i = 0; i < N; i++)
    224e:	4581                	li	a1,0
    2250:	002d1813          	sll	a6,s10,0x2
        for (ee_u32 j = 0; j < N; j++)
    2254:	41368533          	sub	a0,a3,s3
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val){
    2258:	87aa                	mv	a5,a0
            A[i * N + j] += val;
    225a:	0007d703          	lhu	a4,0(a5)
        for (ee_u32 j = 0; j < N; j++)
    225e:	0789                	add	a5,a5,2
            A[i * N + j] += val;
    2260:	974a                	add	a4,a4,s2
    2262:	fee79f23          	sh	a4,-2(a5)
        for (ee_u32 j = 0; j < N; j++)
    2266:	fed79ae3          	bne	a5,a3,225a <matrix_test+0x4a>
    for (ee_u32 i = 0; i < N; i++)
    226a:	00158413          	add	s0,a1,1
    226e:	410506b3          	sub	a3,a0,a6
    2272:	008a8463          	beq	s5,s0,227a <matrix_test+0x6a>
    2276:	85a2                	mv	a1,s0
    2278:	bff1                	j	2254 <matrix_test+0x44>
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
    227a:	4501                	li	a0,0
    for (ee_u32 i = 0; i < N; i++)
    227c:	4301                	li	t1,0
        for (ee_u32 j = 0; j < N; j++)
    227e:	413608b3          	sub	a7,a2,s3
    2282:	00251693          	sll	a3,a0,0x2
    2286:	96de                	add	a3,a3,s7
    for (ee_u32 i = 0; i < N; i++)
    2288:	87c6                	mv	a5,a7
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
    228a:	00079703          	lh	a4,0(a5)
        for (ee_u32 j = 0; j < N; j++)
    228e:	0691                	add	a3,a3,4
    2290:	0789                	add	a5,a5,2
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
    2292:	02970733          	mul	a4,a4,s1
    2296:	fee6ae23          	sw	a4,-4(a3)
        for (ee_u32 j = 0; j < N; j++)
    229a:	fec798e3          	bne	a5,a2,228a <matrix_test+0x7a>
    for (ee_u32 i = 0; i < N; i++)
    229e:	00130793          	add	a5,t1,1
    22a2:	9522                	add	a0,a0,s0
    22a4:	41088633          	sub	a2,a7,a6
    22a8:	00b30463          	beq	t1,a1,22b0 <matrix_test+0xa0>
    22ac:	833e                	mv	t1,a5
    22ae:	bfc1                	j	227e <matrix_test+0x6e>
    22b0:	410b8a33          	sub	s4,s7,a6
    22b4:	40800f33          	neg	t5,s0
    MATDAT clipval = matrix_big(val);
    22b8:	77fd                	lui	a5,0xfffff
    22ba:	8cdd                	or	s1,s1,a5
            if (tmp > clipval){ ret += 10; tmp = 0; }
    22bc:	8352                	mv	t1,s4
    ee_s16 ret = 0;
    22be:	4501                	li	a0,0
    MATRES tmp = 0, prev = 0, cur = 0;
    22c0:	4701                	li	a4,0
    22c2:	4601                	li	a2,0
    for (ee_u32 i = 0; i < N; i++){
    22c4:	4e81                	li	t4,0
    22c6:	0f0e                	sll	t5,t5,0x3
        for (ee_u32 j = 0; j < N; j++){
    22c8:	01030e33          	add	t3,t1,a6
    for (ee_u32 i = 0; i < N; i++){
    22cc:	87f2                	mv	a5,t3
            if (tmp > clipval){ ret += 10; tmp = 0; }
    22ce:	86ba                	mv	a3,a4
            cur = C[i * N + j];
    22d0:	4398                	lw	a4,0(a5)
            if (tmp > clipval){ ret += 10; tmp = 0; }
    22d2:	0542                	sll	a0,a0,0x10
    22d4:	8141                	srl	a0,a0,0x10
            else              { ret += (cur > prev) ? 1 : 0; }
    22d6:	00e6a6b3          	slt	a3,a3,a4
            if (tmp > clipval){ ret += 10; tmp = 0; }
    22da:	00a50893          	add	a7,a0,10
            else              { ret += (cur > prev) ? 1 : 0; }
    22de:	9536                	add	a0,a0,a3
    22e0:	0542                	sll	a0,a0,0x10
            tmp += cur;
    22e2:	963a                	add	a2,a2,a4
            else              { ret += (cur > prev) ? 1 : 0; }
    22e4:	8541                	sra	a0,a0,0x10
            if (tmp > clipval){ ret += 10; tmp = 0; }
    22e6:	00c4d663          	bge	s1,a2,22f2 <matrix_test+0xe2>
    22ea:	01089513          	sll	a0,a7,0x10
    22ee:	8541                	sra	a0,a0,0x10
    22f0:	4601                	li	a2,0
        for (ee_u32 j = 0; j < N; j++){
    22f2:	0791                	add	a5,a5,4 # fffff004 <__crt0_ram_last+0x7fffb005>
    22f4:	fc679de3          	bne	a5,t1,22ce <matrix_test+0xbe>
    for (ee_u32 i = 0; i < N; i++){
    22f8:	001e8793          	add	a5,t4,1
    22fc:	41ee0333          	sub	t1,t3,t5
    2300:	01d58463          	beq	a1,t4,2308 <matrix_test+0xf8>
    2304:	8ebe                	mv	t4,a5
    2306:	b7c9                	j	22c8 <matrix_test+0xb8>
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2308:	4581                	li	a1,0
    230a:	727000ef          	jal	3230 <crc16>
    230e:	85aa                	mv	a1,a0
    for (ee_u32 i = 0; i < N; i++){
    2310:	99e6                	add	s3,s3,s9
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2312:	885e                	mv	a6,s7
    2314:	4881                	li	a7,0
        for (ee_u32 j = 0; j < N; j++)
    2316:	00189693          	sll	a3,a7,0x1
    231a:	96ee                	add	a3,a3,s11
    crc = crc16(matrix_sum(N, C, clipval), crc);
    231c:	87e6                	mv	a5,s9
    231e:	4601                	li	a2,0
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    2320:	00069703          	lh	a4,0(a3)
    2324:	00079503          	lh	a0,0(a5)
        for (ee_u32 j = 0; j < N; j++)
    2328:	0789                	add	a5,a5,2
    232a:	0689                	add	a3,a3,2
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    232c:	02a70733          	mul	a4,a4,a0
    2330:	963a                	add	a2,a2,a4
        for (ee_u32 j = 0; j < N; j++)
    2332:	fef997e3          	bne	s3,a5,2320 <matrix_test+0x110>
    2336:	00c82023          	sw	a2,0(a6)
    for (ee_u32 i = 0; i < N; i++){
    233a:	0811                	add	a6,a6,4
    233c:	98a2                	add	a7,a7,s0
    233e:	fd481ce3          	bne	a6,s4,2316 <matrix_test+0x106>
    2342:	4301                	li	t1,0
    ee_s16 ret = 0;
    2344:	4501                	li	a0,0
    MATRES tmp = 0, prev = 0, cur = 0;
    2346:	4781                	li	a5,0
    2348:	4681                	li	a3,0
    for (ee_u32 i = 0; i < N; i++){
    234a:	4e01                	li	t3,0
        for (ee_u32 j = 0; j < N; j++){
    234c:	00231613          	sll	a2,t1,0x2
    2350:	965e                	add	a2,a2,s7
    2352:	4801                	li	a6,0
            if (tmp > clipval){ ret += 10; tmp = 0; }
    2354:	873e                	mv	a4,a5
            cur = C[i * N + j];
    2356:	421c                	lw	a5,0(a2)
            if (tmp > clipval){ ret += 10; tmp = 0; }
    2358:	0542                	sll	a0,a0,0x10
    235a:	8141                	srl	a0,a0,0x10
            else              { ret += (cur > prev) ? 1 : 0; }
    235c:	00f72733          	slt	a4,a4,a5
            if (tmp > clipval){ ret += 10; tmp = 0; }
    2360:	00a50893          	add	a7,a0,10
            else              { ret += (cur > prev) ? 1 : 0; }
    2364:	953a                	add	a0,a0,a4
    2366:	0542                	sll	a0,a0,0x10
            tmp += cur;
    2368:	96be                	add	a3,a3,a5
            else              { ret += (cur > prev) ? 1 : 0; }
    236a:	8541                	sra	a0,a0,0x10
            if (tmp > clipval){ ret += 10; tmp = 0; }
    236c:	00d4d663          	bge	s1,a3,2378 <matrix_test+0x168>
    2370:	01089513          	sll	a0,a7,0x10
    2374:	8541                	sra	a0,a0,0x10
    2376:	4681                	li	a3,0
        for (ee_u32 j = 0; j < N; j++){
    2378:	0805                	add	a6,a6,1
    237a:	0611                	add	a2,a2,4
    237c:	fc886ce3          	bltu	a6,s0,2354 <matrix_test+0x144>
    for (ee_u32 i = 0; i < N; i++){
    2380:	0e05                	add	t3,t3,1
    2382:	9322                	add	t1,t1,s0
    2384:	fc8e64e3          	bltu	t3,s0,234c <matrix_test+0x13c>
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2388:	6a9000ef          	jal	3230 <crc16>
    matrix_mul_matrix(N, C, A, B);
    238c:	866e                	mv	a2,s11
    crc = crc16(matrix_sum(N, C, clipval), crc);
    238e:	842a                	mv	s0,a0
    matrix_mul_matrix(N, C, A, B);
    2390:	86e6                	mv	a3,s9
    2392:	8556                	mv	a0,s5
    2394:	85de                	mv	a1,s7
    2396:	002a9a13          	sll	s4,s5,0x2
    239a:	d20ff0ef          	jal	18ba <matrix_mul_matrix>
    for (ee_u32 i = 0; i < N; i++){
    239e:	9a5e                	add	s4,s4,s7
    23a0:	002d1c13          	sll	s8,s10,0x2
            if (tmp > clipval){ ret += 10; tmp = 0; }
    23a4:	8852                	mv	a6,s4
    ee_s16 ret = 0;
    23a6:	4501                	li	a0,0
    MATRES tmp = 0, prev = 0, cur = 0;
    23a8:	4701                	li	a4,0
    23aa:	4601                	li	a2,0
    for (ee_u32 i = 0; i < N; i++){
    23ac:	4981                	li	s3,0
    23ae:	0d0e                	sll	s10,s10,0x3
        for (ee_u32 j = 0; j < N; j++){
    23b0:	018808b3          	add	a7,a6,s8
    for (ee_u32 i = 0; i < N; i++){
    23b4:	87c6                	mv	a5,a7
            if (tmp > clipval){ ret += 10; tmp = 0; }
    23b6:	86ba                	mv	a3,a4
            cur = C[i * N + j];
    23b8:	4398                	lw	a4,0(a5)
            if (tmp > clipval){ ret += 10; tmp = 0; }
    23ba:	0542                	sll	a0,a0,0x10
    23bc:	8141                	srl	a0,a0,0x10
            else              { ret += (cur > prev) ? 1 : 0; }
    23be:	00e6a6b3          	slt	a3,a3,a4
            if (tmp > clipval){ ret += 10; tmp = 0; }
    23c2:	00a50593          	add	a1,a0,10
            else              { ret += (cur > prev) ? 1 : 0; }
    23c6:	9536                	add	a0,a0,a3
    23c8:	0542                	sll	a0,a0,0x10
            tmp += cur;
    23ca:	963a                	add	a2,a2,a4
            else              { ret += (cur > prev) ? 1 : 0; }
    23cc:	8541                	sra	a0,a0,0x10
            if (tmp > clipval){ ret += 10; tmp = 0; }
    23ce:	00c4d663          	bge	s1,a2,23da <matrix_test+0x1ca>
    23d2:	01059513          	sll	a0,a1,0x10
    23d6:	8541                	sra	a0,a0,0x10
    23d8:	4601                	li	a2,0
        for (ee_u32 j = 0; j < N; j++){
    23da:	0791                	add	a5,a5,4
    23dc:	fcf81de3          	bne	a6,a5,23b6 <matrix_test+0x1a6>
    for (ee_u32 i = 0; i < N; i++){
    23e0:	00198b13          	add	s6,s3,1
    23e4:	41a88833          	sub	a6,a7,s10
    23e8:	016a8463          	beq	s5,s6,23f0 <matrix_test+0x1e0>
    23ec:	89da                	mv	s3,s6
    23ee:	b7c9                	j	23b0 <matrix_test+0x1a0>
    crc = crc16(matrix_sum(N, C, clipval), crc);
    23f0:	85a2                	mv	a1,s0
    23f2:	001b1413          	sll	s0,s6,0x1
    23f6:	63b000ef          	jal	3230 <crc16>
    23fa:	008d8ab3          	add	s5,s11,s0
    23fe:	8f6e                	mv	t5,s11
    2400:	85aa                	mv	a1,a0
    2402:	88d6                	mv	a7,s5
    2404:	4681                	li	a3,0

void matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
    for (ee_u32 i = 0; i < N; i++){
    2406:	4f81                	li	t6,0
        for (ee_u32 j = 0; j < N; j++){
    2408:	00269313          	sll	t1,a3,0x2
    240c:	935e                	add	t1,t1,s7
    240e:	8e66                	mv	t3,s9
    2410:	4e81                	li	t4,0
    2412:	8572                	mv	a0,t3
    2414:	867a                	mv	a2,t5
    2416:	4801                	li	a6,0
            C[i * N + j] = 0;
            for (ee_u32 k = 0; k < N; k++){
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2418:	00051703          	lh	a4,0(a0)
    241c:	00061783          	lh	a5,0(a2)
            for (ee_u32 k = 0; k < N; k++){
    2420:	0609                	add	a2,a2,2
    2422:	9522                	add	a0,a0,s0
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2424:	02e787b3          	mul	a5,a5,a4
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    2428:	4027d713          	sra	a4,a5,0x2
    242c:	8795                	sra	a5,a5,0x5
    242e:	8b3d                	and	a4,a4,15
    2430:	07f7f793          	and	a5,a5,127
    2434:	02f707b3          	mul	a5,a4,a5
    2438:	983e                	add	a6,a6,a5
            for (ee_u32 k = 0; k < N; k++){
    243a:	fd161fe3          	bne	a2,a7,2418 <matrix_test+0x208>
    243e:	01032023          	sw	a6,0(t1)
        for (ee_u32 j = 0; j < N; j++){
    2442:	001e8793          	add	a5,t4,1
    2446:	0311                	add	t1,t1,4
    2448:	0e09                	add	t3,t3,2
    244a:	013e8463          	beq	t4,s3,2452 <matrix_test+0x242>
    244e:	8ebe                	mv	t4,a5
    2450:	b7c9                	j	2412 <matrix_test+0x202>
    for (ee_u32 i = 0; i < N; i++){
    2452:	001f8793          	add	a5,t6,1
    2456:	9f22                	add	t5,t5,s0
    2458:	96da                	add	a3,a3,s6
    245a:	98a2                	add	a7,a7,s0
    245c:	013f8463          	beq	t6,s3,2464 <matrix_test+0x254>
    2460:	8fbe                	mv	t6,a5
    2462:	b75d                	j	2408 <matrix_test+0x1f8>
    ee_s16 ret = 0;
    2464:	4501                	li	a0,0
    MATRES tmp = 0, prev = 0, cur = 0;
    2466:	4701                	li	a4,0
    2468:	4601                	li	a2,0
    for (ee_u32 i = 0; i < N; i++){
    246a:	4301                	li	t1,0
        for (ee_u32 j = 0; j < N; j++){
    246c:	014c08b3          	add	a7,s8,s4
    for (ee_u32 i = 0; i < N; i++){
    2470:	87c6                	mv	a5,a7
            if (tmp > clipval){ ret += 10; tmp = 0; }
    2472:	86ba                	mv	a3,a4
            cur = C[i * N + j];
    2474:	4398                	lw	a4,0(a5)
            if (tmp > clipval){ ret += 10; tmp = 0; }
    2476:	0542                	sll	a0,a0,0x10
    2478:	8141                	srl	a0,a0,0x10
            else              { ret += (cur > prev) ? 1 : 0; }
    247a:	00e6a6b3          	slt	a3,a3,a4
            if (tmp > clipval){ ret += 10; tmp = 0; }
    247e:	00a50813          	add	a6,a0,10
            else              { ret += (cur > prev) ? 1 : 0; }
    2482:	9536                	add	a0,a0,a3
    2484:	0542                	sll	a0,a0,0x10
            tmp += cur;
    2486:	963a                	add	a2,a2,a4
            else              { ret += (cur > prev) ? 1 : 0; }
    2488:	8541                	sra	a0,a0,0x10
            if (tmp > clipval){ ret += 10; tmp = 0; }
    248a:	00c4d663          	bge	s1,a2,2496 <matrix_test+0x286>
    248e:	01081513          	sll	a0,a6,0x10
    2492:	8541                	sra	a0,a0,0x10
    2494:	4601                	li	a2,0
        for (ee_u32 j = 0; j < N; j++){
    2496:	0791                	add	a5,a5,4
    2498:	fd479de3          	bne	a5,s4,2472 <matrix_test+0x262>
    for (ee_u32 i = 0; i < N; i++){
    249c:	00130793          	add	a5,t1,1
    24a0:	41a88a33          	sub	s4,a7,s10
    24a4:	00698463          	beq	s3,t1,24ac <matrix_test+0x29c>
    24a8:	833e                	mv	t1,a5
    24aa:	b7c9                	j	246c <matrix_test+0x25c>
    crc = crc16(matrix_sum(N, C, clipval), crc);
    24ac:	585000ef          	jal	3230 <crc16>
    24b0:	85aa                	mv	a1,a0
    for (ee_u32 i = 0; i < N; i++)
    24b2:	4601                	li	a2,0
        for (ee_u32 j = 0; j < N; j++)
    24b4:	408a86b3          	sub	a3,s5,s0
            if (tmp > clipval){ ret += 10; tmp = 0; }
    24b8:	87b6                	mv	a5,a3
            A[i * N + j] += val;
    24ba:	0007d703          	lhu	a4,0(a5)
        for (ee_u32 j = 0; j < N; j++)
    24be:	0789                	add	a5,a5,2
            A[i * N + j] += val;
    24c0:	41270733          	sub	a4,a4,s2
    24c4:	fee79f23          	sh	a4,-2(a5)
        for (ee_u32 j = 0; j < N; j++)
    24c8:	fefa99e3          	bne	s5,a5,24ba <matrix_test+0x2aa>
    for (ee_u32 i = 0; i < N; i++)
    24cc:	00160793          	add	a5,a2,1
    24d0:	41868ab3          	sub	s5,a3,s8
    24d4:	01360463          	beq	a2,s3,24dc <matrix_test+0x2cc>
    24d8:	863e                	mv	a2,a5
    24da:	bfe9                	j	24b4 <matrix_test+0x2a4>
    24dc:	54d2                	lw	s1,52(sp)
    24de:	5942                	lw	s2,48(sp)
    24e0:	59b2                	lw	s3,44(sp)
    24e2:	5a22                	lw	s4,40(sp)
    24e4:	5a92                	lw	s5,36(sp)
    24e6:	5b02                	lw	s6,32(sp)
    24e8:	4c62                	lw	s8,24(sp)
    24ea:	4d42                	lw	s10,16(sp)
}
    24ec:	50f2                	lw	ra,60(sp)
    24ee:	5462                	lw	s0,56(sp)
    return crc;
    24f0:	01059513          	sll	a0,a1,0x10
}
    24f4:	4bf2                	lw	s7,28(sp)
    24f6:	4cd2                	lw	s9,20(sp)
    24f8:	4db2                	lw	s11,12(sp)
    return crc;
    24fa:	8541                	sra	a0,a0,0x10
}
    24fc:	6121                	add	sp,sp,64
    24fe:	8082                	ret
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2500:	4581                	li	a1,0
    2502:	52f000ef          	jal	3230 <crc16>
    2506:	85aa                	mv	a1,a0
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2508:	4501                	li	a0,0
    250a:	527000ef          	jal	3230 <crc16>
    matrix_mul_matrix(N, C, A, B);
    250e:	86e6                	mv	a3,s9
    2510:	866e                	mv	a2,s11
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2512:	842a                	mv	s0,a0
    matrix_mul_matrix(N, C, A, B);
    2514:	85de                	mv	a1,s7
    2516:	4501                	li	a0,0
    2518:	ba2ff0ef          	jal	18ba <matrix_mul_matrix>
    crc = crc16(matrix_sum(N, C, clipval), crc);
    251c:	85a2                	mv	a1,s0
    251e:	4501                	li	a0,0
    2520:	511000ef          	jal	3230 <crc16>
    2524:	85aa                	mv	a1,a0
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2526:	4501                	li	a0,0
    2528:	509000ef          	jal	3230 <crc16>
    252c:	85aa                	mv	a1,a0
    for (ee_u32 i = 0; i < N; i++)
    252e:	bf7d                	j	24ec <matrix_test+0x2dc>

00002530 <core_bench_matrix>:
{
    2530:	1141                	add	sp,sp,-16
    2532:	c422                	sw	s0,8(sp)
    crc = crc16(matrix_test(N, C, A, B, val), crc);
    2534:	4514                	lw	a3,8(a0)
{
    2536:	8432                	mv	s0,a2
    2538:	872e                	mv	a4,a1
    crc = crc16(matrix_test(N, C, A, B, val), crc);
    253a:	4150                	lw	a2,4(a0)
    253c:	454c                	lw	a1,12(a0)
    253e:	4108                	lw	a0,0(a0)
{
    2540:	c606                	sw	ra,12(sp)
    crc = crc16(matrix_test(N, C, A, B, val), crc);
    2542:	31f9                	jal	2210 <matrix_test>
    2544:	85a2                	mv	a1,s0
}
    2546:	4422                	lw	s0,8(sp)
    2548:	40b2                	lw	ra,12(sp)
    254a:	0141                	add	sp,sp,16
    crc = crc16(matrix_test(N, C, A, B, val), crc);
    254c:	4e50006f          	j	3230 <crc16>

00002550 <start_time>:
 * This function will be called right before starting the timed portion of the benchmark.
 *
 * Implementation may be capturing a system timer (as implemented in the
 * example code) or zeroing some system parameters - e.g. setting the cpu clocks cycles to 0.
*/
void start_time(void) {
    2550:	1141                	add	sp,sp,-16
    2552:	c606                	sw	ra,12(sp)
    GETMYTIME(&start_time_val);
    2554:	0b8020ef          	jal	460c <neorv32_cpu_get_cycle>
    2558:	800007b7          	lui	a5,0x80000
    255c:	56a7ac23          	sw	a0,1400(a5) # 80000578 <start_time_val>
    2560:	56b7ae23          	sw	a1,1404(a5)
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    2564:	4781                	li	a5,0
    2566:	32079073          	csrw	mcountinhibit,a5
    neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, 0); // start all counters
}
    256a:	40b2                	lw	ra,12(sp)
    256c:	0141                	add	sp,sp,16
    256e:	8082                	ret

00002570 <stop_time>:
 * This function will be called right after ending the timed portion of the benchmark.
 *
 * Implementation may be capturing a system timer (as implemented in the example code) or
 * other system parameters - e.g. reading the current value of cpu cycles counter.
 */
void stop_time(void) {
    2570:	1141                	add	sp,sp,-16
    2572:	c606                	sw	ra,12(sp)
    2574:	57fd                	li	a5,-1
    2576:	32079073          	csrw	mcountinhibit,a5
    neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1); // stop all counters
    GETMYTIME(&stop_time_val);
    257a:	092020ef          	jal	460c <neorv32_cpu_get_cycle>
}
    257e:	40b2                	lw	ra,12(sp)
    GETMYTIME(&stop_time_val);
    2580:	800007b7          	lui	a5,0x80000
    2584:	56a7a823          	sw	a0,1392(a5) # 80000570 <stop_time_val>
    2588:	56b7aa23          	sw	a1,1396(a5)
}
    258c:	0141                	add	sp,sp,16
    258e:	8082                	ret

00002590 <get_time>:
 * sample implementation returns milliseconds by default, and the resolution is
 * controlled by <TIMER_RES_DIVIDER>
 */
CORE_TICKS get_time(void) {
    CORE_TICKS elapsed
        = (CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
    2590:	800006b7          	lui	a3,0x80000
    2594:	80000737          	lui	a4,0x80000
    CORE_TICKS elapsed
    2598:	5706a783          	lw	a5,1392(a3) # 80000570 <stop_time_val>
    259c:	57872503          	lw	a0,1400(a4) # 80000578 <start_time_val>
    25a0:	5746a583          	lw	a1,1396(a3)
    25a4:	57c72703          	lw	a4,1404(a4)
    25a8:	40a78533          	sub	a0,a5,a0
    25ac:	00a7b7b3          	sltu	a5,a5,a0
    25b0:	8d99                	sub	a1,a1,a4
    return elapsed;
}
    25b2:	8d9d                	sub	a1,a1,a5
    25b4:	8082                	ret

000025b6 <time_in_secs>:
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
    25b6:	7781                	lui	a5,0xfffe0
    25b8:	4390                	lw	a2,0(a5)
 * Convert the value returned by get_time to seconds.
 *
 * The <secs_ret> type is used to accommodate systems with no support for floating point.
 * Default implementation implemented by the EE_TICKS_PER_SEC macro above.
 */
secs_ret time_in_secs(CORE_TICKS ticks) {
    25ba:	1141                	add	sp,sp,-16
    /* NEORV32-specific */
    secs_ret retval = (secs_ret)(((CORE_TICKS)ticks) / ((CORE_TICKS)neorv32_sysinfo_get_clk()));
    25bc:	4681                	li	a3,0
secs_ret time_in_secs(CORE_TICKS ticks) {
    25be:	c606                	sw	ra,12(sp)
    secs_ret retval = (secs_ret)(((CORE_TICKS)ticks) / ((CORE_TICKS)neorv32_sysinfo_get_clk()));
    25c0:	6b5040ef          	jal	7474 <__udivdi3>
    25c4:	6b7060ef          	jal	947a <__floatundidf>
    return retval;
}
    25c8:	40b2                	lw	ra,12(sp)
    25ca:	0141                	add	sp,sp,16
    25cc:	8082                	ret

000025ce <portable_init>:

/* Function : portable_init
 * Target specific initialization code
 * Test for some common mistakes.
 */
void portable_init(core_portable *p, int *argc, char *argv[]) {
    25ce:	1141                	add	sp,sp,-16
    25d0:	c422                	sw	s0,8(sp)
    25d2:	c226                	sw	s1,4(sp)
    25d4:	c606                	sw	ra,12(sp)
    25d6:	84aa                	mv	s1,a0
    25d8:	4401                	li	s0,0
    25da:	30441073          	csrw	mie,s0

  /* NEORV32-specific */
  neorv32_cpu_csr_write(CSR_MIE, 0); // no interrupt, thanks
  neorv32_rte_setup(); // capture all trap and give debug information, no HW flow control
    25de:	145020ef          	jal	4f22 <neorv32_rte_setup>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    25e2:	fc0027f3          	csrr	a5,0xfc0

  // abort if CPU base counter not available
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZICNTR)) == 0) {
    25e6:	0807f793          	and	a5,a5,128
    25ea:	eb89                	bnez	a5,25fc <portable_init+0x2e>
    neorv32_uart0_printf("ERROR! No CPU base counters available (Zicntr)!\n");
    25ec:	65a9                	lui	a1,0xa
    25ee:	a8058593          	add	a1,a1,-1408 # 9a80 <__fini_array_end+0x40c>
    25f2:	fff50537          	lui	a0,0xfff50
    25f6:	4c9020ef          	jal	52be <neorv32_uart_printf>
    while(1); // halt
    25fa:	a001                	j	25fa <portable_init+0x2c>
  }

  // setup UART at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);
    25fc:	6595                	lui	a1,0x5
    25fe:	4601                	li	a2,0
    2600:	b0058593          	add	a1,a1,-1280 # 4b00 <neorv32_rte_debug_handler+0x14>
    2604:	fff50537          	lui	a0,0xfff50
    2608:	18d020ef          	jal	4f94 <neorv32_uart_setup>

  // get number of available HPM counters
  num_hpm_cnts_global = neorv32_cpu_hpm_get_num_counters();
    260c:	012020ef          	jal	461e <neorv32_cpu_hpm_get_num_counters>
    2610:	80000737          	lui	a4,0x80000
    2614:	56a72423          	sw	a0,1384(a4) # 80000568 <num_hpm_cnts_global>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    2618:	577d                	li	a4,-1
    261a:	32071073          	csrw	mcountinhibit,a4
    261e:	b0041073          	csrw	mcycle,s0
    2622:	b0241073          	csrw	minstret,s0
  // setup base counters
  neorv32_cpu_csr_write(CSR_MCYCLE, 0);
  neorv32_cpu_csr_write(CSR_MINSTRET, 0);

  // try to setup as many HPMs as possible
  if (num_hpm_cnts_global > 0)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER3,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT3,  1 << HPMCNT_EVENT_COMPR);    }
    2626:	cd51                	beqz	a0,26c2 <portable_init+0xf4>
    2628:	b0341073          	csrw	mhpmcounter3,s0
    262c:	4721                	li	a4,8
    262e:	32371073          	csrw	mhpmevent3,a4
  if (num_hpm_cnts_global > 1)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER4,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT4,  1 << HPMCNT_EVENT_WAIT_DIS); }
    2632:	4685                	li	a3,1
    2634:	08d50763          	beq	a0,a3,26c2 <portable_init+0xf4>
    2638:	b0441073          	csrw	mhpmcounter4,s0
    263c:	46c1                	li	a3,16
    263e:	32469073          	csrw	mhpmevent4,a3
  if (num_hpm_cnts_global > 2)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER5,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT5,  1 << HPMCNT_EVENT_WAIT_ALU); }
    2642:	4689                	li	a3,2
    2644:	06d50f63          	beq	a0,a3,26c2 <portable_init+0xf4>
    2648:	b0541073          	csrw	mhpmcounter5,s0
    264c:	02000693          	li	a3,32
    2650:	32569073          	csrw	mhpmevent5,a3
  if (num_hpm_cnts_global > 3)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER6,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT6,  1 << HPMCNT_EVENT_BRANCH);   }
    2654:	468d                	li	a3,3
    2656:	06d50663          	beq	a0,a3,26c2 <portable_init+0xf4>
    265a:	b0641073          	csrw	mhpmcounter6,s0
    265e:	04000693          	li	a3,64
    2662:	32669073          	csrw	mhpmevent6,a3
  if (num_hpm_cnts_global > 4)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER7,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT7,  1 << HPMCNT_EVENT_BRANCHED); }
    2666:	4691                	li	a3,4
    2668:	04d50d63          	beq	a0,a3,26c2 <portable_init+0xf4>
    266c:	b0741073          	csrw	mhpmcounter7,s0
    2670:	08000693          	li	a3,128
    2674:	32769073          	csrw	mhpmevent7,a3
  if (num_hpm_cnts_global > 5)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER8,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT8,  1 << HPMCNT_EVENT_LOAD);     }
    2678:	4695                	li	a3,5
    267a:	04d50463          	beq	a0,a3,26c2 <portable_init+0xf4>
    267e:	b0841073          	csrw	mhpmcounter8,s0
    2682:	10000693          	li	a3,256
    2686:	32869073          	csrw	mhpmevent8,a3
  if (num_hpm_cnts_global > 6)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER9,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT9,  1 << HPMCNT_EVENT_STORE);    }
    268a:	4699                	li	a3,6
    268c:	02d50b63          	beq	a0,a3,26c2 <portable_init+0xf4>
    2690:	b0941073          	csrw	mhpmcounter9,s0
    2694:	20000693          	li	a3,512
    2698:	32969073          	csrw	mhpmevent9,a3
  if (num_hpm_cnts_global > 7)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER10, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT10, 1 << HPMCNT_EVENT_WAIT_LSU); }
    269c:	469d                	li	a3,7
    269e:	02d50263          	beq	a0,a3,26c2 <portable_init+0xf4>
    26a2:	b0a41073          	csrw	mhpmcounter10,s0
    26a6:	40000693          	li	a3,1024
    26aa:	32a69073          	csrw	mhpmevent10,a3
  if (num_hpm_cnts_global > 8)  {neorv32_cpu_csr_write(CSR_MHPMCOUNTER11, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT11, 1 << HPMCNT_EVENT_TRAP);     }
    26ae:	00e50a63          	beq	a0,a4,26c2 <portable_init+0xf4>
    26b2:	4781                	li	a5,0
    26b4:	b0b79073          	csrw	mhpmcounter11,a5
    26b8:	6785                	lui	a5,0x1
    26ba:	80078793          	add	a5,a5,-2048 # 800 <core_list_init+0x1c4>
    26be:	32b79073          	csrw	mhpmevent11,a5
    26c2:	7781                	lui	a5,0xfffe0
    26c4:	4390                	lw	a2,0(a5)

  neorv32_uart0_printf("NEORV32: Processor running at %u Hz\n", (uint32_t)neorv32_sysinfo_get_clk());
    26c6:	65a9                	lui	a1,0xa
    26c8:	ab458593          	add	a1,a1,-1356 # 9ab4 <__fini_array_end+0x440>
    26cc:	fff50537          	lui	a0,0xfff50
    26d0:	3ef020ef          	jal	52be <neorv32_uart_printf>
#if MULTITHREAD == 2
  neorv32_uart0_printf("NEORV32: SMP dual-core version (HIGHLY EXPERIMENTAL!)\n");
#endif
  neorv32_uart0_printf("NEORV32: Executing coremark (%u iterations). This may take some time...\n\n", (uint32_t)ITERATIONS);
    26d4:	65a9                	lui	a1,0xa
    26d6:	7d000613          	li	a2,2000
    26da:	adc58593          	add	a1,a1,-1316 # 9adc <__fini_array_end+0x468>
    26de:	fff50537          	lui	a0,0xfff50
    26e2:	3dd020ef          	jal	52be <neorv32_uart_printf>
    }
    if (sizeof(ee_u32) != 4)
    {
        ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
    }
    p->portable_id = 1;
    26e6:	4785                	li	a5,1
    26e8:	00f48023          	sb	a5,0(s1)
}
    26ec:	40b2                	lw	ra,12(sp)
    26ee:	4422                	lw	s0,8(sp)
    26f0:	4492                	lw	s1,4(sp)
    26f2:	0141                	add	sp,sp,16
    26f4:	8082                	ret

000026f6 <portable_fini>:


/* Function : portable_fini
 * Target specific final code
 */
void portable_fini(core_portable *p) {
    26f6:	1141                	add	sp,sp,-16
    26f8:	c606                	sw	ra,12(sp)
    26fa:	c422                	sw	s0,8(sp)

    p->portable_id = 0;

    neorv32_uart0_printf("\nNEORV32: Hardware Performance Monitors (low words only)\n");
    26fc:	65a9                	lui	a1,0xa
    p->portable_id = 0;
    26fe:	00050023          	sb	zero,0(a0) # fff50000 <__crt0_ram_last+0x7ff4c001>
    neorv32_uart0_printf("\nNEORV32: Hardware Performance Monitors (low words only)\n");
    2702:	b2858593          	add	a1,a1,-1240 # 9b28 <__fini_array_end+0x4b4>
    2706:	fff50537          	lui	a0,0xfff50
    270a:	3b5020ef          	jal	52be <neorv32_uart_printf>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    270e:	b0002673          	csrr	a2,mcycle
    neorv32_uart0_printf(" > Active clock cycles         : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MCYCLE));
    2712:	65a9                	lui	a1,0xa
    2714:	b6458593          	add	a1,a1,-1180 # 9b64 <__fini_array_end+0x4f0>
    2718:	fff50537          	lui	a0,0xfff50
    271c:	3a3020ef          	jal	52be <neorv32_uart_printf>
    2720:	b0202673          	csrr	a2,minstret
    neorv32_uart0_printf(" > Retired instructions        : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MINSTRET));
    2724:	65a9                	lui	a1,0xa
    2726:	b8c58593          	add	a1,a1,-1140 # 9b8c <__fini_array_end+0x518>
    272a:	fff50537          	lui	a0,0xfff50
    272e:	391020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global == 0) {neorv32_uart0_printf("no HPMs available\n"); }
    2732:	80000437          	lui	s0,0x80000
    2736:	56842783          	lw	a5,1384(s0) # 80000568 <num_hpm_cnts_global>
    273a:	10078563          	beqz	a5,2844 <portable_fini+0x14e>
    273e:	b0302673          	csrr	a2,mhpmcounter3
    if (num_hpm_cnts_global > 0)  {neorv32_uart0_printf(" > Compressed instructions     : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER3));  }
    2742:	65a9                	lui	a1,0xa
    2744:	bb458593          	add	a1,a1,-1100 # 9bb4 <__fini_array_end+0x540>
    2748:	fff50537          	lui	a0,0xfff50
    274c:	373020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 1)  {neorv32_uart0_printf(" > Instr. dispatch wait cycles : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER4));  }
    2750:	56842703          	lw	a4,1384(s0)
    2754:	4785                	li	a5,1
    2756:	0ce7fd63          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    275a:	b0402673          	csrr	a2,mhpmcounter4
    275e:	65a9                	lui	a1,0xa
    2760:	bf058593          	add	a1,a1,-1040 # 9bf0 <__fini_array_end+0x57c>
    2764:	fff50537          	lui	a0,0xfff50
    2768:	357020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 2)  {neorv32_uart0_printf(" > ALU wait cycles             : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER5));  }
    276c:	56842703          	lw	a4,1384(s0)
    2770:	4789                	li	a5,2
    2772:	0ae7ff63          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    2776:	b0502673          	csrr	a2,mhpmcounter5
    277a:	65a9                	lui	a1,0xa
    277c:	c1858593          	add	a1,a1,-1000 # 9c18 <__fini_array_end+0x5a4>
    2780:	fff50537          	lui	a0,0xfff50
    2784:	33b020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 3)  {neorv32_uart0_printf(" > Branch instructions         : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER6));  }
    2788:	56842703          	lw	a4,1384(s0)
    278c:	478d                	li	a5,3
    278e:	0ae7f163          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    2792:	b0602673          	csrr	a2,mhpmcounter6
    2796:	65a9                	lui	a1,0xa
    2798:	c4058593          	add	a1,a1,-960 # 9c40 <__fini_array_end+0x5cc>
    279c:	fff50537          	lui	a0,0xfff50
    27a0:	31f020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 4)  {neorv32_uart0_printf(" > Control flow transfers      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER7));  }
    27a4:	56842703          	lw	a4,1384(s0)
    27a8:	4791                	li	a5,4
    27aa:	08e7f363          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    27ae:	b0702673          	csrr	a2,mhpmcounter7
    27b2:	65a9                	lui	a1,0xa
    27b4:	c6858593          	add	a1,a1,-920 # 9c68 <__fini_array_end+0x5f4>
    27b8:	fff50537          	lui	a0,0xfff50
    27bc:	303020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 5)  {neorv32_uart0_printf(" > Load instructions           : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER8));  }
    27c0:	56842703          	lw	a4,1384(s0)
    27c4:	4795                	li	a5,5
    27c6:	06e7f563          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    27ca:	b0802673          	csrr	a2,mhpmcounter8
    27ce:	65a9                	lui	a1,0xa
    27d0:	c9058593          	add	a1,a1,-880 # 9c90 <__fini_array_end+0x61c>
    27d4:	fff50537          	lui	a0,0xfff50
    27d8:	2e7020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 6)  {neorv32_uart0_printf(" > Store instructions          : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER9));  }
    27dc:	56842703          	lw	a4,1384(s0)
    27e0:	4799                	li	a5,6
    27e2:	04e7f763          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    27e6:	b0902673          	csrr	a2,mhpmcounter9
    27ea:	65a9                	lui	a1,0xa
    27ec:	cb858593          	add	a1,a1,-840 # 9cb8 <__fini_array_end+0x644>
    27f0:	fff50537          	lui	a0,0xfff50
    27f4:	2cb020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 7)  {neorv32_uart0_printf(" > Load/store wait cycles      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER10)); }
    27f8:	56842703          	lw	a4,1384(s0)
    27fc:	479d                	li	a5,7
    27fe:	02e7f963          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    2802:	b0a02673          	csrr	a2,mhpmcounter10
    2806:	65a9                	lui	a1,0xa
    2808:	ce058593          	add	a1,a1,-800 # 9ce0 <__fini_array_end+0x66c>
    280c:	fff50537          	lui	a0,0xfff50
    2810:	2af020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 8)  {neorv32_uart0_printf(" > Entered traps               : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER11)); }
    2814:	56842703          	lw	a4,1384(s0)
    2818:	47a1                	li	a5,8
    281a:	00e7fb63          	bgeu	a5,a4,2830 <portable_fini+0x13a>
    281e:	b0b02673          	csrr	a2,mhpmcounter11
    2822:	65a9                	lui	a1,0xa
    2824:	d0858593          	add	a1,a1,-760 # 9d08 <__fini_array_end+0x694>
    2828:	fff50537          	lui	a0,0xfff50
    282c:	293020ef          	jal	52be <neorv32_uart_printf>
    neorv32_uart0_printf("\n");
}
    2830:	4422                	lw	s0,8(sp)
    2832:	40b2                	lw	ra,12(sp)
    neorv32_uart0_printf("\n");
    2834:	65a9                	lui	a1,0xa
    2836:	b2458593          	add	a1,a1,-1244 # 9b24 <__fini_array_end+0x4b0>
    283a:	fff50537          	lui	a0,0xfff50
}
    283e:	0141                	add	sp,sp,16
    neorv32_uart0_printf("\n");
    2840:	27f0206f          	j	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global == 0) {neorv32_uart0_printf("no HPMs available\n"); }
    2844:	65a9                	lui	a1,0xa
    2846:	bdc58593          	add	a1,a1,-1060 # 9bdc <__fini_array_end+0x568>
    284a:	fff50537          	lui	a0,0xfff50
    284e:	271020ef          	jal	52be <neorv32_uart_printf>
    if (num_hpm_cnts_global > 0)  {neorv32_uart0_printf(" > Compressed instructions     : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER3));  }
    2852:	56842783          	lw	a5,1384(s0)
    2856:	ee0794e3          	bnez	a5,273e <portable_fini+0x48>
}
    285a:	4422                	lw	s0,8(sp)
    285c:	40b2                	lw	ra,12(sp)
    neorv32_uart0_printf("\n");
    285e:	65a9                	lui	a1,0xa
    2860:	b2458593          	add	a1,a1,-1244 # 9b24 <__fini_array_end+0x4b0>
    2864:	fff50537          	lui	a0,0xfff50
}
    2868:	0141                	add	sp,sp,16
    neorv32_uart0_printf("\n");
    286a:	2550206f          	j	52be <neorv32_uart_printf>

0000286e <portable_malloc>:

/* Function : portable_malloc
 * Allocate dynamic memory.
 */
void *portable_malloc(size_t size) {
    286e:	1141                	add	sp,sp,-16
    2870:	c606                	sw	ra,12(sp)

  void *pnt;
  pnt = malloc(size);
    2872:	3bf020ef          	jal	5430 <malloc>

  if (pnt <= 0) {
    2876:	c501                	beqz	a0,287e <portable_malloc+0x10>
    neorv32_uart0_printf("Malloc failed!\n");
    asm volatile ("ebreak");
    while(1);
  }
  return pnt;
}
    2878:	40b2                	lw	ra,12(sp)
    287a:	0141                	add	sp,sp,16
    287c:	8082                	ret
    neorv32_uart0_printf("Malloc failed!\n");
    287e:	65a9                	lui	a1,0xa
    2880:	d3058593          	add	a1,a1,-720 # 9d30 <__fini_array_end+0x6bc>
    2884:	fff50537          	lui	a0,0xfff50
    2888:	237020ef          	jal	52be <neorv32_uart_printf>
    asm volatile ("ebreak");
    288c:	9002                	ebreak
    while(1);
    288e:	a001                	j	288e <portable_malloc+0x20>

00002890 <portable_free>:

/* Function : portable_free
 * Free dynamic memory.
 */
void portable_free(void *p) {
  free(p);
    2890:	3ad0206f          	j	543c <free>

00002894 <core_init_state>:
    ee_u8 *buf = 0;
#if CORE_DEBUG
    ee_u8 *start = p;
    ee_printf("State: %d,%d\n", size, seed);
#endif
    size--;
    2894:	fff50893          	add	a7,a0,-1 # fff4ffff <__crt0_ram_last+0x7ff4c000>
    next = 0;
    while ((total + next + 1) < size)
    2898:	4785                	li	a5,1
{
    289a:	8832                	mv	a6,a2
    while ((total + next + 1) < size)
    289c:	1917f063          	bgeu	a5,a7,2a1c <core_init_state+0x188>
    28a0:	0585                	add	a1,a1,1
    28a2:	01059713          	sll	a4,a1,0x10
{
    28a6:	1141                	add	sp,sp,-16
    28a8:	8341                	srl	a4,a4,0x10
            case 6: /* scientific */
                buf  = scipat[(seed >> 3) & 0x3];
                next = 8;
                break;
            case 7: /* invalid */
                buf  = errpat[(seed >> 3) & 0x3];
    28aa:	6f29                	lui	t5,0xa
                buf  = scipat[(seed >> 3) & 0x3];
    28ac:	6ea9                	lui	t4,0xa
                buf  = floatpat[(seed >> 3) & 0x3];
    28ae:	6e29                	lui	t3,0xa
                buf  = intpat[(seed >> 3) & 0x3];
    28b0:	6329                	lui	t1,0xa
    28b2:	00375793          	srl	a5,a4,0x3
{
    28b6:	c622                	sw	s0,12(sp)
    28b8:	c426                	sw	s1,8(sp)
    28ba:	c24a                	sw	s2,4(sp)
    28bc:	c04e                	sw	s3,0(sp)
        switch (seed & 0x7)
    28be:	461d                	li	a2,7
    28c0:	00777393          	and	t2,a4,7
    28c4:	4681                	li	a3,0
                buf  = errpat[(seed >> 3) & 0x3];
    28c6:	06cf0f13          	add	t5,t5,108 # a06c <errpat>
        switch (seed & 0x7)
    28ca:	4591                	li	a1,4
                buf  = scipat[(seed >> 3) & 0x3];
    28cc:	07ce8e93          	add	t4,t4,124 # a07c <scipat>
        switch (seed & 0x7)
    28d0:	4f85                	li	t6,1
                buf  = floatpat[(seed >> 3) & 0x3];
    28d2:	08ce0e13          	add	t3,t3,140 # a08c <floatpat>
                buf  = intpat[(seed >> 3) & 0x3];
    28d6:	09c30313          	add	t1,t1,156 # a09c <intpat>
            *(p + total + i) = ',';
    28da:	02c00293          	li	t0,44
                buf  = intpat[(seed >> 3) & 0x3];
    28de:	8b8d                	and	a5,a5,3
        switch (seed & 0x7)
    28e0:	0ac38863          	beq	t2,a2,2990 <core_init_state+0xfc>
    28e4:	1075e663          	bltu	a1,t2,29f0 <core_init_state+0x15c>
    28e8:	13f5                	add	t2,t2,-3
    28ea:	03c2                	sll	t2,t2,0x10
    28ec:	0103d393          	srl	t2,t2,0x10
                buf  = floatpat[(seed >> 3) & 0x3];
    28f0:	078a                	sll	a5,a5,0x2
        switch (seed & 0x7)
    28f2:	0c7feb63          	bltu	t6,t2,29c8 <core_init_state+0x134>
                buf  = floatpat[(seed >> 3) & 0x3];
    28f6:	97f2                	add	a5,a5,t3
    28f8:	0007a383          	lw	t2,0(a5) # fffe0000 <__crt0_ram_last+0x7ffdc001>
    while ((total + next + 1) < size)
    28fc:	0705                	add	a4,a4,1
    28fe:	0742                	sll	a4,a4,0x10
    2900:	00968913          	add	s2,a3,9
    2904:	8341                	srl	a4,a4,0x10
    2906:	0b197063          	bgeu	s2,a7,29a6 <core_init_state+0x112>
        if (next > 0)
    290a:	00d804b3          	add	s1,a6,a3
    290e:	00138793          	add	a5,t2,1
    2912:	40f487b3          	sub	a5,s1,a5
    2916:	0093e433          	or	s0,t2,s1
    291a:	0037b793          	sltiu	a5,a5,3
    291e:	880d                	and	s0,s0,3
    2920:	0017b793          	seqz	a5,a5
    2924:	00143413          	seqz	s0,s0
    2928:	8fe1                	and	a5,a5,s0
    292a:	ebe1                	bnez	a5,29fa <core_init_state+0x166>
                *(p + total + i) = buf[i];
    292c:	0003c983          	lbu	s3,0(t2)
    2930:	00168413          	add	s0,a3,1
    2934:	47a1                	li	a5,8
    2936:	01348023          	sb	s3,0(s1)
    293a:	0013c683          	lbu	a3,1(t2)
    293e:	9442                	add	s0,s0,a6
    2940:	00d40023          	sb	a3,0(s0)
    2944:	0023c683          	lbu	a3,2(t2)
    2948:	00d48123          	sb	a3,2(s1)
    294c:	0033c683          	lbu	a3,3(t2)
    2950:	00d481a3          	sb	a3,3(s1)
            for (i = 0; i < next; i++)
    2954:	02b78363          	beq	a5,a1,297a <core_init_state+0xe6>
                *(p + total + i) = buf[i];
    2958:	0043c683          	lbu	a3,4(t2)
    295c:	47a1                	li	a5,8
    295e:	00d48223          	sb	a3,4(s1)
    2962:	0053c683          	lbu	a3,5(t2)
    2966:	00d482a3          	sb	a3,5(s1)
    296a:	0063c683          	lbu	a3,6(t2)
    296e:	00d48323          	sb	a3,6(s1)
    2972:	0073c683          	lbu	a3,7(t2)
    2976:	00d483a3          	sb	a3,7(s1)
            *(p + total + i) = ',';
    297a:	97a6                	add	a5,a5,s1
    297c:	00578023          	sb	t0,0(a5)
            total += next + 1;
    2980:	00777393          	and	t2,a4,7
                buf  = intpat[(seed >> 3) & 0x3];
    2984:	00375793          	srl	a5,a4,0x3
            total += next + 1;
    2988:	86ca                	mv	a3,s2
                buf  = intpat[(seed >> 3) & 0x3];
    298a:	8b8d                	and	a5,a5,3
        switch (seed & 0x7)
    298c:	f4c39ce3          	bne	t2,a2,28e4 <core_init_state+0x50>
                buf  = errpat[(seed >> 3) & 0x3];
    2990:	078a                	sll	a5,a5,0x2
    while ((total + next + 1) < size)
    2992:	0705                	add	a4,a4,1
                buf  = errpat[(seed >> 3) & 0x3];
    2994:	97fa                	add	a5,a5,t5
    while ((total + next + 1) < size)
    2996:	0742                	sll	a4,a4,0x10
    2998:	00968913          	add	s2,a3,9
                buf  = errpat[(seed >> 3) & 0x3];
    299c:	0007a383          	lw	t2,0(a5)
    while ((total + next + 1) < size)
    29a0:	8341                	srl	a4,a4,0x10
    29a2:	f71964e3          	bltu	s2,a7,290a <core_init_state+0x76>
            default: /* Never happen, just to make some compilers happy */
                break;
        }
    }
    size++;
    while (total < size)
    29a6:	06a6f563          	bgeu	a3,a0,2a10 <core_init_state+0x17c>
    { /* fill the rest with 0 */
        *(p + total) = 0;
    29aa:	00168793          	add	a5,a3,1
    29ae:	4605                	li	a2,1
    29b0:	04f57d63          	bgeu	a0,a5,2a0a <core_init_state+0x176>
        total++;
    }
#if CORE_DEBUG
    ee_printf("State Input: %s\n", start);
#endif
}
    29b4:	4432                	lw	s0,12(sp)
    29b6:	44a2                	lw	s1,8(sp)
    29b8:	4912                	lw	s2,4(sp)
    29ba:	4982                	lw	s3,0(sp)
        *(p + total) = 0;
    29bc:	4581                	li	a1,0
    29be:	00d80533          	add	a0,a6,a3
}
    29c2:	0141                	add	sp,sp,16
        *(p + total) = 0;
    29c4:	2360306f          	j	5bfa <memset>
    while ((total + next + 1) < size)
    29c8:	0705                	add	a4,a4,1
                buf  = intpat[(seed >> 3) & 0x3];
    29ca:	979a                	add	a5,a5,t1
    while ((total + next + 1) < size)
    29cc:	0742                	sll	a4,a4,0x10
    29ce:	00568913          	add	s2,a3,5
                buf  = intpat[(seed >> 3) & 0x3];
    29d2:	0007a383          	lw	t2,0(a5)
    while ((total + next + 1) < size)
    29d6:	00168413          	add	s0,a3,1
    29da:	8341                	srl	a4,a4,0x10
    29dc:	fd1975e3          	bgeu	s2,a7,29a6 <core_init_state+0x112>
                *(p + total + i) = buf[i];
    29e0:	0003c983          	lbu	s3,0(t2)
    29e4:	00d804b3          	add	s1,a6,a3
                next = 4;
    29e8:	4791                	li	a5,4
                *(p + total + i) = buf[i];
    29ea:	01348023          	sb	s3,0(s1)
            for (i = 0; i < next; i++)
    29ee:	b7b1                	j	293a <core_init_state+0xa6>
                buf  = scipat[(seed >> 3) & 0x3];
    29f0:	078a                	sll	a5,a5,0x2
    29f2:	97f6                	add	a5,a5,t4
    29f4:	0007a383          	lw	t2,0(a5)
                break;
    29f8:	b711                	j	28fc <core_init_state+0x68>
                *(p + total + i) = buf[i];
    29fa:	0003a683          	lw	a3,0(t2)
    29fe:	47a1                	li	a5,8
    2a00:	c094                	sw	a3,0(s1)
    2a02:	0043a683          	lw	a3,4(t2)
    2a06:	c0d4                	sw	a3,4(s1)
            for (i = 0; i < next; i++)
    2a08:	bf8d                	j	297a <core_init_state+0xe6>
        *(p + total) = 0;
    2a0a:	40d50633          	sub	a2,a0,a3
    2a0e:	b75d                	j	29b4 <core_init_state+0x120>
}
    2a10:	4432                	lw	s0,12(sp)
    2a12:	44a2                	lw	s1,8(sp)
    2a14:	4912                	lw	s2,4(sp)
    2a16:	4982                	lw	s3,0(sp)
    2a18:	0141                	add	sp,sp,16
    2a1a:	8082                	ret
    ee_u32 total = 0, next = 0, i;
    2a1c:	4681                	li	a3,0
        *(p + total) = 0;
    2a1e:	00168793          	add	a5,a3,1
    2a22:	4605                	li	a2,1
    2a24:	00f56463          	bltu	a0,a5,2a2c <core_init_state+0x198>
    2a28:	40d50633          	sub	a2,a0,a3
    2a2c:	4581                	li	a1,0
    2a2e:	00d80533          	add	a0,a6,a3
    2a32:	1c80306f          	j	5bfa <memset>

00002a36 <core_state_transition>:
*/

enum CORE_STATE
core_state_transition(ee_u8 **instr, ee_u32 *transition_count)
{
    ee_u8 *         str = *instr;
    2a36:	411c                	lw	a5,0(a0)
{
    2a38:	882a                	mv	a6,a0
    ee_u8           NEXT_SYMBOL;
    enum CORE_STATE state = CORE_START;
    2a3a:	4501                	li	a0,0
    for (; *str && state != CORE_INVALID; str++)
    2a3c:	0007c703          	lbu	a4,0(a5)
    2a40:	cb0d                	beqz	a4,2a72 <core_state_transition+0x3c>
    {
        NEXT_SYMBOL = *str;
        if (NEXT_SYMBOL == ',') /* end of this input */
    2a42:	02c00693          	li	a3,44
    2a46:	4501                	li	a0,0
    2a48:	18d70663          	beq	a4,a3,2bd4 <core_state_transition+0x19e>
            break;
        }
        switch (state)
        {
            case CORE_START:
                if (ee_isdigit(NEXT_SYMBOL))
    2a4c:	02e00513          	li	a0,46
    2a50:	18a70b63          	beq	a4,a0,2be6 <core_state_transition+0x1b0>
    2a54:	14e56d63          	bltu	a0,a4,2bae <core_state_transition+0x178>
    2a58:	fd570713          	add	a4,a4,-43
    2a5c:	0fd77713          	and	a4,a4,253
    2a60:	cf01                	beqz	a4,2a78 <core_state_transition+0x42>
                    state = CORE_FLOAT;
                }
                else
                {
                    state = CORE_INVALID;
                    transition_count[CORE_INVALID]++;
    2a62:	41d4                	lw	a3,4(a1)
                }
                transition_count[CORE_START]++;
    2a64:	4198                	lw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2a66:	0785                	add	a5,a5,1
                    transition_count[CORE_INVALID]++;
    2a68:	0685                	add	a3,a3,1
                transition_count[CORE_START]++;
    2a6a:	0705                	add	a4,a4,1
                    transition_count[CORE_INVALID]++;
    2a6c:	c1d4                	sw	a3,4(a1)
                transition_count[CORE_START]++;
    2a6e:	c198                	sw	a4,0(a1)
                    state = CORE_INVALID;
    2a70:	4505                	li	a0,1
                break;
            default:
                break;
        }
    }
    *instr = str;
    2a72:	00f82023          	sw	a5,0(a6)
    return state;
}
    2a76:	8082                	ret
                transition_count[CORE_START]++;
    2a78:	4198                	lw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2a7a:	00178613          	add	a2,a5,1
                transition_count[CORE_START]++;
    2a7e:	0705                	add	a4,a4,1
    2a80:	c198                	sw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2a82:	0017c883          	lbu	a7,1(a5)
    2a86:	1a088563          	beqz	a7,2c30 <core_state_transition+0x1fa>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2a8a:	16d88e63          	beq	a7,a3,2c06 <core_state_transition+0x1d0>
                    transition_count[CORE_S1]++;
    2a8e:	4594                	lw	a3,8(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2a90:	fd088713          	add	a4,a7,-48
    2a94:	0ff77713          	zext.b	a4,a4
    2a98:	4325                	li	t1,9
                    transition_count[CORE_S1]++;
    2a9a:	0685                	add	a3,a3,1
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2a9c:	00e37a63          	bgeu	t1,a4,2ab0 <core_state_transition+0x7a>
                else if (NEXT_SYMBOL == '.')
    2aa0:	16a88163          	beq	a7,a0,2c02 <core_state_transition+0x1cc>
                    transition_count[CORE_S1]++;
    2aa4:	c594                	sw	a3,8(a1)
    for (; *str && state != CORE_INVALID; str++)
    2aa6:	0789                	add	a5,a5,2
                    state = CORE_INVALID;
    2aa8:	4505                	li	a0,1
    *instr = str;
    2aaa:	00f82023          	sw	a5,0(a6)
}
    2aae:	8082                	ret
                    transition_count[CORE_S1]++;
    2ab0:	c594                	sw	a3,8(a1)
    for (; *str && state != CORE_INVALID; str++)
    2ab2:	00164783          	lbu	a5,1(a2)
    2ab6:	0605                	add	a2,a2,1
    2ab8:	14078b63          	beqz	a5,2c0e <core_state_transition+0x1d8>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2abc:	02c00713          	li	a4,44
    2ac0:	10e78863          	beq	a5,a4,2bd0 <core_state_transition+0x19a>
                if (NEXT_SYMBOL == '.')
    2ac4:	02e00713          	li	a4,46
    2ac8:	02e78263          	beq	a5,a4,2aec <core_state_transition+0xb6>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2acc:	fd078793          	add	a5,a5,-48
    2ad0:	0ff7f793          	zext.b	a5,a5
    2ad4:	4725                	li	a4,9
    2ad6:	fcf77ee3          	bgeu	a4,a5,2ab2 <core_state_transition+0x7c>
                    transition_count[CORE_INT]++;
    2ada:	4998                	lw	a4,16(a1)
    for (; *str && state != CORE_INVALID; str++)
    2adc:	00160793          	add	a5,a2,1
                    state = CORE_INVALID;
    2ae0:	4505                	li	a0,1
                    transition_count[CORE_INT]++;
    2ae2:	0705                	add	a4,a4,1
    2ae4:	c998                	sw	a4,16(a1)
    *instr = str;
    2ae6:	00f82023          	sw	a5,0(a6)
}
    2aea:	8082                	ret
                    transition_count[CORE_INT]++;
    2aec:	499c                	lw	a5,16(a1)
    2aee:	0785                	add	a5,a5,1
    2af0:	c99c                	sw	a5,16(a1)
    2af2:	a801                	j	2b02 <core_state_transition+0xcc>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2af4:	fd078793          	add	a5,a5,-48
    2af8:	0ff7f793          	zext.b	a5,a5
    2afc:	4725                	li	a4,9
    2afe:	0cf76d63          	bltu	a4,a5,2bd8 <core_state_transition+0x1a2>
    for (; *str && state != CORE_INVALID; str++)
    2b02:	00164783          	lbu	a5,1(a2)
    2b06:	0605                	add	a2,a2,1
    2b08:	12078163          	beqz	a5,2c2a <core_state_transition+0x1f4>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2b0c:	02c00713          	li	a4,44
    2b10:	0ee78563          	beq	a5,a4,2bfa <core_state_transition+0x1c4>
                if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e')
    2b14:	0df7f713          	and	a4,a5,223
    2b18:	04500693          	li	a3,69
    2b1c:	fcd71ce3          	bne	a4,a3,2af4 <core_state_transition+0xbe>
                    transition_count[CORE_FLOAT]++;
    2b20:	49d8                	lw	a4,20(a1)
    for (; *str && state != CORE_INVALID; str++)
    2b22:	00160793          	add	a5,a2,1
                    state = CORE_S2;
    2b26:	450d                	li	a0,3
                    transition_count[CORE_FLOAT]++;
    2b28:	0705                	add	a4,a4,1
    2b2a:	c9d8                	sw	a4,20(a1)
    for (; *str && state != CORE_INVALID; str++)
    2b2c:	00164703          	lbu	a4,1(a2)
    2b30:	d329                	beqz	a4,2a72 <core_state_transition+0x3c>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2b32:	02c00693          	li	a3,44
    2b36:	0ed70263          	beq	a4,a3,2c1a <core_state_transition+0x1e4>
                    transition_count[CORE_S2]++;
    2b3a:	45dc                	lw	a5,12(a1)
                if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
    2b3c:	fd570713          	add	a4,a4,-43
    2b40:	0fd77713          	and	a4,a4,253
                    transition_count[CORE_S2]++;
    2b44:	0785                	add	a5,a5,1
    2b46:	c5dc                	sw	a5,12(a1)
                    state = CORE_INVALID;
    2b48:	4505                	li	a0,1
    for (; *str && state != CORE_INVALID; str++)
    2b4a:	00260793          	add	a5,a2,2
                if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
    2b4e:	f315                	bnez	a4,2a72 <core_state_transition+0x3c>
    for (; *str && state != CORE_INVALID; str++)
    2b50:	00264703          	lbu	a4,2(a2)
    2b54:	00260793          	add	a5,a2,2
                    state = CORE_EXPONENT;
    2b58:	4519                	li	a0,6
    for (; *str && state != CORE_INVALID; str++)
    2b5a:	df01                	beqz	a4,2a72 <core_state_transition+0x3c>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2b5c:	0ad70c63          	beq	a4,a3,2c14 <core_state_transition+0x1de>
                    transition_count[CORE_EXPONENT]++;
    2b60:	4d94                	lw	a3,24(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b62:	fd070713          	add	a4,a4,-48
    2b66:	0ff77713          	zext.b	a4,a4
                    transition_count[CORE_EXPONENT]++;
    2b6a:	0685                	add	a3,a3,1
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b6c:	4525                	li	a0,9
                    transition_count[CORE_EXPONENT]++;
    2b6e:	cd94                	sw	a3,24(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b70:	00e57863          	bgeu	a0,a4,2b80 <core_state_transition+0x14a>
    for (; *str && state != CORE_INVALID; str++)
    2b74:	00360793          	add	a5,a2,3
                    state = CORE_INVALID;
    2b78:	4505                	li	a0,1
    *instr = str;
    2b7a:	00f82023          	sw	a5,0(a6)
}
    2b7e:	8082                	ret
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b80:	4625                	li	a2,9
    for (; *str && state != CORE_INVALID; str++)
    2b82:	0017c683          	lbu	a3,1(a5)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b86:	853e                	mv	a0,a5
        if (NEXT_SYMBOL == ',') /* end of this input */
    2b88:	02c00893          	li	a7,44
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b8c:	fd068713          	add	a4,a3,-48
    for (; *str && state != CORE_INVALID; str++)
    2b90:	0785                	add	a5,a5,1
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b92:	0ff77713          	zext.b	a4,a4
    for (; *str && state != CORE_INVALID; str++)
    2b96:	cac1                	beqz	a3,2c26 <core_state_transition+0x1f0>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2b98:	09168463          	beq	a3,a7,2c20 <core_state_transition+0x1ea>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    2b9c:	fee673e3          	bgeu	a2,a4,2b82 <core_state_transition+0x14c>
                    transition_count[CORE_INVALID]++;
    2ba0:	41d8                	lw	a4,4(a1)
    for (; *str && state != CORE_INVALID; str++)
    2ba2:	00250793          	add	a5,a0,2
                    state = CORE_INVALID;
    2ba6:	4505                	li	a0,1
                    transition_count[CORE_INVALID]++;
    2ba8:	0705                	add	a4,a4,1
    2baa:	c1d8                	sw	a4,4(a1)
    for (; *str && state != CORE_INVALID; str++)
    2bac:	b5d9                	j	2a72 <core_state_transition+0x3c>
    2bae:	fd070713          	add	a4,a4,-48
    2bb2:	0ff77713          	zext.b	a4,a4
    2bb6:	4625                	li	a2,9
    2bb8:	eae665e3          	bltu	a2,a4,2a62 <core_state_transition+0x2c>
                transition_count[CORE_START]++;
    2bbc:	4198                	lw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2bbe:	00178613          	add	a2,a5,1
                transition_count[CORE_START]++;
    2bc2:	0705                	add	a4,a4,1
    2bc4:	c198                	sw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2bc6:	0017c783          	lbu	a5,1(a5)
    2bca:	c3b1                	beqz	a5,2c0e <core_state_transition+0x1d8>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2bcc:	eed79ce3          	bne	a5,a3,2ac4 <core_state_transition+0x8e>
    for (; *str && state != CORE_INVALID; str++)
    2bd0:	87b2                	mv	a5,a2
        if (NEXT_SYMBOL == ',') /* end of this input */
    2bd2:	4511                	li	a0,4
            str++;
    2bd4:	0785                	add	a5,a5,1
            break;
    2bd6:	bd71                	j	2a72 <core_state_transition+0x3c>
                    transition_count[CORE_FLOAT]++;
    2bd8:	49d8                	lw	a4,20(a1)
    for (; *str && state != CORE_INVALID; str++)
    2bda:	00160793          	add	a5,a2,1
                    state = CORE_INVALID;
    2bde:	4505                	li	a0,1
                    transition_count[CORE_FLOAT]++;
    2be0:	0705                	add	a4,a4,1
    2be2:	c9d8                	sw	a4,20(a1)
    for (; *str && state != CORE_INVALID; str++)
    2be4:	b579                	j	2a72 <core_state_transition+0x3c>
                transition_count[CORE_START]++;
    2be6:	4198                	lw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2be8:	00178613          	add	a2,a5,1
                transition_count[CORE_START]++;
    2bec:	0705                	add	a4,a4,1
    2bee:	c198                	sw	a4,0(a1)
    for (; *str && state != CORE_INVALID; str++)
    2bf0:	0017c783          	lbu	a5,1(a5)
    2bf4:	cb9d                	beqz	a5,2c2a <core_state_transition+0x1f4>
        if (NEXT_SYMBOL == ',') /* end of this input */
    2bf6:	f0d79fe3          	bne	a5,a3,2b14 <core_state_transition+0xde>
    for (; *str && state != CORE_INVALID; str++)
    2bfa:	87b2                	mv	a5,a2
        if (NEXT_SYMBOL == ',') /* end of this input */
    2bfc:	4515                	li	a0,5
            str++;
    2bfe:	0785                	add	a5,a5,1
            break;
    2c00:	bd8d                	j	2a72 <core_state_transition+0x3c>
                    transition_count[CORE_S1]++;
    2c02:	c594                	sw	a3,8(a1)
    2c04:	bdfd                	j	2b02 <core_state_transition+0xcc>
    for (; *str && state != CORE_INVALID; str++)
    2c06:	87b2                	mv	a5,a2
        if (NEXT_SYMBOL == ',') /* end of this input */
    2c08:	4509                	li	a0,2
            str++;
    2c0a:	0785                	add	a5,a5,1
            break;
    2c0c:	b59d                	j	2a72 <core_state_transition+0x3c>
    for (; *str && state != CORE_INVALID; str++)
    2c0e:	87b2                	mv	a5,a2
    2c10:	4511                	li	a0,4
    2c12:	b585                	j	2a72 <core_state_transition+0x3c>
                    state = CORE_EXPONENT;
    2c14:	4519                	li	a0,6
            str++;
    2c16:	0785                	add	a5,a5,1
            break;
    2c18:	bda9                	j	2a72 <core_state_transition+0x3c>
                    state = CORE_S2;
    2c1a:	450d                	li	a0,3
            str++;
    2c1c:	0785                	add	a5,a5,1
            break;
    2c1e:	bd91                	j	2a72 <core_state_transition+0x3c>
                    state = CORE_SCIENTIFIC;
    2c20:	451d                	li	a0,7
            str++;
    2c22:	0785                	add	a5,a5,1
            break;
    2c24:	b5b9                	j	2a72 <core_state_transition+0x3c>
                    state = CORE_SCIENTIFIC;
    2c26:	451d                	li	a0,7
    2c28:	b5a9                	j	2a72 <core_state_transition+0x3c>
    for (; *str && state != CORE_INVALID; str++)
    2c2a:	87b2                	mv	a5,a2
                    state = CORE_FLOAT;
    2c2c:	4515                	li	a0,5
    2c2e:	b591                	j	2a72 <core_state_transition+0x3c>
    for (; *str && state != CORE_INVALID; str++)
    2c30:	87b2                	mv	a5,a2
    2c32:	4509                	li	a0,2
    2c34:	bd3d                	j	2a72 <core_state_transition+0x3c>

00002c36 <core_bench_state>:
{
    2c36:	7119                	add	sp,sp,-128
    2c38:	dca2                	sw	s0,120(sp)
    2c3a:	daa6                	sw	s1,116(sp)
    2c3c:	d8ca                	sw	s2,112(sp)
    2c3e:	d6ce                	sw	s3,108(sp)
    2c40:	d4d2                	sw	s4,104(sp)
    2c42:	d2d6                	sw	s5,100(sp)
    2c44:	d0da                	sw	s6,96(sp)
    2c46:	cede                	sw	s7,92(sp)
    2c48:	de86                	sw	ra,124(sp)
    2c4a:	842e                	mv	s0,a1
    while (*p != 0)
    2c4c:	0005c583          	lbu	a1,0(a1)
    ee_u8 *p = memblock;
    2c50:	c622                	sw	s0,12(sp)
        final_counts[i] = track_counts[i] = 0;
    2c52:	d802                	sw	zero,48(sp)
    2c54:	c802                	sw	zero,16(sp)
    2c56:	da02                	sw	zero,52(sp)
    2c58:	dc02                	sw	zero,56(sp)
    2c5a:	de02                	sw	zero,60(sp)
    2c5c:	c082                	sw	zero,64(sp)
    2c5e:	c282                	sw	zero,68(sp)
    2c60:	c482                	sw	zero,72(sp)
    2c62:	c682                	sw	zero,76(sp)
    2c64:	ca02                	sw	zero,20(sp)
    2c66:	cc02                	sw	zero,24(sp)
    2c68:	ce02                	sw	zero,28(sp)
    2c6a:	d002                	sw	zero,32(sp)
    2c6c:	d202                	sw	zero,36(sp)
    2c6e:	d402                	sw	zero,40(sp)
    2c70:	d602                	sw	zero,44(sp)
    2c72:	03010913          	add	s2,sp,48
{
    2c76:	8b2a                	mv	s6,a0
    2c78:	8bb2                	mv	s7,a2
    2c7a:	8a36                	mv	s4,a3
    2c7c:	8aba                	mv	s5,a4
    2c7e:	84be                	mv	s1,a5
    2c80:	00c10993          	add	s3,sp,12
    while (*p != 0)
    2c84:	12058363          	beqz	a1,2daa <core_bench_state+0x174>
        enum CORE_STATE fstate = core_state_transition(&p, track_counts);
    2c88:	85ca                	mv	a1,s2
    2c8a:	854e                	mv	a0,s3
    2c8c:	336d                	jal	2a36 <core_state_transition>
        final_counts[fstate]++;
    2c8e:	00251813          	sll	a6,a0,0x2
    2c92:	05080793          	add	a5,a6,80
    2c96:	00278833          	add	a6,a5,sp
    while (*p != 0)
    2c9a:	4732                	lw	a4,12(sp)
        final_counts[fstate]++;
    2c9c:	fc082783          	lw	a5,-64(a6)
    while (*p != 0)
    2ca0:	00074703          	lbu	a4,0(a4)
        final_counts[fstate]++;
    2ca4:	0785                	add	a5,a5,1
    2ca6:	fcf82023          	sw	a5,-64(a6)
    while (*p != 0)
    2caa:	ff79                	bnez	a4,2c88 <core_bench_state+0x52>
    p = memblock;
    2cac:	c622                	sw	s0,12(sp)
    while (p < (memblock + blksize))
    2cae:	9b22                	add	s6,s6,s0
    2cb0:	03647863          	bgeu	s0,s6,2ce0 <core_bench_state+0xaa>
    2cb4:	4705                	li	a4,1
    2cb6:	87a2                	mv	a5,s0
        if (*p != ',')
    2cb8:	02c00613          	li	a2,44
    2cbc:	0aea9163          	bne	s5,a4,2d5e <core_bench_state+0x128>
    2cc0:	0007c703          	lbu	a4,0(a5)
            *p ^= (ee_u8)seed1;
    2cc4:	017746b3          	xor	a3,a4,s7
        if (*p != ',')
    2cc8:	00c70463          	beq	a4,a2,2cd0 <core_bench_state+0x9a>
            *p ^= (ee_u8)seed1;
    2ccc:	00d78023          	sb	a3,0(a5)
    while (p < (memblock + blksize))
    2cd0:	0785                	add	a5,a5,1
    2cd2:	ff67e7e3          	bltu	a5,s6,2cc0 <core_bench_state+0x8a>
    while (*p != 0)
    2cd6:	00044783          	lbu	a5,0(s0)
    2cda:	00c10993          	add	s3,sp,12
    2cde:	c3f1                	beqz	a5,2da2 <core_bench_state+0x16c>
        enum CORE_STATE fstate = core_state_transition(&p, track_counts);
    2ce0:	85ca                	mv	a1,s2
    2ce2:	854e                	mv	a0,s3
    2ce4:	3b89                	jal	2a36 <core_state_transition>
        final_counts[fstate]++;
    2ce6:	00251613          	sll	a2,a0,0x2
    2cea:	05060793          	add	a5,a2,80
    2cee:	00278633          	add	a2,a5,sp
    while (*p != 0)
    2cf2:	4732                	lw	a4,12(sp)
        final_counts[fstate]++;
    2cf4:	fc062783          	lw	a5,-64(a2)
    while (*p != 0)
    2cf8:	00074703          	lbu	a4,0(a4)
        final_counts[fstate]++;
    2cfc:	0785                	add	a5,a5,1
    2cfe:	fcf62023          	sw	a5,-64(a2)
    while (*p != 0)
    2d02:	ff79                	bnez	a4,2ce0 <core_bench_state+0xaa>
    p = memblock;
    2d04:	c622                	sw	s0,12(sp)
    while (p < (memblock + blksize))
    2d06:	03647363          	bgeu	s0,s6,2d2c <core_bench_state+0xf6>
    2d0a:	4785                	li	a5,1
    2d0c:	06fa9c63          	bne	s5,a5,2d84 <core_bench_state+0x14e>
    2d10:	8722                	mv	a4,s0
        if (*p != ',')
    2d12:	02c00613          	li	a2,44
    2d16:	00074783          	lbu	a5,0(a4)
            *p ^= (ee_u8)seed2;
    2d1a:	0147c6b3          	xor	a3,a5,s4
        if (*p != ',')
    2d1e:	00c78463          	beq	a5,a2,2d26 <core_bench_state+0xf0>
            *p ^= (ee_u8)seed2;
    2d22:	00d70023          	sb	a3,0(a4)
    while (p < (memblock + blksize))
    2d26:	0705                	add	a4,a4,1
    2d28:	ff6767e3          	bltu	a4,s6,2d16 <core_bench_state+0xe0>
    for (i = 0; i < NUM_CORE_STATES; i++)
    2d2c:	0800                	add	s0,sp,16
    2d2e:	89ca                	mv	s3,s2
        crc = crcu32(final_counts[i], crc);
    2d30:	4008                	lw	a0,0(s0)
    2d32:	85a6                	mv	a1,s1
    for (i = 0; i < NUM_CORE_STATES; i++)
    2d34:	0411                	add	s0,s0,4
        crc = crcu32(final_counts[i], crc);
    2d36:	2435                	jal	2f62 <crcu32>
    2d38:	85aa                	mv	a1,a0
        crc = crcu32(track_counts[i], crc);
    2d3a:	0009a503          	lw	a0,0(s3)
    for (i = 0; i < NUM_CORE_STATES; i++)
    2d3e:	0991                	add	s3,s3,4
        crc = crcu32(track_counts[i], crc);
    2d40:	240d                	jal	2f62 <crcu32>
    2d42:	84aa                	mv	s1,a0
    for (i = 0; i < NUM_CORE_STATES; i++)
    2d44:	fe8916e3          	bne	s2,s0,2d30 <core_bench_state+0xfa>
}
    2d48:	50f6                	lw	ra,124(sp)
    2d4a:	5466                	lw	s0,120(sp)
    2d4c:	54d6                	lw	s1,116(sp)
    2d4e:	5946                	lw	s2,112(sp)
    2d50:	59b6                	lw	s3,108(sp)
    2d52:	5a26                	lw	s4,104(sp)
    2d54:	5a96                	lw	s5,100(sp)
    2d56:	5b06                	lw	s6,96(sp)
    2d58:	4bf6                	lw	s7,92(sp)
    2d5a:	6109                	add	sp,sp,128
    2d5c:	8082                	ret
        if (*p != ',')
    2d5e:	0007c703          	lbu	a4,0(a5)
            *p ^= (ee_u8)seed1;
    2d62:	017746b3          	xor	a3,a4,s7
        if (*p != ',')
    2d66:	00c70463          	beq	a4,a2,2d6e <core_bench_state+0x138>
            *p ^= (ee_u8)seed1;
    2d6a:	00d78023          	sb	a3,0(a5)
    while (p < (memblock + blksize))
    2d6e:	97d6                	add	a5,a5,s5
    2d70:	ff67e7e3          	bltu	a5,s6,2d5e <core_bench_state+0x128>
    while (*p != 0)
    2d74:	00044783          	lbu	a5,0(s0)
    2d78:	00c10993          	add	s3,sp,12
    2d7c:	f3b5                	bnez	a5,2ce0 <core_bench_state+0xaa>
    p = memblock;
    2d7e:	c622                	sw	s0,12(sp)
    while (p < (memblock + blksize))
    2d80:	fb6476e3          	bgeu	s0,s6,2d2c <core_bench_state+0xf6>
    2d84:	8722                	mv	a4,s0
        if (*p != ',')
    2d86:	02c00613          	li	a2,44
    2d8a:	00074783          	lbu	a5,0(a4)
            *p ^= (ee_u8)seed2;
    2d8e:	0147c6b3          	xor	a3,a5,s4
        if (*p != ',')
    2d92:	00c78463          	beq	a5,a2,2d9a <core_bench_state+0x164>
            *p ^= (ee_u8)seed2;
    2d96:	00d70023          	sb	a3,0(a4)
    while (p < (memblock + blksize))
    2d9a:	9756                	add	a4,a4,s5
    2d9c:	ff6767e3          	bltu	a4,s6,2d8a <core_bench_state+0x154>
    2da0:	b771                	j	2d2c <core_bench_state+0xf6>
    p = memblock;
    2da2:	c622                	sw	s0,12(sp)
    while (p < (memblock + blksize))
    2da4:	f76466e3          	bltu	s0,s6,2d10 <core_bench_state+0xda>
    2da8:	b751                	j	2d2c <core_bench_state+0xf6>
    while (p < (memblock + blksize))
    2daa:	00a40b33          	add	s6,s0,a0
    2dae:	f16463e3          	bltu	s0,s6,2cb4 <core_bench_state+0x7e>
    2db2:	bfad                	j	2d2c <core_bench_state+0xf6>

00002db4 <get_seed_32>:
extern volatile ee_s32 seed5_volatile;
ee_s32
get_seed_32(int i)
{
    ee_s32 retval;
    switch (i)
    2db4:	4795                	li	a5,5
    2db6:	04a7e263          	bltu	a5,a0,2dfa <get_seed_32+0x46>
    2dba:	67a9                	lui	a5,0xa
    2dbc:	0ac78793          	add	a5,a5,172 # a0ac <intpat+0x10>
    2dc0:	050a                	sll	a0,a0,0x2
    2dc2:	953e                	add	a0,a0,a5
    2dc4:	411c                	lw	a5,0(a0)
    2dc6:	8782                	jr	a5
            break;
        case 4:
            retval = seed4_volatile;
            break;
        case 5:
            retval = seed5_volatile;
    2dc8:	800007b7          	lui	a5,0x80000
    2dcc:	5807a503          	lw	a0,1408(a5) # 80000580 <seed5_volatile>
            break;
    2dd0:	8082                	ret
            retval = seed1_volatile;
    2dd2:	800007b7          	lui	a5,0x80000
    2dd6:	5887a503          	lw	a0,1416(a5) # 80000588 <seed1_volatile>
            break;
    2dda:	8082                	ret
            retval = seed2_volatile;
    2ddc:	800007b7          	lui	a5,0x80000
    2de0:	5847a503          	lw	a0,1412(a5) # 80000584 <seed2_volatile>
            break;
    2de4:	8082                	ret
            retval = seed3_volatile;
    2de6:	800007b7          	lui	a5,0x80000
    2dea:	5587a503          	lw	a0,1368(a5) # 80000558 <seed3_volatile>
            break;
    2dee:	8082                	ret
            retval = seed4_volatile;
    2df0:	800007b7          	lui	a5,0x80000
    2df4:	5547a503          	lw	a0,1364(a5) # 80000554 <seed4_volatile>
            break;
    2df8:	8082                	ret
    switch (i)
    2dfa:	4501                	li	a0,0
        default:
            retval = 0;
            break;
    }
    return retval;
}
    2dfc:	8082                	ret

00002dfe <crcu16>:
    return crc;
}
ee_u16
crcu16(ee_u16 newval, ee_u16 crc)
{
    crc = crcu8((ee_u8)(newval), crc);
    2dfe:	0ff57793          	zext.b	a5,a0
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e02:	00b7c6b3          	xor	a3,a5,a1
    2e06:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2e08:	7769                	lui	a4,0xffffa
    2e0a:	0705                	add	a4,a4,1 # ffffa001 <__crt0_ram_last+0x7fff6002>
    2e0c:	40d006b3          	neg	a3,a3
    2e10:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    2e12:	8185                	srl	a1,a1,0x1
        if (x16 == 1)
    2e14:	8ead                	xor	a3,a3,a1
    2e16:	06c2                	sll	a3,a3,0x10
    2e18:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2e1a:	0017d613          	srl	a2,a5,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e1e:	8e35                	xor	a2,a2,a3
    2e20:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2e22:	40c00633          	neg	a2,a2
    2e26:	8e79                	and	a2,a2,a4
        crc >>= 1;
    2e28:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2e2a:	8e35                	xor	a2,a2,a3
    2e2c:	0642                	sll	a2,a2,0x10
    2e2e:	8241                	srl	a2,a2,0x10
        data >>= 1;
    2e30:	0027d693          	srl	a3,a5,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e34:	8eb1                	xor	a3,a3,a2
    2e36:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2e38:	40d006b3          	neg	a3,a3
    2e3c:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    2e3e:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    2e40:	8eb1                	xor	a3,a3,a2
    2e42:	06c2                	sll	a3,a3,0x10
    2e44:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2e46:	0037d613          	srl	a2,a5,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e4a:	8e35                	xor	a2,a2,a3
    2e4c:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2e4e:	40c00633          	neg	a2,a2
    2e52:	8e79                	and	a2,a2,a4
        crc >>= 1;
    2e54:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2e56:	8e35                	xor	a2,a2,a3
    2e58:	0642                	sll	a2,a2,0x10
    2e5a:	8241                	srl	a2,a2,0x10
        data >>= 1;
    2e5c:	0047d693          	srl	a3,a5,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e60:	8eb1                	xor	a3,a3,a2
    2e62:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2e64:	40d006b3          	neg	a3,a3
    2e68:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    2e6a:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    2e6c:	8eb1                	xor	a3,a3,a2
    2e6e:	06c2                	sll	a3,a3,0x10
    2e70:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2e72:	0057d613          	srl	a2,a5,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e76:	8e35                	xor	a2,a2,a3
    2e78:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2e7a:	40c00633          	neg	a2,a2
    2e7e:	8e79                	and	a2,a2,a4
        crc >>= 1;
    2e80:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2e82:	8e35                	xor	a2,a2,a3
    2e84:	0642                	sll	a2,a2,0x10
    2e86:	8241                	srl	a2,a2,0x10
        data >>= 1;
    2e88:	0067d693          	srl	a3,a5,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2e8c:	8eb1                	xor	a3,a3,a2
    2e8e:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2e90:	40d006b3          	neg	a3,a3
    2e94:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    2e96:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    2e98:	8eb1                	xor	a3,a3,a2
    2e9a:	06c2                	sll	a3,a3,0x10
    2e9c:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2e9e:	839d                	srl	a5,a5,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2ea0:	8fb5                	xor	a5,a5,a3
    2ea2:	8b85                	and	a5,a5,1
        if (x16 == 1)
    2ea4:	40f007b3          	neg	a5,a5
    2ea8:	8ff9                	and	a5,a5,a4
        crc >>= 1;
    2eaa:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2eac:	8fb5                	xor	a5,a5,a3
    2eae:	07c2                	sll	a5,a5,0x10
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    2eb0:	8121                	srl	a0,a0,0x8
        if (x16 == 1)
    2eb2:	83c1                	srl	a5,a5,0x10
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2eb4:	00f546b3          	xor	a3,a0,a5
    2eb8:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2eba:	40d006b3          	neg	a3,a3
    2ebe:	8ef9                	and	a3,a3,a4
    2ec0:	8385                	srl	a5,a5,0x1
    2ec2:	8fb5                	xor	a5,a5,a3
    2ec4:	07c2                	sll	a5,a5,0x10
    2ec6:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    2ec8:	00155693          	srl	a3,a0,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2ecc:	8ebd                	xor	a3,a3,a5
    2ece:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2ed0:	40d006b3          	neg	a3,a3
    2ed4:	8ef9                	and	a3,a3,a4
    2ed6:	8385                	srl	a5,a5,0x1
    2ed8:	8ebd                	xor	a3,a3,a5
    2eda:	06c2                	sll	a3,a3,0x10
    2edc:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2ede:	00255793          	srl	a5,a0,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2ee2:	8fb5                	xor	a5,a5,a3
    2ee4:	8b85                	and	a5,a5,1
        if (x16 == 1)
    2ee6:	40f007b3          	neg	a5,a5
    2eea:	8ff9                	and	a5,a5,a4
    2eec:	8285                	srl	a3,a3,0x1
    2eee:	8fb5                	xor	a5,a5,a3
    2ef0:	07c2                	sll	a5,a5,0x10
    2ef2:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    2ef4:	00355693          	srl	a3,a0,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2ef8:	8ebd                	xor	a3,a3,a5
    2efa:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2efc:	40d006b3          	neg	a3,a3
    2f00:	8ef9                	and	a3,a3,a4
    2f02:	8385                	srl	a5,a5,0x1
    2f04:	8ebd                	xor	a3,a3,a5
    2f06:	06c2                	sll	a3,a3,0x10
    2f08:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2f0a:	00455793          	srl	a5,a0,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f0e:	8fb5                	xor	a5,a5,a3
    2f10:	8b85                	and	a5,a5,1
        if (x16 == 1)
    2f12:	40f007b3          	neg	a5,a5
    2f16:	8ff9                	and	a5,a5,a4
    2f18:	8285                	srl	a3,a3,0x1
    2f1a:	8fb5                	xor	a5,a5,a3
    2f1c:	07c2                	sll	a5,a5,0x10
    2f1e:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    2f20:	00555693          	srl	a3,a0,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f24:	8ebd                	xor	a3,a3,a5
    2f26:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2f28:	40d006b3          	neg	a3,a3
    2f2c:	8ef9                	and	a3,a3,a4
    2f2e:	8385                	srl	a5,a5,0x1
    2f30:	8ebd                	xor	a3,a3,a5
    2f32:	06c2                	sll	a3,a3,0x10
    2f34:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2f36:	00655793          	srl	a5,a0,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f3a:	8fb5                	xor	a5,a5,a3
    2f3c:	8b85                	and	a5,a5,1
        if (x16 == 1)
    2f3e:	40f007b3          	neg	a5,a5
    2f42:	8ff9                	and	a5,a5,a4
    2f44:	8285                	srl	a3,a3,0x1
    2f46:	8fb5                	xor	a5,a5,a3
    2f48:	07c2                	sll	a5,a5,0x10
    2f4a:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    2f4c:	811d                	srl	a0,a0,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f4e:	8d3d                	xor	a0,a0,a5
    2f50:	8905                	and	a0,a0,1
        if (x16 == 1)
    2f52:	40a00533          	neg	a0,a0
    2f56:	8d79                	and	a0,a0,a4
    2f58:	8385                	srl	a5,a5,0x1
    2f5a:	8d3d                	xor	a0,a0,a5
    return crc;
}
    2f5c:	0542                	sll	a0,a0,0x10
    2f5e:	8141                	srl	a0,a0,0x10
    2f60:	8082                	ret

00002f62 <crcu32>:
    crc = crcu8((ee_u8)(newval), crc);
    2f62:	0ff57713          	zext.b	a4,a0
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f66:	00b74633          	xor	a2,a4,a1
    2f6a:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2f6c:	77e9                	lui	a5,0xffffa
    2f6e:	0785                	add	a5,a5,1 # ffffa001 <__crt0_ram_last+0x7fff6002>
    2f70:	40c00633          	neg	a2,a2
    2f74:	8e7d                	and	a2,a2,a5
        crc >>= 1;
    2f76:	8185                	srl	a1,a1,0x1
        if (x16 == 1)
    2f78:	8e2d                	xor	a2,a2,a1
    2f7a:	0642                	sll	a2,a2,0x10
    2f7c:	8241                	srl	a2,a2,0x10
        data >>= 1;
    2f7e:	00175693          	srl	a3,a4,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f82:	8eb1                	xor	a3,a3,a2
    2f84:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2f86:	40d006b3          	neg	a3,a3
    2f8a:	8efd                	and	a3,a3,a5
        crc >>= 1;
    2f8c:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    2f8e:	8eb1                	xor	a3,a3,a2
    2f90:	06c2                	sll	a3,a3,0x10
    2f92:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2f94:	00275613          	srl	a2,a4,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2f98:	8e35                	xor	a2,a2,a3
    2f9a:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2f9c:	40c00633          	neg	a2,a2
    2fa0:	8e7d                	and	a2,a2,a5
        crc >>= 1;
    2fa2:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2fa4:	8e35                	xor	a2,a2,a3
    2fa6:	0642                	sll	a2,a2,0x10
    2fa8:	8241                	srl	a2,a2,0x10
        data >>= 1;
    2faa:	00375693          	srl	a3,a4,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2fae:	8eb1                	xor	a3,a3,a2
    2fb0:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2fb2:	40d006b3          	neg	a3,a3
    2fb6:	8efd                	and	a3,a3,a5
        crc >>= 1;
    2fb8:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    2fba:	8eb1                	xor	a3,a3,a2
    2fbc:	06c2                	sll	a3,a3,0x10
    2fbe:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2fc0:	00475613          	srl	a2,a4,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2fc4:	8e35                	xor	a2,a2,a3
    2fc6:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2fc8:	40c00633          	neg	a2,a2
    2fcc:	8e7d                	and	a2,a2,a5
        crc >>= 1;
    2fce:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2fd0:	8e35                	xor	a2,a2,a3
    2fd2:	0642                	sll	a2,a2,0x10
    2fd4:	8241                	srl	a2,a2,0x10
        data >>= 1;
    2fd6:	00575693          	srl	a3,a4,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2fda:	8eb1                	xor	a3,a3,a2
    2fdc:	8a85                	and	a3,a3,1
        if (x16 == 1)
    2fde:	40d006b3          	neg	a3,a3
    2fe2:	8efd                	and	a3,a3,a5
        crc >>= 1;
    2fe4:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    2fe6:	8eb1                	xor	a3,a3,a2
    2fe8:	06c2                	sll	a3,a3,0x10
    2fea:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    2fec:	00675613          	srl	a2,a4,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    2ff0:	8e35                	xor	a2,a2,a3
    2ff2:	8a05                	and	a2,a2,1
        if (x16 == 1)
    2ff4:	40c00633          	neg	a2,a2
    2ff8:	8e7d                	and	a2,a2,a5
        crc >>= 1;
    2ffa:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    2ffc:	8e35                	xor	a2,a2,a3
    2ffe:	0642                	sll	a2,a2,0x10
    3000:	8241                	srl	a2,a2,0x10
        data >>= 1;
    3002:	00775693          	srl	a3,a4,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3006:	8eb1                	xor	a3,a3,a2
    3008:	8a85                	and	a3,a3,1
        if (x16 == 1)
    300a:	40d006b3          	neg	a3,a3
    300e:	8efd                	and	a3,a3,a5
        crc >>= 1;
    3010:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    3012:	8eb1                	xor	a3,a3,a2
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    3014:	01051713          	sll	a4,a0,0x10
    3018:	8341                	srl	a4,a4,0x10
        if (x16 == 1)
    301a:	06c2                	sll	a3,a3,0x10
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    301c:	8321                	srl	a4,a4,0x8
        if (x16 == 1)
    301e:	82c1                	srl	a3,a3,0x10
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3020:	00d74633          	xor	a2,a4,a3
    3024:	8a05                	and	a2,a2,1
        if (x16 == 1)
    3026:	40c00633          	neg	a2,a2
    302a:	8e7d                	and	a2,a2,a5
    302c:	8285                	srl	a3,a3,0x1
    302e:	8e35                	xor	a2,a2,a3
    3030:	0642                	sll	a2,a2,0x10
    3032:	8241                	srl	a2,a2,0x10
        data >>= 1;
    3034:	00175693          	srl	a3,a4,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3038:	8eb1                	xor	a3,a3,a2
    303a:	8a85                	and	a3,a3,1
        if (x16 == 1)
    303c:	40d006b3          	neg	a3,a3
    3040:	8efd                	and	a3,a3,a5
    3042:	8205                	srl	a2,a2,0x1
    3044:	8eb1                	xor	a3,a3,a2
    3046:	06c2                	sll	a3,a3,0x10
    3048:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    304a:	00275613          	srl	a2,a4,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    304e:	8e35                	xor	a2,a2,a3
    3050:	8a05                	and	a2,a2,1
        if (x16 == 1)
    3052:	40c00633          	neg	a2,a2
    3056:	8e7d                	and	a2,a2,a5
    3058:	8285                	srl	a3,a3,0x1
    305a:	8e35                	xor	a2,a2,a3
    305c:	0642                	sll	a2,a2,0x10
    305e:	8241                	srl	a2,a2,0x10
        data >>= 1;
    3060:	00375693          	srl	a3,a4,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3064:	8eb1                	xor	a3,a3,a2
    3066:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3068:	40d006b3          	neg	a3,a3
    306c:	8efd                	and	a3,a3,a5
    306e:	8205                	srl	a2,a2,0x1
    3070:	8eb1                	xor	a3,a3,a2
    3072:	06c2                	sll	a3,a3,0x10
    3074:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3076:	00475613          	srl	a2,a4,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    307a:	8e35                	xor	a2,a2,a3
    307c:	8a05                	and	a2,a2,1
        if (x16 == 1)
    307e:	40c00633          	neg	a2,a2
    3082:	8e7d                	and	a2,a2,a5
    3084:	8285                	srl	a3,a3,0x1
    3086:	8e35                	xor	a2,a2,a3
    3088:	0642                	sll	a2,a2,0x10
    308a:	8241                	srl	a2,a2,0x10
        data >>= 1;
    308c:	00575693          	srl	a3,a4,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3090:	8eb1                	xor	a3,a3,a2
    3092:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3094:	40d006b3          	neg	a3,a3
    3098:	8efd                	and	a3,a3,a5
    309a:	8205                	srl	a2,a2,0x1
    309c:	8eb1                	xor	a3,a3,a2
    309e:	06c2                	sll	a3,a3,0x10
    30a0:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    30a2:	00675613          	srl	a2,a4,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    30a6:	8e35                	xor	a2,a2,a3
    30a8:	8a05                	and	a2,a2,1
        if (x16 == 1)
    30aa:	40c00633          	neg	a2,a2
    30ae:	8e7d                	and	a2,a2,a5
    30b0:	8285                	srl	a3,a3,0x1
    30b2:	8e35                	xor	a2,a2,a3
    30b4:	0642                	sll	a2,a2,0x10
    30b6:	8241                	srl	a2,a2,0x10
        data >>= 1;
    30b8:	00775693          	srl	a3,a4,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    30bc:	8eb1                	xor	a3,a3,a2
    30be:	8a85                	and	a3,a3,1
        if (x16 == 1)
    30c0:	40d006b3          	neg	a3,a3
    30c4:	8efd                	and	a3,a3,a5
    30c6:	8205                	srl	a2,a2,0x1
    30c8:	8eb1                	xor	a3,a3,a2
ee_u16
crcu32(ee_u32 newval, ee_u16 crc)
{
    crc = crc16((ee_s16)newval, crc);
    crc = crc16((ee_s16)(newval >> 16), crc);
    30ca:	8141                	srl	a0,a0,0x10
        if (x16 == 1)
    30cc:	06c2                	sll	a3,a3,0x10
    crc = crcu8((ee_u8)(newval), crc);
    30ce:	0ff57713          	zext.b	a4,a0
        if (x16 == 1)
    30d2:	82c1                	srl	a3,a3,0x10
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    30d4:	00d74633          	xor	a2,a4,a3
    30d8:	8a05                	and	a2,a2,1
        if (x16 == 1)
    30da:	40c00633          	neg	a2,a2
    30de:	8e7d                	and	a2,a2,a5
    30e0:	8285                	srl	a3,a3,0x1
    30e2:	8eb1                	xor	a3,a3,a2
    30e4:	06c2                	sll	a3,a3,0x10
    30e6:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    30e8:	00175613          	srl	a2,a4,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    30ec:	8e35                	xor	a2,a2,a3
    30ee:	8a05                	and	a2,a2,1
        if (x16 == 1)
    30f0:	40c00633          	neg	a2,a2
    30f4:	8e7d                	and	a2,a2,a5
    30f6:	8285                	srl	a3,a3,0x1
    30f8:	8e35                	xor	a2,a2,a3
    30fa:	0642                	sll	a2,a2,0x10
    30fc:	8241                	srl	a2,a2,0x10
        data >>= 1;
    30fe:	00275693          	srl	a3,a4,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3102:	8eb1                	xor	a3,a3,a2
    3104:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3106:	40d006b3          	neg	a3,a3
    310a:	8efd                	and	a3,a3,a5
    310c:	8205                	srl	a2,a2,0x1
    310e:	8eb1                	xor	a3,a3,a2
    3110:	06c2                	sll	a3,a3,0x10
    3112:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3114:	00375613          	srl	a2,a4,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3118:	8e35                	xor	a2,a2,a3
    311a:	8a05                	and	a2,a2,1
        if (x16 == 1)
    311c:	40c00633          	neg	a2,a2
    3120:	8e7d                	and	a2,a2,a5
    3122:	8285                	srl	a3,a3,0x1
    3124:	8e35                	xor	a2,a2,a3
    3126:	0642                	sll	a2,a2,0x10
    3128:	8241                	srl	a2,a2,0x10
        data >>= 1;
    312a:	00475693          	srl	a3,a4,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    312e:	8eb1                	xor	a3,a3,a2
    3130:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3132:	40d006b3          	neg	a3,a3
    3136:	8efd                	and	a3,a3,a5
    3138:	8205                	srl	a2,a2,0x1
    313a:	8eb1                	xor	a3,a3,a2
    313c:	06c2                	sll	a3,a3,0x10
    313e:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3140:	00575613          	srl	a2,a4,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3144:	8e35                	xor	a2,a2,a3
    3146:	8a05                	and	a2,a2,1
        if (x16 == 1)
    3148:	40c00633          	neg	a2,a2
    314c:	8e7d                	and	a2,a2,a5
    314e:	8285                	srl	a3,a3,0x1
    3150:	8e35                	xor	a2,a2,a3
    3152:	0642                	sll	a2,a2,0x10
    3154:	8241                	srl	a2,a2,0x10
        data >>= 1;
    3156:	00675693          	srl	a3,a4,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    315a:	8eb1                	xor	a3,a3,a2
    315c:	8a85                	and	a3,a3,1
        if (x16 == 1)
    315e:	40d006b3          	neg	a3,a3
    3162:	8efd                	and	a3,a3,a5
    3164:	8205                	srl	a2,a2,0x1
    3166:	8eb1                	xor	a3,a3,a2
    3168:	06c2                	sll	a3,a3,0x10
    316a:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    316c:	831d                	srl	a4,a4,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    316e:	8f35                	xor	a4,a4,a3
    3170:	8b05                	and	a4,a4,1
        if (x16 == 1)
    3172:	40e00733          	neg	a4,a4
    3176:	8f7d                	and	a4,a4,a5
    3178:	8285                	srl	a3,a3,0x1
    317a:	8f35                	xor	a4,a4,a3
    317c:	0742                	sll	a4,a4,0x10
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    317e:	8121                	srl	a0,a0,0x8
        if (x16 == 1)
    3180:	8341                	srl	a4,a4,0x10
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3182:	00e546b3          	xor	a3,a0,a4
    3186:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3188:	40d006b3          	neg	a3,a3
    318c:	8efd                	and	a3,a3,a5
    318e:	8305                	srl	a4,a4,0x1
    3190:	8f35                	xor	a4,a4,a3
    3192:	0742                	sll	a4,a4,0x10
    3194:	8341                	srl	a4,a4,0x10
        data >>= 1;
    3196:	00155693          	srl	a3,a0,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    319a:	8eb9                	xor	a3,a3,a4
    319c:	8a85                	and	a3,a3,1
        if (x16 == 1)
    319e:	40d006b3          	neg	a3,a3
    31a2:	8efd                	and	a3,a3,a5
    31a4:	8305                	srl	a4,a4,0x1
    31a6:	8eb9                	xor	a3,a3,a4
    31a8:	06c2                	sll	a3,a3,0x10
    31aa:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    31ac:	00255713          	srl	a4,a0,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    31b0:	8f35                	xor	a4,a4,a3
    31b2:	8b05                	and	a4,a4,1
        if (x16 == 1)
    31b4:	40e00733          	neg	a4,a4
    31b8:	8f7d                	and	a4,a4,a5
    31ba:	8285                	srl	a3,a3,0x1
    31bc:	8f35                	xor	a4,a4,a3
    31be:	0742                	sll	a4,a4,0x10
    31c0:	8341                	srl	a4,a4,0x10
        data >>= 1;
    31c2:	00355693          	srl	a3,a0,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    31c6:	8eb9                	xor	a3,a3,a4
    31c8:	8a85                	and	a3,a3,1
        if (x16 == 1)
    31ca:	40d006b3          	neg	a3,a3
    31ce:	8efd                	and	a3,a3,a5
    31d0:	8305                	srl	a4,a4,0x1
    31d2:	8eb9                	xor	a3,a3,a4
    31d4:	06c2                	sll	a3,a3,0x10
    31d6:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    31d8:	00455713          	srl	a4,a0,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    31dc:	8f35                	xor	a4,a4,a3
    31de:	8b05                	and	a4,a4,1
        if (x16 == 1)
    31e0:	40e00733          	neg	a4,a4
    31e4:	8f7d                	and	a4,a4,a5
    31e6:	8285                	srl	a3,a3,0x1
    31e8:	8f35                	xor	a4,a4,a3
    31ea:	0742                	sll	a4,a4,0x10
    31ec:	8341                	srl	a4,a4,0x10
        data >>= 1;
    31ee:	00555693          	srl	a3,a0,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    31f2:	8eb9                	xor	a3,a3,a4
    31f4:	8a85                	and	a3,a3,1
        if (x16 == 1)
    31f6:	40d006b3          	neg	a3,a3
    31fa:	8efd                	and	a3,a3,a5
    31fc:	8305                	srl	a4,a4,0x1
    31fe:	8eb9                	xor	a3,a3,a4
    3200:	06c2                	sll	a3,a3,0x10
    3202:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3204:	00655713          	srl	a4,a0,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3208:	8f35                	xor	a4,a4,a3
    320a:	8b05                	and	a4,a4,1
        if (x16 == 1)
    320c:	40e00733          	neg	a4,a4
    3210:	8f7d                	and	a4,a4,a5
    3212:	8285                	srl	a3,a3,0x1
    3214:	8f35                	xor	a4,a4,a3
    3216:	0742                	sll	a4,a4,0x10
    3218:	8341                	srl	a4,a4,0x10
        data >>= 1;
    321a:	811d                	srl	a0,a0,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    321c:	8d39                	xor	a0,a0,a4
    321e:	8905                	and	a0,a0,1
        if (x16 == 1)
    3220:	40a00533          	neg	a0,a0
    3224:	8d7d                	and	a0,a0,a5
    3226:	8305                	srl	a4,a4,0x1
    3228:	8d39                	xor	a0,a0,a4
    return crc;
}
    322a:	0542                	sll	a0,a0,0x10
    322c:	8141                	srl	a0,a0,0x10
    322e:	8082                	ret

00003230 <crc16>:
    crc = crcu8((ee_u8)(newval), crc);
    3230:	0ff57793          	zext.b	a5,a0
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3234:	00b7c6b3          	xor	a3,a5,a1
    3238:	8a85                	and	a3,a3,1
        if (x16 == 1)
    323a:	7769                	lui	a4,0xffffa
    323c:	0705                	add	a4,a4,1 # ffffa001 <__crt0_ram_last+0x7fff6002>
    323e:	40d006b3          	neg	a3,a3
    3242:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    3244:	8185                	srl	a1,a1,0x1
        if (x16 == 1)
    3246:	8ead                	xor	a3,a3,a1
    3248:	06c2                	sll	a3,a3,0x10
    324a:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    324c:	0017d613          	srl	a2,a5,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3250:	8e35                	xor	a2,a2,a3
    3252:	8a05                	and	a2,a2,1
        if (x16 == 1)
    3254:	40c00633          	neg	a2,a2
    3258:	8e79                	and	a2,a2,a4
        crc >>= 1;
    325a:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    325c:	8e35                	xor	a2,a2,a3
    325e:	0642                	sll	a2,a2,0x10
    3260:	8241                	srl	a2,a2,0x10
        data >>= 1;
    3262:	0027d693          	srl	a3,a5,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3266:	8eb1                	xor	a3,a3,a2
    3268:	8a85                	and	a3,a3,1
        if (x16 == 1)
    326a:	40d006b3          	neg	a3,a3
    326e:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    3270:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    3272:	8eb1                	xor	a3,a3,a2
    3274:	06c2                	sll	a3,a3,0x10
    3276:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3278:	0037d613          	srl	a2,a5,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    327c:	8e35                	xor	a2,a2,a3
    327e:	8a05                	and	a2,a2,1
        if (x16 == 1)
    3280:	40c00633          	neg	a2,a2
    3284:	8e79                	and	a2,a2,a4
        crc >>= 1;
    3286:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    3288:	8e35                	xor	a2,a2,a3
    328a:	0642                	sll	a2,a2,0x10
    328c:	8241                	srl	a2,a2,0x10
        data >>= 1;
    328e:	0047d693          	srl	a3,a5,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3292:	8eb1                	xor	a3,a3,a2
    3294:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3296:	40d006b3          	neg	a3,a3
    329a:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    329c:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    329e:	8eb1                	xor	a3,a3,a2
    32a0:	06c2                	sll	a3,a3,0x10
    32a2:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    32a4:	0057d613          	srl	a2,a5,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    32a8:	8e35                	xor	a2,a2,a3
    32aa:	8a05                	and	a2,a2,1
        if (x16 == 1)
    32ac:	40c00633          	neg	a2,a2
    32b0:	8e79                	and	a2,a2,a4
        crc >>= 1;
    32b2:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    32b4:	8e35                	xor	a2,a2,a3
    32b6:	0642                	sll	a2,a2,0x10
    32b8:	8241                	srl	a2,a2,0x10
        data >>= 1;
    32ba:	0067d693          	srl	a3,a5,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    32be:	8eb1                	xor	a3,a3,a2
    32c0:	8a85                	and	a3,a3,1
        if (x16 == 1)
    32c2:	40d006b3          	neg	a3,a3
    32c6:	8ef9                	and	a3,a3,a4
        crc >>= 1;
    32c8:	8205                	srl	a2,a2,0x1
        if (x16 == 1)
    32ca:	8eb1                	xor	a3,a3,a2
    32cc:	06c2                	sll	a3,a3,0x10
    32ce:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    32d0:	839d                	srl	a5,a5,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    32d2:	8fb5                	xor	a5,a5,a3
    32d4:	8b85                	and	a5,a5,1
        if (x16 == 1)
    32d6:	40f007b3          	neg	a5,a5
    32da:	8ff9                	and	a5,a5,a4
        crc >>= 1;
    32dc:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    32de:	8fb5                	xor	a5,a5,a3
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    32e0:	0542                	sll	a0,a0,0x10
    32e2:	8141                	srl	a0,a0,0x10
        if (x16 == 1)
    32e4:	07c2                	sll	a5,a5,0x10
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    32e6:	8121                	srl	a0,a0,0x8
        if (x16 == 1)
    32e8:	83c1                	srl	a5,a5,0x10
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    32ea:	00f546b3          	xor	a3,a0,a5
    32ee:	8a85                	and	a3,a3,1
        if (x16 == 1)
    32f0:	40d006b3          	neg	a3,a3
    32f4:	8ef9                	and	a3,a3,a4
    32f6:	8385                	srl	a5,a5,0x1
    32f8:	8fb5                	xor	a5,a5,a3
    32fa:	07c2                	sll	a5,a5,0x10
    32fc:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    32fe:	00155693          	srl	a3,a0,0x1
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3302:	8ebd                	xor	a3,a3,a5
    3304:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3306:	40d006b3          	neg	a3,a3
    330a:	8ef9                	and	a3,a3,a4
    330c:	8385                	srl	a5,a5,0x1
    330e:	8ebd                	xor	a3,a3,a5
    3310:	06c2                	sll	a3,a3,0x10
    3312:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3314:	00255793          	srl	a5,a0,0x2
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3318:	8fb5                	xor	a5,a5,a3
    331a:	8b85                	and	a5,a5,1
        if (x16 == 1)
    331c:	40f007b3          	neg	a5,a5
    3320:	8ff9                	and	a5,a5,a4
    3322:	8285                	srl	a3,a3,0x1
    3324:	8fb5                	xor	a5,a5,a3
    3326:	07c2                	sll	a5,a5,0x10
    3328:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    332a:	00355693          	srl	a3,a0,0x3
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    332e:	8ebd                	xor	a3,a3,a5
    3330:	8a85                	and	a3,a3,1
        if (x16 == 1)
    3332:	40d006b3          	neg	a3,a3
    3336:	8ef9                	and	a3,a3,a4
    3338:	8385                	srl	a5,a5,0x1
    333a:	8ebd                	xor	a3,a3,a5
    333c:	06c2                	sll	a3,a3,0x10
    333e:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    3340:	00455793          	srl	a5,a0,0x4
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3344:	8fb5                	xor	a5,a5,a3
    3346:	8b85                	and	a5,a5,1
        if (x16 == 1)
    3348:	40f007b3          	neg	a5,a5
    334c:	8ff9                	and	a5,a5,a4
    334e:	8285                	srl	a3,a3,0x1
    3350:	8fb5                	xor	a5,a5,a3
    3352:	07c2                	sll	a5,a5,0x10
    3354:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    3356:	00555693          	srl	a3,a0,0x5
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    335a:	8ebd                	xor	a3,a3,a5
    335c:	8a85                	and	a3,a3,1
        if (x16 == 1)
    335e:	40d006b3          	neg	a3,a3
    3362:	8ef9                	and	a3,a3,a4
    3364:	8385                	srl	a5,a5,0x1
    3366:	8ebd                	xor	a3,a3,a5
    3368:	06c2                	sll	a3,a3,0x10
    336a:	82c1                	srl	a3,a3,0x10
        data >>= 1;
    336c:	00655793          	srl	a5,a0,0x6
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3370:	8fb5                	xor	a5,a5,a3
    3372:	8b85                	and	a5,a5,1
        if (x16 == 1)
    3374:	40f007b3          	neg	a5,a5
    3378:	8ff9                	and	a5,a5,a4
    337a:	8285                	srl	a3,a3,0x1
    337c:	8fb5                	xor	a5,a5,a3
    337e:	07c2                	sll	a5,a5,0x10
    3380:	83c1                	srl	a5,a5,0x10
        data >>= 1;
    3382:	811d                	srl	a0,a0,0x7
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    3384:	8d3d                	xor	a0,a0,a5
    3386:	8905                	and	a0,a0,1
        if (x16 == 1)
    3388:	40a00533          	neg	a0,a0
    338c:	8d79                	and	a0,a0,a4
    338e:	8385                	srl	a5,a5,0x1
    3390:	8d3d                	xor	a0,a0,a5
ee_u16
crc16(ee_s16 newval, ee_u16 crc)
{
    return crcu16((ee_u16)newval, crc);
}
    3392:	0542                	sll	a0,a0,0x10
    3394:	8141                	srl	a0,a0,0x10
    3396:	8082                	ret

00003398 <check_data_types>:
    if (retval > 0)
    {
        ee_printf("ERROR: Please modify the datatypes in core_portme.h!\n");
    }
    return retval;
}
    3398:	4501                	li	a0,0
    339a:	8082                	ret

0000339c <cvt>:
{
    int    r2;
    double fi, fj;
    char * p, *p1;

    if (ndigits < 0)
    339c:	fff64893          	not	a7,a2
{
    33a0:	7159                	add	sp,sp,-112
    33a2:	41f8d893          	sra	a7,a7,0x1f
    33a6:	d0ca                	sw	s2,96(sp)
    33a8:	893e                	mv	s2,a5
    33aa:	011677b3          	and	a5,a2,a7
    33ae:	d4a2                	sw	s0,104(sp)
    33b0:	d2a6                	sw	s1,100(sp)
    33b2:	cece                	sw	s3,92(sp)
    33b4:	ccd2                	sw	s4,88(sp)
    33b6:	d686                	sw	ra,108(sp)
    33b8:	c8da                	sw	s6,80(sp)
    33ba:	c6de                	sw	s7,76(sp)
    33bc:	c4e2                	sw	s8,72(sp)
    33be:	c2e6                	sw	s9,68(sp)
    33c0:	de6e                	sw	s11,60(sp)
        ndigits = 0;
    if (ndigits >= CVTBUFSIZE - 1)
    33c2:	04e00313          	li	t1,78
{
    33c6:	ce42                	sw	a6,28(sp)
    33c8:	cc3e                	sw	a5,24(sp)
    33ca:	84aa                	mv	s1,a0
    33cc:	842e                	mv	s0,a1
    33ce:	8a36                	mv	s4,a3
    33d0:	89ba                	mv	s3,a4
    if (ndigits >= CVTBUFSIZE - 1)
    33d2:	00c35563          	bge	t1,a2,33dc <cvt+0x40>
    33d6:	04e00793          	li	a5,78
    33da:	cc3e                	sw	a5,24(sp)
        ndigits = CVTBUFSIZE - 2;
    r2    = 0;
    *sign = 0;
    p     = &buf[0];
    if (arg < 0)
    33dc:	8526                	mv	a0,s1
    33de:	85a2                	mv	a1,s0
    33e0:	4601                	li	a2,0
    33e2:	4681                	li	a3,0
    33e4:	23e050ef          	jal	8622 <__ledf2>
    33e8:	4701                	li	a4,0
    33ea:	00055663          	bgez	a0,33f6 <cvt+0x5a>
    {
        *sign = 1;
        arg   = -arg;
    33ee:	800007b7          	lui	a5,0x80000
    33f2:	8c3d                	xor	s0,s0,a5
    33f4:	4705                	li	a4,1
    }
    arg = modf(arg, &fi);
    33f6:	8526                	mv	a0,s1
    33f8:	85a2                	mv	a1,s0
    33fa:	1010                	add	a2,sp,32
    *sign = 0;
    33fc:	00e9a023          	sw	a4,0(s3)
    arg = modf(arg, &fi);
    3400:	6df010ef          	jal	52de <modf>
    p1  = &buf[CVTBUFSIZE];

    if (fi != 0)
    3404:	5b02                	lw	s6,32(sp)
    3406:	5b92                	lw	s7,36(sp)
    arg = modf(arg, &fi);
    3408:	84ae                	mv	s1,a1
    340a:	842a                	mv	s0,a0
    if (fi != 0)
    340c:	4601                	li	a2,0
    340e:	4681                	li	a3,0
    3410:	855a                	mv	a0,s6
    3412:	85de                	mv	a1,s7
    3414:	0e4050ef          	jal	84f8 <__eqdf2>
    3418:	1c050e63          	beqz	a0,35f4 <cvt+0x258>
    341c:	80000c37          	lui	s8,0x80000
    {
        p1 = &buf[CVTBUFSIZE];
        while (fi != 0)
        {
            fj    = modf(fi / 10, &fi);
    3420:	540c2783          	lw	a5,1344(s8) # 80000540 <__sglue+0x18>
    3424:	544c2803          	lw	a6,1348(s8)
            *--p1 = (int)((fj + .03) * 10) + '0';
    3428:	800006b7          	lui	a3,0x80000
            fj    = modf(fi / 10, &fi);
    342c:	c03e                	sw	a5,0(sp)
            *--p1 = (int)((fj + .03) * 10) + '0';
    342e:	5486a783          	lw	a5,1352(a3) # 80000548 <__sglue+0x20>
            fj    = modf(fi / 10, &fi);
    3432:	c242                	sw	a6,4(sp)
            *--p1 = (int)((fj + .03) * 10) + '0';
    3434:	54c6a803          	lw	a6,1356(a3)
    3438:	c43e                	sw	a5,8(sp)
        p1 = &buf[CVTBUFSIZE];
    343a:	05090793          	add	a5,s2,80
    343e:	cad6                	sw	s5,84(sp)
    3440:	c0ea                	sw	s10,64(sp)
            *--p1 = (int)((fj + .03) * 10) + '0';
    3442:	c642                	sw	a6,12(sp)
        p1 = &buf[CVTBUFSIZE];
    3444:	ca3e                	sw	a5,20(sp)
    3446:	8dbe                	mv	s11,a5
            r2++;
    3448:	05000c93          	li	s9,80
            fj    = modf(fi / 10, &fi);
    344c:	4602                	lw	a2,0(sp)
    344e:	4692                	lw	a3,4(sp)
    3450:	855a                	mv	a0,s6
    3452:	85de                	mv	a1,s7
    3454:	2e5040ef          	jal	7f38 <__divdf3>
    3458:	1010                	add	a2,sp,32
    345a:	685010ef          	jal	52de <modf>
            *--p1 = (int)((fj + .03) * 10) + '0';
    345e:	4622                	lw	a2,8(sp)
    3460:	46b2                	lw	a3,12(sp)
            fj    = modf(fi / 10, &fi);
    3462:	d42a                	sw	a0,40(sp)
    3464:	d62e                	sw	a1,44(sp)
            *--p1 = (int)((fj + .03) * 10) + '0';
    3466:	3b6040ef          	jal	781c <__adddf3>
    346a:	4602                	lw	a2,0(sp)
    346c:	4692                	lw	a3,4(sp)
    346e:	8c6e                	mv	s8,s11
    3470:	1dfd                	add	s11,s11,-1
    3472:	272050ef          	jal	86e4 <__muldf3>
    3476:	6d9050ef          	jal	934e <__fixdfsi>
        while (fi != 0)
    347a:	5b02                	lw	s6,32(sp)
    347c:	5b92                	lw	s7,36(sp)
            *--p1 = (int)((fj + .03) * 10) + '0';
    347e:	03050513          	add	a0,a0,48
            r2++;
    3482:	41bc89b3          	sub	s3,s9,s11
            *--p1 = (int)((fj + .03) * 10) + '0';
    3486:	00ad8023          	sb	a0,0(s11)
        while (fi != 0)
    348a:	4601                	li	a2,0
    348c:	4681                	li	a3,0
    348e:	855a                	mv	a0,s6
    3490:	85de                	mv	a1,s7
    3492:	8d6e                	mv	s10,s11
    3494:	8aca                	mv	s5,s2
            r2++;
    3496:	99ca                	add	s3,s3,s2
        while (fi != 0)
    3498:	060050ef          	jal	84f8 <__eqdf2>
    349c:	f945                	bnez	a0,344c <cvt+0xb0>
        }
        while (p1 < &buf[CVTBUFSIZE])
    349e:	47d2                	lw	a5,20(sp)
    p     = &buf[0];
    34a0:	8cca                	mv	s9,s2
        while (p1 < &buf[CVTBUFSIZE])
    34a2:	2afdfb63          	bgeu	s11,a5,3758 <cvt+0x3bc>
    34a6:	41b90cb3          	sub	s9,s2,s11
    34aa:	04fc8713          	add	a4,s9,79
    34ae:	4799                	li	a5,6
    34b0:	2ae7f263          	bgeu	a5,a4,3754 <cvt+0x3b8>
    34b4:	01b96733          	or	a4,s2,s11
    34b8:	41890c33          	sub	s8,s2,s8
    34bc:	8b0d                	and	a4,a4,3
    34be:	003c3c13          	sltiu	s8,s8,3
    34c2:	00173713          	seqz	a4,a4
    34c6:	001c3c13          	seqz	s8,s8
    34ca:	01877733          	and	a4,a4,s8
    34ce:	87ca                	mv	a5,s2
    34d0:	22071a63          	bnez	a4,3704 <cvt+0x368>
            *p++ = *p1++;
    34d4:	000dc703          	lbu	a4,0(s11)
    34d8:	0d85                	add	s11,s11,1
    34da:	0785                	add	a5,a5,1 # 80000001 <__malloc_av_+0x1>
    34dc:	fee78fa3          	sb	a4,-1(a5)
        while (p1 < &buf[CVTBUFSIZE])
    34e0:	4752                	lw	a4,20(sp)
    34e2:	ffb719e3          	bne	a4,s11,34d4 <cvt+0x138>
    34e6:	050c8c93          	add	s9,s9,80
    34ea:	4ad6                	lw	s5,84(sp)
    34ec:	4d06                	lw	s10,64(sp)
    34ee:	9cca                	add	s9,s9,s2
        {
            arg = fj;
            r2--;
        }
    }
    p1 = &buf[ndigits];
    34f0:	47e2                	lw	a5,24(sp)
    34f2:	00f90db3          	add	s11,s2,a5
    if (eflag == 0)
    34f6:	47f2                	lw	a5,28(sp)
    34f8:	e391                	bnez	a5,34fc <cvt+0x160>
        p1 += r2;
    34fa:	9dce                	add	s11,s11,s3
    *decpt = r2;
    34fc:	013a2023          	sw	s3,0(s4)
    if (p1 < &buf[0])
    3500:	172dea63          	bltu	s11,s2,3674 <cvt+0x2d8>
        p1 = &buf[CVTBUFSIZE];
    3504:	05090993          	add	s3,s2,80
    {
        buf[0] = '\0';
        return buf;
    }
    while (p <= p1 && p < &buf[CVTBUFSIZE])
    3508:	059de363          	bltu	s11,s9,354e <cvt+0x1b2>
    350c:	80000c37          	lui	s8,0x80000
    {
        arg *= 10;
    3510:	540c2b03          	lw	s6,1344(s8) # 80000540 <__sglue+0x18>
    3514:	544c2b83          	lw	s7,1348(s8)
    while (p <= p1 && p < &buf[CVTBUFSIZE])
    3518:	013ce563          	bltu	s9,s3,3522 <cvt+0x186>
    351c:	a80d                	j	354e <cvt+0x1b2>
    351e:	15998e63          	beq	s3,s9,367a <cvt+0x2de>
        arg *= 10;
    3522:	86de                	mv	a3,s7
    3524:	8522                	mv	a0,s0
    3526:	85a6                	mv	a1,s1
    3528:	865a                	mv	a2,s6
    352a:	1ba050ef          	jal	86e4 <__muldf3>
        arg  = modf(arg, &fj);
    352e:	1030                	add	a2,sp,40
    3530:	5af010ef          	jal	52de <modf>
    3534:	842a                	mv	s0,a0
    3536:	84ae                	mv	s1,a1
        *p++ = (int)fj + '0';
    3538:	5522                	lw	a0,40(sp)
    353a:	55b2                	lw	a1,44(sp)
    353c:	0c85                	add	s9,s9,1
    353e:	611050ef          	jal	934e <__fixdfsi>
    3542:	03050513          	add	a0,a0,48
    3546:	feac8fa3          	sb	a0,-1(s9)
    while (p <= p1 && p < &buf[CVTBUFSIZE])
    354a:	fd9dfae3          	bgeu	s11,s9,351e <cvt+0x182>
    }
    if (p1 >= &buf[CVTBUFSIZE])
    354e:	133df663          	bgeu	s11,s3,367a <cvt+0x2de>
    {
        buf[CVTBUFSIZE - 1] = '\0';
        return buf;
    }
    p = p1;
    *p1 += 5;
    3552:	000dc783          	lbu	a5,0(s11)
    while (*p1 > '9')
    3556:	03900713          	li	a4,57
    *p1 += 5;
    355a:	0795                	add	a5,a5,5
    355c:	0ff7f793          	zext.b	a5,a5
    3560:	00fd8023          	sb	a5,0(s11)
    while (*p1 > '9')
    3564:	06f77863          	bgeu	a4,a5,35d4 <cvt+0x238>
    3568:	47f2                	lw	a5,28(sp)
    356a:	10079b63          	bnez	a5,3680 <cvt+0x2e4>
    356e:	87ee                	mv	a5,s11
    {
        *p1 = '0';
    3570:	03000613          	li	a2,48
    while (*p1 > '9')
    3574:	03900593          	li	a1,57
        *p1 = '0';
    3578:	00c78023          	sb	a2,0(a5)
        if (p1 > buf)
    357c:	14f96a63          	bltu	s2,a5,36d0 <cvt+0x334>
            ++*--p1;
        else
        {
            *p1 = '1';
    3580:	03100713          	li	a4,49
    3584:	00e78023          	sb	a4,0(a5)
            (*decpt)++;
    3588:	000a2703          	lw	a4,0(s4)
    358c:	0705                	add	a4,a4,1
    358e:	00ea2023          	sw	a4,0(s4)
            if (eflag == 0)
            {
                if (p > buf)
    3592:	01b97463          	bgeu	s2,s11,359a <cvt+0x1fe>
                    *p = '0';
    3596:	00cd8023          	sb	a2,0(s11)
    while (*p1 > '9')
    359a:	0007c683          	lbu	a3,0(a5)
    359e:	03900713          	li	a4,57
                p++;
    35a2:	0d85                	add	s11,s11,1
    while (*p1 > '9')
    35a4:	02d77863          	bgeu	a4,a3,35d4 <cvt+0x238>
            *p1 = '1';
    35a8:	03100613          	li	a2,49
                    *p = '0';
    35ac:	03000593          	li	a1,48
    while (*p1 > '9')
    35b0:	03900693          	li	a3,57
            *p1 = '1';
    35b4:	00c78023          	sb	a2,0(a5)
            (*decpt)++;
    35b8:	000a2703          	lw	a4,0(s4)
    35bc:	0705                	add	a4,a4,1
    35be:	00ea2023          	sw	a4,0(s4)
                if (p > buf)
    35c2:	01b97463          	bgeu	s2,s11,35ca <cvt+0x22e>
                    *p = '0';
    35c6:	00bd8023          	sb	a1,0(s11)
    while (*p1 > '9')
    35ca:	0007c703          	lbu	a4,0(a5)
                p++;
    35ce:	0d85                	add	s11,s11,1
    while (*p1 > '9')
    35d0:	fee6e2e3          	bltu	a3,a4,35b4 <cvt+0x218>
            }
        }
    }
    *p = '\0';
    35d4:	000d8023          	sb	zero,0(s11)
    return buf;
}
    35d8:	50b6                	lw	ra,108(sp)
    35da:	5426                	lw	s0,104(sp)
    35dc:	5496                	lw	s1,100(sp)
    35de:	49f6                	lw	s3,92(sp)
    35e0:	4a66                	lw	s4,88(sp)
    35e2:	4b46                	lw	s6,80(sp)
    35e4:	4bb6                	lw	s7,76(sp)
    35e6:	4c26                	lw	s8,72(sp)
    35e8:	4c96                	lw	s9,68(sp)
    35ea:	5df2                	lw	s11,60(sp)
    35ec:	854a                	mv	a0,s2
    35ee:	5906                	lw	s2,96(sp)
    35f0:	6165                	add	sp,sp,112
    35f2:	8082                	ret
    else if (arg > 0)
    35f4:	8522                	mv	a0,s0
    35f6:	85a6                	mv	a1,s1
    35f8:	4601                	li	a2,0
    35fa:	4681                	li	a3,0
    35fc:	769040ef          	jal	8564 <__gedf2>
    p     = &buf[0];
    3600:	8cca                	mv	s9,s2
    r2    = 0;
    3602:	4981                	li	s3,0
    else if (arg > 0)
    3604:	eea056e3          	blez	a0,34f0 <cvt+0x154>
        while ((fj = arg * 10) < 1)
    3608:	80000c37          	lui	s8,0x80000
    360c:	540c2603          	lw	a2,1344(s8) # 80000540 <__sglue+0x18>
    3610:	544c2683          	lw	a3,1348(s8)
    3614:	8522                	mv	a0,s0
    3616:	85a6                	mv	a1,s1
    3618:	cad6                	sw	s5,84(sp)
    361a:	c0ea                	sw	s10,64(sp)
    361c:	0c8050ef          	jal	86e4 <__muldf3>
    3620:	800007b7          	lui	a5,0x80000
    3624:	5387ab03          	lw	s6,1336(a5) # 80000538 <__sglue+0x10>
    3628:	53c7ab83          	lw	s7,1340(a5)
    362c:	8d2a                	mv	s10,a0
    362e:	865a                	mv	a2,s6
    3630:	86de                	mv	a3,s7
    3632:	8aae                	mv	s5,a1
    3634:	7ef040ef          	jal	8622 <__ledf2>
    r2    = 0;
    3638:	4981                	li	s3,0
        while ((fj = arg * 10) < 1)
    363a:	544c2c83          	lw	s9,1348(s8)
    363e:	540c2c03          	lw	s8,1344(s8)
    3642:	02055363          	bgez	a0,3668 <cvt+0x2cc>
    3646:	856a                	mv	a0,s10
    3648:	85d6                	mv	a1,s5
    364a:	8662                	mv	a2,s8
    364c:	86e6                	mv	a3,s9
    364e:	096050ef          	jal	86e4 <__muldf3>
    3652:	865a                	mv	a2,s6
    3654:	86de                	mv	a3,s7
    3656:	846a                	mv	s0,s10
    3658:	84d6                	mv	s1,s5
            r2--;
    365a:	19fd                	add	s3,s3,-1
        while ((fj = arg * 10) < 1)
    365c:	8d2a                	mv	s10,a0
    365e:	8aae                	mv	s5,a1
    3660:	7c3040ef          	jal	8622 <__ledf2>
    3664:	fe0541e3          	bltz	a0,3646 <cvt+0x2aa>
    3668:	d46a                	sw	s10,40(sp)
    366a:	d656                	sw	s5,44(sp)
    366c:	4d06                	lw	s10,64(sp)
    366e:	4ad6                	lw	s5,84(sp)
    p     = &buf[0];
    3670:	8cca                	mv	s9,s2
    3672:	bdbd                	j	34f0 <cvt+0x154>
        buf[0] = '\0';
    3674:	00090023          	sb	zero,0(s2)
        return buf;
    3678:	b785                	j	35d8 <cvt+0x23c>
        buf[CVTBUFSIZE - 1] = '\0';
    367a:	040907a3          	sb	zero,79(s2)
        return buf;
    367e:	bfa9                	j	35d8 <cvt+0x23c>
    while (*p1 > '9')
    3680:	87ee                	mv	a5,s11
        *p1 = '0';
    3682:	03000593          	li	a1,48
    while (*p1 > '9')
    3686:	03900613          	li	a2,57
        *p1 = '0';
    368a:	00b78023          	sb	a1,0(a5)
        if (p1 > buf)
    368e:	04f96e63          	bltu	s2,a5,36ea <cvt+0x34e>
            *p1 = '1';
    3692:	03100713          	li	a4,49
    3696:	00e78023          	sb	a4,0(a5)
            (*decpt)++;
    369a:	000a2703          	lw	a4,0(s4)
    while (*p1 > '9')
    369e:	03900593          	li	a1,57
            *p1 = '1';
    36a2:	03100613          	li	a2,49
            (*decpt)++;
    36a6:	0705                	add	a4,a4,1
    36a8:	00ea2023          	sw	a4,0(s4)
    while (*p1 > '9')
    36ac:	0007c703          	lbu	a4,0(a5)
    36b0:	03900693          	li	a3,57
    36b4:	f2e5f0e3          	bgeu	a1,a4,35d4 <cvt+0x238>
            *p1 = '1';
    36b8:	00c78023          	sb	a2,0(a5)
            (*decpt)++;
    36bc:	000a2703          	lw	a4,0(s4)
    36c0:	0705                	add	a4,a4,1
    36c2:	00ea2023          	sw	a4,0(s4)
    while (*p1 > '9')
    36c6:	0007c703          	lbu	a4,0(a5)
    36ca:	fee6e7e3          	bltu	a3,a4,36b8 <cvt+0x31c>
    36ce:	b719                	j	35d4 <cvt+0x238>
            ++*--p1;
    36d0:	fff7c703          	lbu	a4,-1(a5)
    36d4:	fff78693          	add	a3,a5,-1
    36d8:	0705                	add	a4,a4,1
    36da:	0ff77713          	zext.b	a4,a4
    36de:	fee78fa3          	sb	a4,-1(a5)
    while (*p1 > '9')
    36e2:	eee5f9e3          	bgeu	a1,a4,35d4 <cvt+0x238>
    36e6:	87b6                	mv	a5,a3
    36e8:	bd41                	j	3578 <cvt+0x1dc>
            ++*--p1;
    36ea:	fff7c703          	lbu	a4,-1(a5)
    36ee:	fff78693          	add	a3,a5,-1
    36f2:	0705                	add	a4,a4,1
    36f4:	0ff77713          	zext.b	a4,a4
    36f8:	fee78fa3          	sb	a4,-1(a5)
    while (*p1 > '9')
    36fc:	ece67ce3          	bgeu	a2,a4,35d4 <cvt+0x238>
    3700:	87b6                	mv	a5,a3
    3702:	b761                	j	368a <cvt+0x2ee>
    3704:	050c8c93          	add	s9,s9,80
    3708:	ffccf693          	and	a3,s9,-4
    370c:	01b68733          	add	a4,a3,s11
            *p++ = *p1++;
    3710:	000d2783          	lw	a5,0(s10)
    3714:	0d11                	add	s10,s10,4
    3716:	0a91                	add	s5,s5,4
    3718:	fefaae23          	sw	a5,-4(s5)
        while (p1 < &buf[CVTBUFSIZE])
    371c:	ffa71ae3          	bne	a4,s10,3710 <cvt+0x374>
    3720:	00d907b3          	add	a5,s2,a3
    3724:	dd9683e3          	beq	a3,s9,34ea <cvt+0x14e>
            *p++ = *p1++;
    3728:	00074603          	lbu	a2,0(a4)
        while (p1 < &buf[CVTBUFSIZE])
    372c:	45d2                	lw	a1,20(sp)
            *p++ = *p1++;
    372e:	00170693          	add	a3,a4,1
    3732:	00c78023          	sb	a2,0(a5)
        while (p1 < &buf[CVTBUFSIZE])
    3736:	dab6fae3          	bgeu	a3,a1,34ea <cvt+0x14e>
            *p++ = *p1++;
    373a:	00174603          	lbu	a2,1(a4)
    373e:	00270693          	add	a3,a4,2
    3742:	00c780a3          	sb	a2,1(a5)
        while (p1 < &buf[CVTBUFSIZE])
    3746:	dab6f2e3          	bgeu	a3,a1,34ea <cvt+0x14e>
            *p++ = *p1++;
    374a:	00274703          	lbu	a4,2(a4)
    374e:	00e78123          	sb	a4,2(a5)
        while (p1 < &buf[CVTBUFSIZE])
    3752:	bb61                	j	34ea <cvt+0x14e>
    3754:	87ca                	mv	a5,s2
    3756:	bbbd                	j	34d4 <cvt+0x138>
    3758:	4ad6                	lw	s5,84(sp)
    375a:	4d06                	lw	s10,64(sp)
    375c:	bb51                	j	34f0 <cvt+0x154>

0000375e <fcvtbuf>:
}

char *
fcvtbuf(double arg, int ndigits, int *decpt, int *sign, char *buf)
{
    return cvt(arg, ndigits, decpt, sign, buf, 0);
    375e:	4801                	li	a6,0
    3760:	b935                	j	339c <cvt>

00003762 <number>:
    return i;
}

static char *
number(char *str, long num, int base, int size, int precision, int type)
{
    3762:	7119                	add	sp,sp,-128
    3764:	daa6                	sw	s1,116(sp)
    3766:	d4d2                	sw	s4,104(sp)
    3768:	84b2                	mv	s1,a2
    376a:	de86                	sw	ra,124(sp)
    char  c, sign, tmp[66];
    char *dig = digits;
    376c:	6629                	lui	a2,0xa
{
    376e:	dca2                	sw	s0,120(sp)
    3770:	d8ca                	sw	s2,112(sp)
    3772:	d6ce                	sw	s3,108(sp)
    3774:	d2d6                	sw	s5,100(sp)
    3776:	d0da                	sw	s6,96(sp)
    3778:	cede                	sw	s7,92(sp)
    377a:	cce2                	sw	s8,88(sp)
    377c:	cae6                	sw	s9,84(sp)
    int   i;

    if (type & UPPERCASE)
    377e:	0407f893          	and	a7,a5,64
{
    3782:	882a                	mv	a6,a0
    3784:	8a2e                	mv	s4,a1
    char *dig = digits;
    3786:	df060313          	add	t1,a2,-528 # 9df0 <__fini_array_end+0x77c>
    if (type & UPPERCASE)
    378a:	00088563          	beqz	a7,3794 <number+0x32>
    378e:	6629                	lui	a2,0xa
    3790:	e1860313          	add	t1,a2,-488 # 9e18 <__fini_array_end+0x7a4>
        dig = upper_digits;
    if (type & LEFT)
    3794:	0107fb93          	and	s7,a5,16
    3798:	100b8b63          	beqz	s7,38ae <number+0x14c>
        type &= ~ZEROPAD;
    379c:	9bf9                	and	a5,a5,-2
    379e:	4e41                	li	t3,16
    if (base < 2 || base > 36)
        return 0;

    c    = (type & ZEROPAD) ? '0' : ' ';
    37a0:	02000c93          	li	s9,32
    sign = 0;
    if (type & SIGN)
    37a4:	0027f613          	and	a2,a5,2
            sign = ' ';
            size--;
        }
    }

    if (type & HEX_PREP)
    37a8:	0207fc13          	and	s8,a5,32
    if (type & SIGN)
    37ac:	10060d63          	beqz	a2,38c6 <number+0x164>
        if (num < 0)
    37b0:	100a4d63          	bltz	s4,38ca <number+0x168>
        else if (type & PLUS)
    37b4:	0047f613          	and	a2,a5,4
    37b8:	14061563          	bnez	a2,3902 <number+0x1a0>
        else if (type & SPACE)
    37bc:	8ba1                	and	a5,a5,8
    sign = 0;
    37be:	4b01                	li	s6,0
        else if (type & SPACE)
    37c0:	c781                	beqz	a5,37c8 <number+0x66>
            size--;
    37c2:	16fd                	add	a3,a3,-1
            sign = ' ';
    37c4:	02000b13          	li	s6,32
    if (type & HEX_PREP)
    37c8:	000c0c63          	beqz	s8,37e0 <number+0x7e>
    {
        if (base == 16)
    37cc:	47c1                	li	a5,16
    37ce:	14f48863          	beq	s1,a5,391e <number+0x1bc>
            size -= 2;
        else if (base == 8)
            size--;
    37d2:	ff848793          	add	a5,s1,-8
    37d6:	0017b793          	seqz	a5,a5
    37da:	02000c13          	li	s8,32
    37de:	8e9d                	sub	a3,a3,a5
    }

    i = 0;

    if (num == 0)
    37e0:	0e0a1c63          	bnez	s4,38d8 <number+0x176>
        tmp[i++] = '0';
    37e4:	03000793          	li	a5,48
    37e8:	00f10623          	sb	a5,12(sp)
    37ec:	4405                	li	s0,1
    37ee:	00c10913          	add	s2,sp,12
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
            num      = ((unsigned long)num) / (unsigned)base;
        }
    }

    if (i > precision)
    37f2:	8aa2                	mv	s5,s0
    37f4:	00e45363          	bge	s0,a4,37fa <number+0x98>
    37f8:	8aba                	mv	s5,a4
        precision = i;
    size -= precision;
    37fa:	415689b3          	sub	s3,a3,s5
    if (!(type & (ZEROPAD | LEFT)))
    37fe:	000e1d63          	bnez	t3,3818 <number+0xb6>
        while (size-- > 0)
    3802:	13305863          	blez	s3,3932 <number+0x1d0>
            *str++ = ' ';
    3806:	864e                	mv	a2,s3
    3808:	8542                	mv	a0,a6
    380a:	02000593          	li	a1,32
    380e:	3ec020ef          	jal	5bfa <memset>
    3812:	01350833          	add	a6,a0,s3
        while (size-- > 0)
    3816:	59fd                	li	s3,-1
    if (sign)
    3818:	000b0563          	beqz	s6,3822 <number+0xc0>
        *str++ = sign;
    381c:	01680023          	sb	s6,0(a6)
    3820:	0805                	add	a6,a6,1

    if (type & HEX_PREP)
    3822:	000c0863          	beqz	s8,3832 <number+0xd0>
    {
        if (base == 8)
    3826:	47a1                	li	a5,8
    3828:	0ef48f63          	beq	s1,a5,3926 <number+0x1c4>
            *str++ = '0';
        else if (base == 16)
    382c:	47c1                	li	a5,16
    382e:	0cf48e63          	beq	s1,a5,390a <number+0x1a8>
            *str++ = '0';
            *str++ = digits[33];
        }
    }

    if (!(type & LEFT))
    3832:	000b9c63          	bnez	s7,384a <number+0xe8>
        while (size-- > 0)
    3836:	11305063          	blez	s3,3936 <number+0x1d4>
            *str++ = c;
    383a:	864e                	mv	a2,s3
    383c:	8542                	mv	a0,a6
    383e:	85e6                	mv	a1,s9
    3840:	3ba020ef          	jal	5bfa <memset>
    3844:	01350833          	add	a6,a0,s3
        while (size-- > 0)
    3848:	59fd                	li	s3,-1
    while (i < precision--)
    384a:	01545c63          	bge	s0,s5,3862 <number+0x100>
        *str++ = '0';
    384e:	408a8ab3          	sub	s5,s5,s0
    3852:	8542                	mv	a0,a6
    3854:	8656                	mv	a2,s5
    3856:	03000593          	li	a1,48
    385a:	3a0020ef          	jal	5bfa <memset>
    385e:	01550833          	add	a6,a0,s5
    while (i-- > 0)
    3862:	014907b3          	add	a5,s2,s4
        while (size-- > 0)
    3866:	8742                	mv	a4,a6
        *str++ = tmp[i];
    3868:	0007c883          	lbu	a7,0(a5)
    386c:	863e                	mv	a2,a5
    386e:	0705                	add	a4,a4,1
    3870:	ff170fa3          	sb	a7,-1(a4)
    while (i-- > 0)
    3874:	17fd                	add	a5,a5,-1
    3876:	fec919e3          	bne	s2,a2,3868 <number+0x106>
    387a:	0a05                	add	s4,s4,1
    387c:	9852                	add	a6,a6,s4
    while (size-- > 0)
    387e:	01305a63          	blez	s3,3892 <number+0x130>
        *str++ = ' ';
    3882:	8542                	mv	a0,a6
    3884:	864e                	mv	a2,s3
    3886:	02000593          	li	a1,32
    388a:	370020ef          	jal	5bfa <memset>
    388e:	01350833          	add	a6,a0,s3

    return str;
}
    3892:	50f6                	lw	ra,124(sp)
    3894:	5466                	lw	s0,120(sp)
    3896:	54d6                	lw	s1,116(sp)
    3898:	5946                	lw	s2,112(sp)
    389a:	59b6                	lw	s3,108(sp)
    389c:	5a26                	lw	s4,104(sp)
    389e:	5a96                	lw	s5,100(sp)
    38a0:	5b06                	lw	s6,96(sp)
    38a2:	4bf6                	lw	s7,92(sp)
    38a4:	4c66                	lw	s8,88(sp)
    38a6:	4cd6                	lw	s9,84(sp)
    38a8:	8542                	mv	a0,a6
    38aa:	6109                	add	sp,sp,128
    38ac:	8082                	ret
    c    = (type & ZEROPAD) ? '0' : ' ';
    38ae:	0017f613          	and	a2,a5,1
    if (!(type & (ZEROPAD | LEFT)))
    38b2:	0117fe13          	and	t3,a5,17
    c    = (type & ZEROPAD) ? '0' : ' ';
    38b6:	03000c93          	li	s9,48
    38ba:	ee0615e3          	bnez	a2,37a4 <number+0x42>
    38be:	4e01                	li	t3,0
    38c0:	02000c93          	li	s9,32
    38c4:	b5c5                	j	37a4 <number+0x42>
    sign = 0;
    38c6:	4b01                	li	s6,0
    38c8:	b701                	j	37c8 <number+0x66>
            num  = -num;
    38ca:	41400a33          	neg	s4,s4
            size--;
    38ce:	16fd                	add	a3,a3,-1
            sign = '-';
    38d0:	02d00b13          	li	s6,45
    if (type & HEX_PREP)
    38d4:	ee0c1ce3          	bnez	s8,37cc <number+0x6a>
    if (base < 2 || base > 36)
    38d8:	87d2                	mv	a5,s4
    i = 0;
    38da:	4401                	li	s0,0
    38dc:	00c10913          	add	s2,sp,12
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
    38e0:	0297f8b3          	remu	a7,a5,s1
    38e4:	8a22                	mv	s4,s0
    38e6:	0405                	add	s0,s0,1
    38e8:	008905b3          	add	a1,s2,s0
    38ec:	863e                	mv	a2,a5
    38ee:	989a                	add	a7,a7,t1
    38f0:	0008c503          	lbu	a0,0(a7)
            num      = ((unsigned long)num) / (unsigned)base;
    38f4:	0297d7b3          	divu	a5,a5,s1
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
    38f8:	fea58fa3          	sb	a0,-1(a1)
        while (num != 0)
    38fc:	fe9672e3          	bgeu	a2,s1,38e0 <number+0x17e>
    3900:	bdcd                	j	37f2 <number+0x90>
            size--;
    3902:	16fd                	add	a3,a3,-1
            sign = '+';
    3904:	02b00b13          	li	s6,43
    3908:	b5c1                	j	37c8 <number+0x66>
            *str++ = '0';
    390a:	03000793          	li	a5,48
    390e:	00f80023          	sb	a5,0(a6)
            *str++ = digits[33];
    3912:	07800793          	li	a5,120
    3916:	00f800a3          	sb	a5,1(a6)
    391a:	0809                	add	a6,a6,2
    391c:	bf19                	j	3832 <number+0xd0>
            size -= 2;
    391e:	16f9                	add	a3,a3,-2
    3920:	02000c13          	li	s8,32
    3924:	bd75                	j	37e0 <number+0x7e>
            *str++ = '0';
    3926:	03000793          	li	a5,48
    392a:	00f80023          	sb	a5,0(a6)
    392e:	0805                	add	a6,a6,1
    3930:	b709                	j	3832 <number+0xd0>
        while (size-- > 0)
    3932:	19fd                	add	s3,s3,-1
    3934:	b5d5                	j	3818 <number+0xb6>
        while (size-- > 0)
    3936:	19fd                	add	s3,s3,-1
    3938:	bf09                	j	384a <number+0xe8>

0000393a <printf>:
  neorv32_uart0_putc(c);
}

int
ee_printf(const char *fmt, ...)
{
    393a:	dd010113          	add	sp,sp,-560
    393e:	21212023          	sw	s2,512(sp)
    3942:	1f612823          	sw	s6,496(sp)
    3946:	1f812423          	sw	s8,488(sp)
    394a:	20112623          	sw	ra,524(sp)
    394e:	20812423          	sw	s0,520(sp)
    3952:	20912223          	sw	s1,516(sp)
    3956:	20b12a23          	sw	a1,532(sp)
    395a:	20c12c23          	sw	a2,536(sp)
    395e:	20d12e23          	sw	a3,540(sp)
    3962:	22e12023          	sw	a4,544(sp)
    3966:	22f12223          	sw	a5,548(sp)
    396a:	23012423          	sw	a6,552(sp)
    396e:	23112623          	sw	a7,556(sp)
    for (str = buf; *fmt; fmt++)
    3972:	00054783          	lbu	a5,0(a0)
    char    buf[256], *p;
    va_list args;
    int     n = 0;

    va_start(args, fmt);
    3976:	21410c13          	add	s8,sp,532
    for (str = buf; *fmt; fmt++)
    397a:	0d010913          	add	s2,sp,208
    va_start(args, fmt);
    397e:	d262                	sw	s8,36(sp)
    for (str = buf; *fmt; fmt++)
    3980:	8b4a                	mv	s6,s2
    3982:	cbb1                	beqz	a5,39d6 <printf+0x9c>
    3984:	1f912223          	sw	s9,484(sp)
        switch (*fmt)
    3988:	6ca9                	lui	s9,0xa
    398a:	1f512a23          	sw	s5,500(sp)
    398e:	1f712623          	sw	s7,492(sp)
    3992:	1db12e23          	sw	s11,476(sp)
    3996:	1f312e23          	sw	s3,508(sp)
    399a:	1f412c23          	sw	s4,504(sp)
    399e:	842a                	mv	s0,a0
        if (*fmt != '%')
    39a0:	02500d93          	li	s11,37
        switch (*fmt)
    39a4:	4bc1                	li	s7,16
    39a6:	0c4c8c93          	add	s9,s9,196 # a0c4 <intpat+0x28>
        if (is_digit(*fmt))
    39aa:	4aa5                	li	s5,9
        if (*fmt != '%')
    39ac:	09b78c63          	beq	a5,s11,3a44 <printf+0x10a>
            *str++ = *fmt;
    39b0:	00fb0023          	sb	a5,0(s6)
    for (str = buf; *fmt; fmt++)
    39b4:	00144783          	lbu	a5,1(s0)
            *str++ = *fmt;
    39b8:	0b05                	add	s6,s6,1
            continue;
    39ba:	0405                	add	s0,s0,1
    for (str = buf; *fmt; fmt++)
    39bc:	fbe5                	bnez	a5,39ac <printf+0x72>
    39be:	1fc12983          	lw	s3,508(sp)
    39c2:	1f812a03          	lw	s4,504(sp)
    39c6:	1f412a83          	lw	s5,500(sp)
    39ca:	1ec12b83          	lw	s7,492(sp)
    39ce:	1e412c83          	lw	s9,484(sp)
    39d2:	1dc12d83          	lw	s11,476(sp)
    *str = '\0';
    39d6:	000b0023          	sb	zero,0(s6)
    ee_vsprintf(buf, fmt, args);
    va_end(args);
    p = buf;
    while (*p)
    39da:	0d014583          	lbu	a1,208(sp)
    int     n = 0;
    39de:	4501                	li	a0,0
    while (*p)
    39e0:	c1b9                	beqz	a1,3a26 <printf+0xec>
  if (c == '\n') {
    39e2:	44a9                	li	s1,10
    p = buf;
    39e4:	844a                	mv	s0,s2
  if (c == '\n') {
    39e6:	00958e63          	beq	a1,s1,3a02 <printf+0xc8>
  neorv32_uart0_putc(c);
    39ea:	fff50537          	lui	a0,0xfff50
    39ee:	5fe010ef          	jal	4fec <neorv32_uart_putc>
    while (*p)
    39f2:	00144583          	lbu	a1,1(s0)
    {
        uart_send_char(*p);
        n++;
        p++;
    39f6:	00140793          	add	a5,s0,1
    while (*p)
    39fa:	c19d                	beqz	a1,3a20 <printf+0xe6>
    39fc:	843e                	mv	s0,a5
  if (c == '\n') {
    39fe:	fe9596e3          	bne	a1,s1,39ea <printf+0xb0>
    neorv32_uart0_putc('\r');
    3a02:	45b5                	li	a1,13
    3a04:	fff50537          	lui	a0,0xfff50
    3a08:	5e4010ef          	jal	4fec <neorv32_uart_putc>
  neorv32_uart0_putc(c);
    3a0c:	45a9                	li	a1,10
    3a0e:	fff50537          	lui	a0,0xfff50
    3a12:	5da010ef          	jal	4fec <neorv32_uart_putc>
    while (*p)
    3a16:	00144583          	lbu	a1,1(s0)
        p++;
    3a1a:	00140793          	add	a5,s0,1
    while (*p)
    3a1e:	fdf9                	bnez	a1,39fc <printf+0xc2>
        n++;
    3a20:	41240533          	sub	a0,s0,s2
    3a24:	0505                	add	a0,a0,1 # fff50001 <__crt0_ram_last+0x7ff4c002>
    }

    return n;
}
    3a26:	20c12083          	lw	ra,524(sp)
    3a2a:	20812403          	lw	s0,520(sp)
    3a2e:	20412483          	lw	s1,516(sp)
    3a32:	20012903          	lw	s2,512(sp)
    3a36:	1f012b03          	lw	s6,496(sp)
    3a3a:	1e812c03          	lw	s8,488(sp)
    3a3e:	23010113          	add	sp,sp,560
    3a42:	8082                	ret
        flags = 0;
    3a44:	4781                	li	a5,0
        switch (*fmt)
    3a46:	00144603          	lbu	a2,1(s0)
        fmt++; // This also skips first '%'
    3a4a:	00140493          	add	s1,s0,1
        switch (*fmt)
    3a4e:	fe060713          	add	a4,a2,-32
    3a52:	0ff77713          	zext.b	a4,a4
    3a56:	00ebe663          	bltu	s7,a4,3a62 <printf+0x128>
    3a5a:	070a                	sll	a4,a4,0x2
    3a5c:	9766                	add	a4,a4,s9
    3a5e:	4318                	lw	a4,0(a4)
    3a60:	8702                	jr	a4
        if (is_digit(*fmt))
    3a62:	fd060713          	add	a4,a2,-48
    3a66:	0ff77713          	zext.b	a4,a4
    3a6a:	0eeaf163          	bgeu	s5,a4,3b4c <printf+0x212>
        else if (*fmt == '*')
    3a6e:	02a00713          	li	a4,42
        field_width = -1;
    3a72:	59fd                	li	s3,-1
        else if (*fmt == '*')
    3a74:	0ee60f63          	beq	a2,a4,3b72 <printf+0x238>
        if (*fmt == '.')
    3a78:	02e00713          	li	a4,46
        precision = -1;
    3a7c:	547d                	li	s0,-1
        if (*fmt == '.')
    3a7e:	0ae60563          	beq	a2,a4,3b28 <printf+0x1ee>
        if (*fmt == 'l' || *fmt == 'L')
    3a82:	0df67713          	and	a4,a2,223
    3a86:	04c00693          	li	a3,76
    3a8a:	06d70b63          	beq	a4,a3,3b00 <printf+0x1c6>
        switch (*fmt)
    3a8e:	fbf60713          	add	a4,a2,-65
    3a92:	0ff77713          	zext.b	a4,a4
    3a96:	03700693          	li	a3,55
    3a9a:	02e6ed63          	bltu	a3,a4,3ad4 <printf+0x19a>
    3a9e:	66a9                	lui	a3,0xa
    3aa0:	070a                	sll	a4,a4,0x2
    3aa2:	10868693          	add	a3,a3,264 # a108 <intpat+0x6c>
    3aa6:	9736                	add	a4,a4,a3
    3aa8:	4318                	lw	a4,0(a4)
    3aaa:	8702                	jr	a4
                flags |= ZEROPAD;
    3aac:	0017e793          	or	a5,a5,1
    for (str = buf; *fmt; fmt++)
    3ab0:	8426                	mv	s0,s1
    3ab2:	bf51                	j	3a46 <printf+0x10c>
                flags |= LEFT;
    3ab4:	0107e793          	or	a5,a5,16
    for (str = buf; *fmt; fmt++)
    3ab8:	8426                	mv	s0,s1
    3aba:	b771                	j	3a46 <printf+0x10c>
                flags |= PLUS;
    3abc:	0047e793          	or	a5,a5,4
    for (str = buf; *fmt; fmt++)
    3ac0:	8426                	mv	s0,s1
    3ac2:	b751                	j	3a46 <printf+0x10c>
                flags |= HEX_PREP;
    3ac4:	0207e793          	or	a5,a5,32
    for (str = buf; *fmt; fmt++)
    3ac8:	8426                	mv	s0,s1
    3aca:	bfb5                	j	3a46 <printf+0x10c>
                flags |= SPACE;
    3acc:	0087e793          	or	a5,a5,8
    for (str = buf; *fmt; fmt++)
    3ad0:	8426                	mv	s0,s1
    3ad2:	bf95                	j	3a46 <printf+0x10c>
        switch (*fmt)
    3ad4:	8a26                	mv	s4,s1
                if (*fmt != '%')
    3ad6:	02500793          	li	a5,37
    3ada:	00f60963          	beq	a2,a5,3aec <printf+0x1b2>
                    *str++ = '%';
    3ade:	00fb0023          	sb	a5,0(s6)
                if (*fmt)
    3ae2:	000a4603          	lbu	a2,0(s4)
            *str++ = *fmt;
    3ae6:	0b05                	add	s6,s6,1
                if (*fmt)
    3ae8:	ec060be3          	beqz	a2,39be <printf+0x84>
                    *str++ = *fmt;
    3aec:	00cb0023          	sb	a2,0(s6)
    for (str = buf; *fmt; fmt++)
    3af0:	001a4783          	lbu	a5,1(s4)
    3af4:	001a0413          	add	s0,s4,1
                    *str++ = *fmt;
    3af8:	0b05                	add	s6,s6,1
    for (str = buf; *fmt; fmt++)
    3afa:	ea0799e3          	bnez	a5,39ac <printf+0x72>
    3afe:	b5c1                	j	39be <printf+0x84>
            qualifier = *fmt;
    3b00:	85b2                	mv	a1,a2
        switch (*fmt)
    3b02:	0014c603          	lbu	a2,1(s1)
    3b06:	03700693          	li	a3,55
            fmt++;
    3b0a:	00148a13          	add	s4,s1,1
        switch (*fmt)
    3b0e:	fbf60713          	add	a4,a2,-65
    3b12:	0ff77713          	zext.b	a4,a4
    3b16:	fce6e0e3          	bltu	a3,a4,3ad6 <printf+0x19c>
    3b1a:	66a9                	lui	a3,0xa
    3b1c:	070a                	sll	a4,a4,0x2
    3b1e:	1e868693          	add	a3,a3,488 # a1e8 <intpat+0x14c>
    3b22:	9736                	add	a4,a4,a3
    3b24:	4318                	lw	a4,0(a4)
    3b26:	8702                	jr	a4
            if (is_digit(*fmt))
    3b28:	0014c603          	lbu	a2,1(s1)
    3b2c:	45a5                	li	a1,9
            ++fmt;
    3b2e:	00148693          	add	a3,s1,1
            if (is_digit(*fmt))
    3b32:	fd060713          	add	a4,a2,-48
    3b36:	0ff77713          	zext.b	a4,a4
    3b3a:	06e5fb63          	bgeu	a1,a4,3bb0 <printf+0x276>
            else if (*fmt == '*')
    3b3e:	02a00713          	li	a4,42
    3b42:	08e60f63          	beq	a2,a4,3be0 <printf+0x2a6>
            ++fmt;
    3b46:	84b6                	mv	s1,a3
                precision = 0;
    3b48:	4401                	li	s0,0
    3b4a:	bf25                	j	3a82 <printf+0x148>
    int i = 0;
    3b4c:	4981                	li	s3,0
    while (is_digit(**s))
    3b4e:	45a5                	li	a1,9
        i = i * 10 + *((*s)++) - '0';
    3b50:	00299693          	sll	a3,s3,0x2
    3b54:	96ce                	add	a3,a3,s3
    3b56:	0485                	add	s1,s1,1
    3b58:	0686                	sll	a3,a3,0x1
    3b5a:	96b2                	add	a3,a3,a2
    while (is_digit(**s))
    3b5c:	0004c603          	lbu	a2,0(s1)
        i = i * 10 + *((*s)++) - '0';
    3b60:	fd068993          	add	s3,a3,-48
    while (is_digit(**s))
    3b64:	fd060713          	add	a4,a2,-48
    3b68:	0ff77713          	zext.b	a4,a4
    3b6c:	fee5f2e3          	bgeu	a1,a4,3b50 <printf+0x216>
    3b70:	b721                	j	3a78 <printf+0x13e>
            field_width = va_arg(args, int);
    3b72:	000c2983          	lw	s3,0(s8)
        if (*fmt == '.')
    3b76:	00244603          	lbu	a2,2(s0)
            fmt++;
    3b7a:	00240493          	add	s1,s0,2
            field_width = va_arg(args, int);
    3b7e:	0c11                	add	s8,s8,4
            if (field_width < 0)
    3b80:	ee09dce3          	bgez	s3,3a78 <printf+0x13e>
                field_width = -field_width;
    3b84:	413009b3          	neg	s3,s3
                flags |= LEFT;
    3b88:	0107e793          	or	a5,a5,16
    3b8c:	b5f5                	j	3a78 <printf+0x13e>
        switch (*fmt)
    3b8e:	8a26                	mv	s4,s1
        base = 10;
    3b90:	4629                	li	a2,10
        str = number(str, num, base, field_width, precision, flags);
    3b92:	000c2583          	lw	a1,0(s8)
            num = va_arg(args, unsigned int);
    3b96:	0c11                	add	s8,s8,4
        str = number(str, num, base, field_width, precision, flags);
    3b98:	8722                	mv	a4,s0
    3b9a:	855a                	mv	a0,s6
    3b9c:	86ce                	mv	a3,s3
    3b9e:	36d1                	jal	3762 <number>
    for (str = buf; *fmt; fmt++)
    3ba0:	001a4783          	lbu	a5,1(s4)
        str = number(str, num, base, field_width, precision, flags);
    3ba4:	8b2a                	mv	s6,a0
    for (str = buf; *fmt; fmt++)
    3ba6:	001a0413          	add	s0,s4,1
    3baa:	e00791e3          	bnez	a5,39ac <printf+0x72>
    3bae:	bd01                	j	39be <printf+0x84>
    int i = 0;
    3bb0:	4e01                	li	t3,0
        i = i * 10 + *((*s)++) - '0';
    3bb2:	002e1713          	sll	a4,t3,0x2
    3bb6:	9772                	add	a4,a4,t3
    3bb8:	0685                	add	a3,a3,1
    3bba:	0706                	sll	a4,a4,0x1
    3bbc:	9732                	add	a4,a4,a2
    while (is_digit(**s))
    3bbe:	0006c603          	lbu	a2,0(a3)
        i = i * 10 + *((*s)++) - '0';
    3bc2:	fd070e13          	add	t3,a4,-48
    while (is_digit(**s))
    3bc6:	fd060713          	add	a4,a2,-48
    3bca:	0ff77713          	zext.b	a4,a4
    3bce:	fee5f2e3          	bgeu	a1,a4,3bb2 <printf+0x278>
            if (precision < 0)
    3bd2:	fffe4713          	not	a4,t3
    3bd6:	877d                	sra	a4,a4,0x1f
    3bd8:	00ee7433          	and	s0,t3,a4
    3bdc:	84b6                	mv	s1,a3
    3bde:	b555                	j	3a82 <printf+0x148>
    3be0:	000c2403          	lw	s0,0(s8)
        if (*fmt == 'l' || *fmt == 'L')
    3be4:	0024c603          	lbu	a2,2(s1)
                precision = va_arg(args, int);
    3be8:	0c11                	add	s8,s8,4
            if (precision < 0)
    3bea:	fff44713          	not	a4,s0
    3bee:	877d                	sra	a4,a4,0x1f
    3bf0:	8c79                	and	s0,s0,a4
                ++fmt;
    3bf2:	0489                	add	s1,s1,2
            if (precision < 0)
    3bf4:	b579                	j	3a82 <printf+0x148>
        if (qualifier == 'l')
    3bf6:	06c00713          	li	a4,108
                flags |= SIGN;
    3bfa:	0027e793          	or	a5,a5,2
        if (qualifier == 'l')
    3bfe:	f8e589e3          	beq	a1,a4,3b90 <printf+0x256>
                    str = eaddr(str,
    3c02:	004c0713          	add	a4,s8,4
            num = va_arg(args, int);
    3c06:	000c2583          	lw	a1,0(s8)
    3c0a:	4629                	li	a2,10
    3c0c:	8c3a                	mv	s8,a4
    3c0e:	b769                	j	3b98 <printf+0x25e>
        switch (*fmt)
    3c10:	8a26                	mv	s4,s1
                base = 16;
    3c12:	4641                	li	a2,16
    3c14:	bfbd                	j	3b92 <printf+0x258>
        switch (*fmt)
    3c16:	8a26                	mv	s4,s1
                if (!(flags & LEFT))
    3c18:	8bc1                	and	a5,a5,16
                    str = eaddr(str,
    3c1a:	004c0493          	add	s1,s8,4
    for (str = buf; *fmt; fmt++)
    3c1e:	001a0413          	add	s0,s4,1
                if (!(flags & LEFT))
    3c22:	4e078e63          	beqz	a5,411e <__neorv32_ram_size+0x11e>
                *str++ = (unsigned char)va_arg(args, int);
    3c26:	000c2703          	lw	a4,0(s8)
                while (--field_width > 0)
    3c2a:	4785                	li	a5,1
                *str++ = (unsigned char)va_arg(args, int);
    3c2c:	001b0513          	add	a0,s6,1
    3c30:	00eb0023          	sb	a4,0(s6)
                while (--field_width > 0)
    3c34:	0b37d8e3          	bge	a5,s3,44e4 <__neorv32_ram_size+0x4e4>
                    *str++ = ' ';
    3c38:	fff98613          	add	a2,s3,-1
    3c3c:	02000593          	li	a1,32
    3c40:	7bb010ef          	jal	5bfa <memset>
    for (str = buf; *fmt; fmt++)
    3c44:	001a4783          	lbu	a5,1(s4)
    3c48:	9b4e                	add	s6,s6,s3
                *str++ = (unsigned char)va_arg(args, int);
    3c4a:	8c26                	mv	s8,s1
    for (str = buf; *fmt; fmt++)
    3c4c:	d60790e3          	bnez	a5,39ac <printf+0x72>
    3c50:	b3bd                	j	39be <printf+0x84>
        switch (*fmt)
    3c52:	8a26                	mv	s4,s1
                base = 8;
    3c54:	4621                	li	a2,8
    3c56:	bf35                	j	3b92 <printf+0x258>
        switch (*fmt)
    3c58:	8a26                	mv	s4,s1
                if (field_width == -1)
    3c5a:	577d                	li	a4,-1
    3c5c:	00e99563          	bne	s3,a4,3c66 <printf+0x32c>
                    flags |= ZEROPAD;
    3c60:	0017e793          	or	a5,a5,1
                    field_width = 2 * sizeof(void *);
    3c64:	49a1                	li	s3,8
                str = number(str,
    3c66:	000c2583          	lw	a1,0(s8)
    3c6a:	8722                	mv	a4,s0
    3c6c:	855a                	mv	a0,s6
    3c6e:	86ce                	mv	a3,s3
    3c70:	4641                	li	a2,16
    3c72:	af1ff0ef          	jal	3762 <number>
    for (str = buf; *fmt; fmt++)
    3c76:	001a4783          	lbu	a5,1(s4)
                             (unsigned long)va_arg(args, void *),
    3c7a:	0c11                	add	s8,s8,4
                str = number(str,
    3c7c:	8b2a                	mv	s6,a0
    for (str = buf; *fmt; fmt++)
    3c7e:	001a0413          	add	s0,s4,1
    3c82:	d20795e3          	bnez	a5,39ac <printf+0x72>
    3c86:	bb25                	j	39be <printf+0x84>
                flags |= UPPERCASE;
    3c88:	0407e793          	or	a5,a5,64
                base = 16;
    3c8c:	4641                	li	a2,16
    3c8e:	b711                	j	3b92 <printf+0x258>
                if (qualifier == 'l')
    3c90:	06c00713          	li	a4,108
    3c94:	3ae58d63          	beq	a1,a4,404e <__neorv32_ram_size+0x4e>
                    str = iaddr(str,
    3c98:	000c2603          	lw	a2,0(s8)
    3c9c:	0c11                	add	s8,s8,4
        n = addr[i];
    3c9e:	00064503          	lbu	a0,0(a2)
        if (n == 0)
    3ca2:	36050c63          	beqz	a0,401a <__neorv32_ram_size+0x1a>
            if (n >= 100)
    3ca6:	06300713          	li	a4,99
    3caa:	40a75a63          	bge	a4,a0,40be <__neorv32_ram_size+0xbe>
                n          = n % 100;
    3cae:	06400593          	li	a1,100
    3cb2:	02b562b3          	rem	t0,a0,a1
                tmp[len++] = digits[n / 10];
    3cb6:	4fa9                	li	t6,10
                tmp[len++] = digits[n / 100];
    3cb8:	6729                	lui	a4,0xa
    3cba:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
                n          = n % 10;
    3cbe:	4e11                	li	t3,4
    3cc0:	468d                	li	a3,3
                tmp[len++] = digits[n / 10];
    3cc2:	4e89                	li	t4,2
    3cc4:	03f2cf33          	div	t5,t0,t6
                tmp[len++] = digits[n / 100];
    3cc8:	02b545b3          	div	a1,a0,a1
                tmp[len++] = digits[n / 10];
    3ccc:	01e70533          	add	a0,a4,t5
                tmp[len++] = digits[n / 100];
    3cd0:	00054f03          	lbu	t5,0(a0)
    3cd4:	0f22                	sll	t5,t5,0x8
                n          = n % 10;
    3cd6:	03f2e533          	rem	a0,t0,t6
                tmp[len++] = digits[n / 100];
    3cda:	95ba                	add	a1,a1,a4
    3cdc:	0005c583          	lbu	a1,0(a1)
    3ce0:	01e5e5b3          	or	a1,a1,t5
    3ce4:	08b11023          	sh	a1,128(sp)
            tmp[len++] = digits[n];
    3ce8:	953a                	add	a0,a0,a4
    3cea:	00054583          	lbu	a1,0(a0)
    3cee:	1b0e8713          	add	a4,t4,432
    3cf2:	1008                	add	a0,sp,32
    3cf4:	972a                	add	a4,a4,a0
    3cf6:	eab70823          	sb	a1,-336(a4)
            tmp[len++] = '.';
    3cfa:	100c                	add	a1,sp,32
    3cfc:	1b068713          	add	a4,a3,432
    3d00:	00b70eb3          	add	t4,a4,a1
    3d04:	02e00593          	li	a1,46
    3d08:	eabe8823          	sb	a1,-336(t4)
        n = addr[i];
    3d0c:	00164503          	lbu	a0,1(a2)
        if (n == 0)
    3d10:	2e050a63          	beqz	a0,4004 <__neorv32_ram_size+0x4>
            if (n >= 100)
    3d14:	06300713          	li	a4,99
    3d18:	36a75a63          	bge	a4,a0,408c <__neorv32_ram_size+0x8c>
                tmp[len++] = digits[n / 100];
    3d1c:	06400593          	li	a1,100
    3d20:	1b0e0413          	add	s0,t3,432
                tmp[len++] = digits[n / 10];
    3d24:	00368e13          	add	t3,a3,3
    3d28:	4f29                	li	t5,10
                tmp[len++] = digits[n / 100];
    3d2a:	6729                	lui	a4,0xa
    3d2c:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
    3d30:	1004                	add	s1,sp,32
    3d32:	009402b3          	add	t0,s0,s1
                n          = n % 100;
    3d36:	02b56fb3          	rem	t6,a0,a1
                tmp[len++] = digits[n / 100];
    3d3a:	02b546b3          	div	a3,a0,a1
                tmp[len++] = digits[n / 10];
    3d3e:	03efc5b3          	div	a1,t6,t5
                tmp[len++] = digits[n / 100];
    3d42:	96ba                	add	a3,a3,a4
    3d44:	0006c683          	lbu	a3,0(a3)
    3d48:	ead28823          	sb	a3,-336(t0)
                n          = n % 10;
    3d4c:	03efe533          	rem	a0,t6,t5
                tmp[len++] = digits[n / 10];
    3d50:	00b706b3          	add	a3,a4,a1
    3d54:	0006c683          	lbu	a3,0(a3)
    3d58:	eade8923          	sb	a3,-334(t4)
            tmp[len++] = digits[n];
    3d5c:	953a                	add	a0,a0,a4
    3d5e:	00054503          	lbu	a0,0(a0)
    3d62:	1b0e0713          	add	a4,t3,432
    3d66:	1014                	add	a3,sp,32
    3d68:	00d705b3          	add	a1,a4,a3
    3d6c:	001e0493          	add	s1,t3,1
    3d70:	eaa58823          	sb	a0,-336(a1)
            tmp[len++] = '.';
    3d74:	1b048713          	add	a4,s1,432
    3d78:	1014                	add	a3,sp,32
    3d7a:	00d70eb3          	add	t4,a4,a3
    3d7e:	02e00713          	li	a4,46
    3d82:	eaee8823          	sb	a4,-336(t4)
        n = addr[i];
    3d86:	00264503          	lbu	a0,2(a2)
            tmp[len++] = '.';
    3d8a:	00148e13          	add	t3,s1,1
        if (n == 0)
    3d8e:	26050163          	beqz	a0,3ff0 <printf+0x6b6>
            if (n >= 100)
    3d92:	06300593          	li	a1,99
    3d96:	34a5db63          	bge	a1,a0,40ec <__neorv32_ram_size+0xec>
                tmp[len++] = digits[n / 100];
    3d9a:	06400593          	li	a1,100
    3d9e:	1b0e0693          	add	a3,t3,432
    3da2:	1000                	add	s0,sp,32
    3da4:	008682b3          	add	t0,a3,s0
                tmp[len++] = digits[n / 10];
    3da8:	4f29                	li	t5,10
                tmp[len++] = digits[n / 100];
    3daa:	6729                	lui	a4,0xa
    3dac:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
                tmp[len++] = digits[n / 10];
    3db0:	00348e13          	add	t3,s1,3
                n          = n % 100;
    3db4:	02b56fb3          	rem	t6,a0,a1
                tmp[len++] = digits[n / 100];
    3db8:	02b546b3          	div	a3,a0,a1
                tmp[len++] = digits[n / 10];
    3dbc:	03efc5b3          	div	a1,t6,t5
                tmp[len++] = digits[n / 100];
    3dc0:	96ba                	add	a3,a3,a4
    3dc2:	0006c683          	lbu	a3,0(a3)
    3dc6:	ead28823          	sb	a3,-336(t0)
                n          = n % 10;
    3dca:	03efe533          	rem	a0,t6,t5
                tmp[len++] = digits[n / 10];
    3dce:	00b706b3          	add	a3,a4,a1
    3dd2:	0006c683          	lbu	a3,0(a3)
    3dd6:	eade8923          	sb	a3,-334(t4)
            tmp[len++] = digits[n];
    3dda:	953a                	add	a0,a0,a4
    3ddc:	00054583          	lbu	a1,0(a0)
    3de0:	1b0e0713          	add	a4,t3,432
    3de4:	1014                	add	a3,sp,32
    3de6:	96ba                	add	a3,a3,a4
    3de8:	001e0493          	add	s1,t3,1
    3dec:	eab68823          	sb	a1,-336(a3)
            tmp[len++] = '.';
    3df0:	1b048713          	add	a4,s1,432
    3df4:	1014                	add	a3,sp,32
    3df6:	00d70533          	add	a0,a4,a3
    3dfa:	02e00713          	li	a4,46
    3dfe:	eae50823          	sb	a4,-336(a0)
        n = addr[i];
    3e02:	00364683          	lbu	a3,3(a2)
            tmp[len++] = '.';
    3e06:	00148593          	add	a1,s1,1
        if (n == 0)
    3e0a:	1c068963          	beqz	a3,3fdc <printf+0x6a2>
            if (n >= 100)
    3e0e:	06300613          	li	a2,99
    3e12:	24d65563          	bge	a2,a3,405c <__neorv32_ram_size+0x5c>
                tmp[len++] = digits[n / 100];
    3e16:	06400613          	li	a2,100
                tmp[len++] = digits[n / 10];
    3e1a:	4e29                	li	t3,10
                tmp[len++] = digits[n / 100];
    3e1c:	6729                	lui	a4,0xa
    3e1e:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
    3e22:	1b058593          	add	a1,a1,432
    3e26:	1000                	add	s0,sp,32
    3e28:	00858f33          	add	t5,a1,s0
                tmp[len++] = digits[n / 10];
    3e2c:	00348593          	add	a1,s1,3
                n          = n % 100;
    3e30:	02c6eeb3          	rem	t4,a3,a2
                tmp[len++] = digits[n / 100];
    3e34:	02c6c6b3          	div	a3,a3,a2
                tmp[len++] = digits[n / 10];
    3e38:	03cec633          	div	a2,t4,t3
                tmp[len++] = digits[n / 100];
    3e3c:	96ba                	add	a3,a3,a4
    3e3e:	0006c683          	lbu	a3,0(a3)
    3e42:	eadf0823          	sb	a3,-336(t5)
                tmp[len++] = digits[n / 10];
    3e46:	00c706b3          	add	a3,a4,a2
    3e4a:	0006c603          	lbu	a2,0(a3)
                n          = n % 10;
    3e4e:	03cee6b3          	rem	a3,t4,t3
                tmp[len++] = digits[n / 10];
    3e52:	eac50923          	sb	a2,-334(a0)
            tmp[len++] = digits[n];
    3e56:	96ba                	add	a3,a3,a4
    3e58:	0006c603          	lbu	a2,0(a3)
    3e5c:	1b058713          	add	a4,a1,432
    3e60:	1014                	add	a3,sp,32
    3e62:	96ba                	add	a3,a3,a4
    3e64:	00158493          	add	s1,a1,1
    3e68:	eac68823          	sb	a2,-336(a3)
    if (!(type & LEFT))
    3e6c:	0107f413          	and	s0,a5,16
    3e70:	ec11                	bnez	s0,3e8c <printf+0x552>
        while (len < size--)
    3e72:	6934d163          	bge	s1,s3,44f4 <__neorv32_ram_size+0x4f4>
            *str++ = ' ';
    3e76:	409989b3          	sub	s3,s3,s1
    3e7a:	864e                	mv	a2,s3
    3e7c:	855a                	mv	a0,s6
    3e7e:	02000593          	li	a1,32
    3e82:	9b4e                	add	s6,s6,s3
    3e84:	577010ef          	jal	5bfa <memset>
    3e88:	fff48993          	add	s3,s1,-1
        *str++ = tmp[i];
    3e8c:	8626                	mv	a2,s1
    3e8e:	010c                	add	a1,sp,128
    3e90:	855a                	mv	a0,s6
    3e92:	611010ef          	jal	5ca2 <memcpy>
    3e96:	009b0533          	add	a0,s6,s1
    while (len < size--)
    3e9a:	6134dc63          	bge	s1,s3,44b2 <__neorv32_ram_size+0x4b2>
        *str++ = ' ';
    3e9e:	40998633          	sub	a2,s3,s1
    3ea2:	02000593          	li	a1,32
    3ea6:	555010ef          	jal	5bfa <memset>
    3eaa:	9b4e                	add	s6,s6,s3
    for (str = buf; *fmt; fmt++)
    3eac:	001a4783          	lbu	a5,1(s4)
    3eb0:	001a0413          	add	s0,s4,1
    3eb4:	ae079ce3          	bnez	a5,39ac <printf+0x72>
    3eb8:	b619                	j	39be <printf+0x84>
                if (qualifier == 'l')
    3eba:	06c00713          	li	a4,108
                flags |= UPPERCASE;
    3ebe:	0407e793          	or	a5,a5,64
                if (qualifier == 'l')
    3ec2:	dce59be3          	bne	a1,a4,3c98 <printf+0x35e>
        dig = upper_digits;
    3ec6:	6729                	lui	a4,0xa
                    str = eaddr(str,
    3ec8:	000c2603          	lw	a2,0(s8)
        dig = upper_digits;
    3ecc:	e1870713          	add	a4,a4,-488 # 9e18 <__fini_array_end+0x7a4>
                    str = eaddr(str,
    3ed0:	0c11                	add	s8,s8,4
        tmp[len++] = dig[addr[i] >> 4];
    3ed2:	00064683          	lbu	a3,0(a2)
            tmp[len++] = ':';
    3ed6:	03a00593          	li	a1,58
    3eda:	08b10123          	sb	a1,130(sp)
        tmp[len++] = dig[addr[i] & 0x0F];
    3ede:	00f6f513          	and	a0,a3,15
    3ee2:	953a                	add	a0,a0,a4
        tmp[len++] = dig[addr[i] >> 4];
    3ee4:	8291                	srl	a3,a3,0x4
    3ee6:	00054503          	lbu	a0,0(a0)
    3eea:	96ba                	add	a3,a3,a4
    3eec:	0006c683          	lbu	a3,0(a3)
    3ef0:	0522                	sll	a0,a0,0x8
    if (!(type & LEFT))
    3ef2:	8bc1                	and	a5,a5,16
        tmp[len++] = dig[addr[i] >> 4];
    3ef4:	8ec9                	or	a3,a3,a0
    3ef6:	08d11023          	sh	a3,128(sp)
    3efa:	00164683          	lbu	a3,1(a2)
            tmp[len++] = ':';
    3efe:	08b102a3          	sb	a1,133(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f02:	0046d513          	srl	a0,a3,0x4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f06:	8abd                	and	a3,a3,15
        tmp[len++] = dig[addr[i] >> 4];
    3f08:	953a                	add	a0,a0,a4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f0a:	96ba                	add	a3,a3,a4
        tmp[len++] = dig[addr[i] >> 4];
    3f0c:	00054503          	lbu	a0,0(a0)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f10:	0006c683          	lbu	a3,0(a3)
        tmp[len++] = dig[addr[i] >> 4];
    3f14:	08a101a3          	sb	a0,131(sp)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f18:	08d10223          	sb	a3,132(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f1c:	00264683          	lbu	a3,2(a2)
            tmp[len++] = ':';
    3f20:	08b10423          	sb	a1,136(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f24:	0046d513          	srl	a0,a3,0x4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f28:	8abd                	and	a3,a3,15
        tmp[len++] = dig[addr[i] >> 4];
    3f2a:	953a                	add	a0,a0,a4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f2c:	96ba                	add	a3,a3,a4
        tmp[len++] = dig[addr[i] >> 4];
    3f2e:	00054503          	lbu	a0,0(a0)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f32:	0006c683          	lbu	a3,0(a3)
        tmp[len++] = dig[addr[i] >> 4];
    3f36:	08a10323          	sb	a0,134(sp)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f3a:	08d103a3          	sb	a3,135(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f3e:	00364683          	lbu	a3,3(a2)
            tmp[len++] = ':';
    3f42:	08b105a3          	sb	a1,139(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f46:	0046d513          	srl	a0,a3,0x4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f4a:	8abd                	and	a3,a3,15
        tmp[len++] = dig[addr[i] >> 4];
    3f4c:	953a                	add	a0,a0,a4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f4e:	96ba                	add	a3,a3,a4
    3f50:	0006c683          	lbu	a3,0(a3)
        tmp[len++] = dig[addr[i] >> 4];
    3f54:	00054503          	lbu	a0,0(a0)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f58:	08d10523          	sb	a3,138(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f5c:	08a104a3          	sb	a0,137(sp)
    3f60:	00464683          	lbu	a3,4(a2)
            tmp[len++] = ':';
    3f64:	08b10723          	sb	a1,142(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f68:	0046d593          	srl	a1,a3,0x4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f6c:	8abd                	and	a3,a3,15
        tmp[len++] = dig[addr[i] >> 4];
    3f6e:	95ba                	add	a1,a1,a4
        tmp[len++] = dig[addr[i] & 0x0F];
    3f70:	96ba                	add	a3,a3,a4
    3f72:	0006c683          	lbu	a3,0(a3)
        tmp[len++] = dig[addr[i] >> 4];
    3f76:	0005c583          	lbu	a1,0(a1)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f7a:	08d106a3          	sb	a3,141(sp)
        tmp[len++] = dig[addr[i] >> 4];
    3f7e:	08b10623          	sb	a1,140(sp)
    3f82:	00564683          	lbu	a3,5(a2)
    3f86:	0046d613          	srl	a2,a3,0x4
    3f8a:	963a                	add	a2,a2,a4
    3f8c:	00064603          	lbu	a2,0(a2)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f90:	8abd                	and	a3,a3,15
    3f92:	9736                	add	a4,a4,a3
        tmp[len++] = dig[addr[i] >> 4];
    3f94:	08c107a3          	sb	a2,143(sp)
        tmp[len++] = dig[addr[i] & 0x0F];
    3f98:	00074703          	lbu	a4,0(a4)
    3f9c:	08e10823          	sb	a4,144(sp)
    if (!(type & LEFT))
    3fa0:	e7c9                	bnez	a5,402a <__neorv32_ram_size+0x2a>
        while (len < size--)
    3fa2:	47c5                	li	a5,17
    3fa4:	0937d263          	bge	a5,s3,4028 <__neorv32_ram_size+0x28>
            *str++ = ' ';
    3fa8:	fef98413          	add	s0,s3,-17
    3fac:	8622                	mv	a2,s0
    3fae:	02000593          	li	a1,32
    3fb2:	855a                	mv	a0,s6
    3fb4:	447010ef          	jal	5bfa <memset>
        *str++ = tmp[i];
    3fb8:	008b0533          	add	a0,s6,s0
    3fbc:	4645                	li	a2,17
    3fbe:	010c                	add	a1,sp,128
    3fc0:	4e3010ef          	jal	5ca2 <memcpy>
    3fc4:	9b4e                	add	s6,s6,s3
    for (str = buf; *fmt; fmt++)
    3fc6:	0024c783          	lbu	a5,2(s1)
    3fca:	00248413          	add	s0,s1,2
    3fce:	9c079fe3          	bnez	a5,39ac <printf+0x72>
    3fd2:	b2f5                	j	39be <printf+0x84>
                flags |= UPPERCASE;
    3fd4:	0407e793          	or	a5,a5,64
    3fd8:	8a26                	mv	s4,s1
    3fda:	b97d                	j	3c98 <printf+0x35e>
            tmp[len++] = digits[0];
    3fdc:	1014                	add	a3,sp,32
    3fde:	1b058713          	add	a4,a1,432
    3fe2:	9736                	add	a4,a4,a3
    3fe4:	03000693          	li	a3,48
    3fe8:	0489                	add	s1,s1,2
    3fea:	ead70823          	sb	a3,-336(a4)
    3fee:	bdbd                	j	3e6c <printf+0x532>
    3ff0:	1014                	add	a3,sp,32
    3ff2:	1b0e0713          	add	a4,t3,432
    3ff6:	9736                	add	a4,a4,a3
    3ff8:	03000693          	li	a3,48
    3ffc:	0489                	add	s1,s1,2
    3ffe:	ead70823          	sb	a3,-336(a4)
    4002:	b3fd                	j	3df0 <printf+0x4b6>
    4004:	100c                	add	a1,sp,32
    4006:	1b0e0713          	add	a4,t3,432
    400a:	972e                	add	a4,a4,a1
    400c:	03000593          	li	a1,48
    4010:	00268493          	add	s1,a3,2
    4014:	eab70823          	sb	a1,-336(a4)
    4018:	bbb1                	j	3d74 <printf+0x43a>
    401a:	03000713          	li	a4,48
    401e:	08e10023          	sb	a4,128(sp)
    4022:	4e09                	li	t3,2
    4024:	4685                	li	a3,1
    4026:	b9d1                	j	3cfa <printf+0x3c0>
                    while (--field_width > 0)
    4028:	19fd                	add	s3,s3,-1
        *str++ = tmp[i];
    402a:	4645                	li	a2,17
    402c:	010c                	add	a1,sp,128
    402e:	855a                	mv	a0,s6
    4030:	473010ef          	jal	5ca2 <memcpy>
    4034:	4445                	li	s0,17
    4036:	011b0513          	add	a0,s6,17
    while (len < size--)
    403a:	55345963          	bge	s0,s3,458c <__neorv32_ram_size+0x58c>
        *str++ = ' ';
    403e:	fef98613          	add	a2,s3,-17
    4042:	02000593          	li	a1,32
    4046:	3b5010ef          	jal	5bfa <memset>
    404a:	9b4e                	add	s6,s6,s3
    404c:	bfad                	j	3fc6 <printf+0x68c>
    char *dig = digits;
    404e:	6729                	lui	a4,0xa
                    str = eaddr(str,
    4050:	000c2603          	lw	a2,0(s8)
    char *dig = digits;
    4054:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
                    str = eaddr(str,
    4058:	0c11                	add	s8,s8,4
    405a:	bda5                	j	3ed2 <printf+0x598>
            else if (n >= 10)
    405c:	6729                	lui	a4,0xa
    405e:	4625                	li	a2,9
    4060:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
    4064:	ded659e3          	bge	a2,a3,3e56 <printf+0x51c>
                tmp[len++] = digits[n / 10];
    4068:	4529                	li	a0,10
    406a:	02a6c633          	div	a2,a3,a0
    406e:	1b058593          	add	a1,a1,432
    4072:	1000                	add	s0,sp,32
    4074:	00858e33          	add	t3,a1,s0
    4078:	00248593          	add	a1,s1,2
    407c:	963a                	add	a2,a2,a4
    407e:	00064603          	lbu	a2,0(a2)
                n          = n % 10;
    4082:	02a6e6b3          	rem	a3,a3,a0
                tmp[len++] = digits[n / 10];
    4086:	eace0823          	sb	a2,-336(t3)
                n          = n % 10;
    408a:	b3f1                	j	3e56 <printf+0x51c>
            else if (n >= 10)
    408c:	6729                	lui	a4,0xa
    408e:	45a5                	li	a1,9
    4090:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
    4094:	cca5d4e3          	bge	a1,a0,3d5c <printf+0x422>
                tmp[len++] = digits[n / 10];
    4098:	4ea9                	li	t4,10
    409a:	03d545b3          	div	a1,a0,t4
    409e:	1b0e0413          	add	s0,t3,432
    40a2:	00268e13          	add	t3,a3,2
    40a6:	1004                	add	s1,sp,32
    40a8:	00940f33          	add	t5,s0,s1
    40ac:	00b706b3          	add	a3,a4,a1
    40b0:	0006c683          	lbu	a3,0(a3)
                n          = n % 10;
    40b4:	03d56533          	rem	a0,a0,t4
                tmp[len++] = digits[n / 10];
    40b8:	eadf0823          	sb	a3,-336(t5)
                n          = n % 10;
    40bc:	b145                	j	3d5c <printf+0x422>
            else if (n >= 10)
    40be:	6729                	lui	a4,0xa
    40c0:	45a5                	li	a1,9
    40c2:	4e09                	li	t3,2
    40c4:	4685                	li	a3,1
    40c6:	4e81                	li	t4,0
    40c8:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
    40cc:	c0a5dee3          	bge	a1,a0,3ce8 <printf+0x3ae>
                tmp[len++] = digits[n / 10];
    40d0:	4f29                	li	t5,10
    40d2:	03e545b3          	div	a1,a0,t5
                n          = n % 10;
    40d6:	4e0d                	li	t3,3
    40d8:	4689                	li	a3,2
                tmp[len++] = digits[n / 10];
    40da:	4e85                	li	t4,1
    40dc:	95ba                	add	a1,a1,a4
    40de:	0005c583          	lbu	a1,0(a1)
                n          = n % 10;
    40e2:	03e56533          	rem	a0,a0,t5
                tmp[len++] = digits[n / 10];
    40e6:	08b10023          	sb	a1,128(sp)
                n          = n % 10;
    40ea:	befd                	j	3ce8 <printf+0x3ae>
            else if (n >= 10)
    40ec:	6729                	lui	a4,0xa
    40ee:	46a5                	li	a3,9
    40f0:	df070713          	add	a4,a4,-528 # 9df0 <__fini_array_end+0x77c>
    40f4:	cea6d3e3          	bge	a3,a0,3dda <printf+0x4a0>
                tmp[len++] = digits[n / 10];
    40f8:	45a9                	li	a1,10
    40fa:	02b546b3          	div	a3,a0,a1
    40fe:	1b0e0413          	add	s0,t3,432
    4102:	02010813          	add	a6,sp,32
    4106:	01040eb3          	add	t4,s0,a6
    410a:	00248e13          	add	t3,s1,2
    410e:	96ba                	add	a3,a3,a4
    4110:	0006c683          	lbu	a3,0(a3)
                n          = n % 10;
    4114:	02b56533          	rem	a0,a0,a1
                tmp[len++] = digits[n / 10];
    4118:	eade8823          	sb	a3,-336(t4)
                n          = n % 10;
    411c:	b97d                	j	3dda <printf+0x4a0>
                    while (--field_width > 0)
    411e:	4785                	li	a5,1
    4120:	2537dd63          	bge	a5,s3,437a <__neorv32_ram_size+0x37a>
                        *str++ = ' ';
    4124:	19fd                	add	s3,s3,-1
    4126:	864e                	mv	a2,s3
    4128:	855a                	mv	a0,s6
    412a:	02000593          	li	a1,32
    412e:	9b4e                	add	s6,s6,s3
    4130:	2cb010ef          	jal	5bfa <memset>
                    while (--field_width > 0)
    4134:	4981                	li	s3,0
    4136:	bcc5                	j	3c26 <printf+0x2ec>
                flags |= SIGN;
    4138:	0027e793          	or	a5,a5,2
                    str = eaddr(str,
    413c:	004c0713          	add	a4,s8,4
    4140:	8a26                	mv	s4,s1
    4142:	b4d1                	j	3c06 <printf+0x2cc>
    4144:	1fa12023          	sw	s10,480(sp)
                str = flt(str,
    4148:	0c1d                	add	s8,s8,7
    414a:	ff8c7c13          	and	s8,s8,-8
    if (flags & LEFT)
    414e:	0107f693          	and	a3,a5,16
                str = flt(str,
    4152:	000c2e83          	lw	t4,0(s8)
    4156:	004c2703          	lw	a4,4(s8)
    415a:	0c21                	add	s8,s8,8
    if (flags & LEFT)
    415c:	26068b63          	beqz	a3,43d2 <__neorv32_ram_size+0x3d2>
        flags &= ~ZEROPAD;
    4160:	9bf9                	and	a5,a5,-2
    4162:	0027e493          	or	s1,a5,2
    4166:	47c1                	li	a5,16
    4168:	c63e                	sw	a5,12(sp)
    c    = (flags & ZEROPAD) ? '0' : ' ';
    416a:	02000793          	li	a5,32
    416e:	cc3e                	sw	a5,24(sp)
        if (num < 0.0)
    4170:	8576                	mv	a0,t4
    4172:	85ba                	mv	a1,a4
    4174:	4601                	li	a2,0
    4176:	4681                	li	a3,0
    4178:	ca76                	sw	t4,20(sp)
    417a:	c83a                	sw	a4,16(sp)
    417c:	4a6040ef          	jal	8622 <__ledf2>
    4180:	4742                	lw	a4,16(sp)
    4182:	4ed2                	lw	t4,20(sp)
    4184:	2c054363          	bltz	a0,444a <__neorv32_ram_size+0x44a>
        else if (flags & PLUS)
    4188:	0044f793          	and	a5,s1,4
    418c:	30078a63          	beqz	a5,44a0 <__neorv32_ram_size+0x4a0>
            size--;
    4190:	19fd                	add	s3,s3,-1
            sign = '+';
    4192:	02b00d13          	li	s10,43
    if (precision < 0)
    4196:	57fd                	li	a5,-1
    4198:	00f41363          	bne	s0,a5,419e <__neorv32_ram_size+0x19e>
        precision = 6; // Default precision: 6
    419c:	4419                	li	s0,6
        digits = fcvtbuf(value, precision, &decpt, &sign, cvtbuf);
    419e:	85ba                	mv	a1,a4
    41a0:	011c                	add	a5,sp,128
    41a2:	1078                	add	a4,sp,44
    41a4:	1034                	add	a3,sp,40
    41a6:	8576                	mv	a0,t4
    41a8:	8622                	mv	a2,s0
    41aa:	db4ff0ef          	jal	375e <fcvtbuf>
        if (sign)
    41ae:	5732                	lw	a4,44(sp)
        digits = fcvtbuf(value, precision, &decpt, &sign, cvtbuf);
    41b0:	86aa                	mv	a3,a0
        if (sign)
    41b2:	181c                	add	a5,sp,48
    41b4:	c719                	beqz	a4,41c2 <__neorv32_ram_size+0x1c2>
            *buffer++ = '-';
    41b6:	02d00793          	li	a5,45
    41ba:	02f10823          	sb	a5,48(sp)
    41be:	03110793          	add	a5,sp,49
        if (*digits)
    41c2:	0006c703          	lbu	a4,0(a3)
    41c6:	32070963          	beqz	a4,44f8 <__neorv32_ram_size+0x4f8>
            if (decpt <= 0)
    41ca:	5522                	lw	a0,40(sp)
    41cc:	00168613          	add	a2,a3,1
                        *buffer++ = '.';
    41d0:	02e00e93          	li	t4,46
            if (decpt <= 0)
    41d4:	36a05b63          	blez	a0,454a <__neorv32_ram_size+0x54a>
                    if (pos++ == decpt)
    41d8:	40d605b3          	sub	a1,a2,a3
    41dc:	15fd                	add	a1,a1,-1
                while (*digits)
    41de:	0605                	add	a2,a2,1
                    if (pos++ == decpt)
    41e0:	2eb50863          	beq	a0,a1,44d0 <__neorv32_ram_size+0x4d0>
                    *buffer++ = *digits++;
    41e4:	00e78023          	sb	a4,0(a5)
                while (*digits)
    41e8:	fff64703          	lbu	a4,-1(a2)
                    *buffer++ = *digits++;
    41ec:	0785                	add	a5,a5,1
                while (*digits)
    41ee:	f76d                	bnez	a4,41d8 <__neorv32_ram_size+0x1d8>
    *buffer = '\0';
    41f0:	00078023          	sb	zero,0(a5)
    if ((flags & HEX_PREP) && precision == 0)
    41f4:	0204f793          	and	a5,s1,32
    41f8:	1c078a63          	beqz	a5,43cc <__neorv32_ram_size+0x3cc>
    while (*buffer)
    41fc:	03014703          	lbu	a4,48(sp)
    if ((flags & HEX_PREP) && precision == 0)
    4200:	26040363          	beqz	s0,4466 <__neorv32_ram_size+0x466>
    for (sc = s; *sc != '\0' && count--; ++sc)
    4204:	4401                	li	s0,0
    4206:	cf19                	beqz	a4,4224 <__neorv32_ram_size+0x224>
    4208:	1810                	add	a2,sp,48
    while (*buffer)
    420a:	87b2                	mv	a5,a2
    for (sc = s; *sc != '\0' && count--; ++sc)
    420c:	1a14                	add	a3,sp,304
    420e:	a019                	j	4214 <__neorv32_ram_size+0x214>
    4210:	1cd78c63          	beq	a5,a3,43e8 <__neorv32_ram_size+0x3e8>
    4214:	0017c703          	lbu	a4,1(a5)
    4218:	0785                	add	a5,a5,1
    421a:	fb7d                	bnez	a4,4210 <__neorv32_ram_size+0x210>
    return sc - s;
    421c:	40c78433          	sub	s0,a5,a2
    size -= n;
    4220:	408989b3          	sub	s3,s3,s0
    if (!(flags & (ZEROPAD | LEFT)))
    4224:	47b2                	lw	a5,12(sp)
    4226:	eb99                	bnez	a5,423c <__neorv32_ram_size+0x23c>
        while (size-- > 0)
    4228:	31305063          	blez	s3,4528 <__neorv32_ram_size+0x528>
            *str++ = ' ';
    422c:	864e                	mv	a2,s3
    422e:	855a                	mv	a0,s6
    4230:	02000593          	li	a1,32
    4234:	9b4e                	add	s6,s6,s3
    4236:	1c5010ef          	jal	5bfa <memset>
        while (size-- > 0)
    423a:	59fd                	li	s3,-1
    if (sign)
    423c:	000d0563          	beqz	s10,4246 <__neorv32_ram_size+0x246>
        *str++ = sign;
    4240:	01ab0023          	sb	s10,0(s6)
    4244:	0b05                	add	s6,s6,1
    if (!(flags & LEFT))
    4246:	88c1                	and	s1,s1,16
    4248:	e891                	bnez	s1,425c <__neorv32_ram_size+0x25c>
        while (size-- > 0)
    424a:	2f305a63          	blez	s3,453e <__neorv32_ram_size+0x53e>
            *str++ = c;
    424e:	45e2                	lw	a1,24(sp)
    4250:	864e                	mv	a2,s3
    4252:	855a                	mv	a0,s6
    4254:	1a7010ef          	jal	5bfa <memset>
    4258:	9b4e                	add	s6,s6,s3
        while (size-- > 0)
    425a:	59fd                	li	s3,-1
    for (i = 0; i < n; i++)
    425c:	00805863          	blez	s0,426c <__neorv32_ram_size+0x26c>
        *str++ = tmp[i];
    4260:	855a                	mv	a0,s6
    4262:	8622                	mv	a2,s0
    4264:	180c                	add	a1,sp,48
    4266:	23d010ef          	jal	5ca2 <memcpy>
    426a:	9b22                	add	s6,s6,s0
    while (size-- > 0)
    426c:	01305963          	blez	s3,427e <__neorv32_ram_size+0x27e>
        *str++ = ' ';
    4270:	855a                	mv	a0,s6
    4272:	864e                	mv	a2,s3
    4274:	02000593          	li	a1,32
    4278:	183010ef          	jal	5bfa <memset>
    427c:	9b4e                	add	s6,s6,s3
    for (str = buf; *fmt; fmt++)
    427e:	001a4783          	lbu	a5,1(s4)
                continue;
    4282:	1e012d03          	lw	s10,480(sp)
    for (str = buf; *fmt; fmt++)
    4286:	001a0413          	add	s0,s4,1
    428a:	f2079163          	bnez	a5,39ac <printf+0x72>
    428e:	f30ff06f          	j	39be <printf+0x84>
    4292:	1fa12023          	sw	s10,480(sp)
                s = va_arg(args, char *);
    4296:	000c2d03          	lw	s10,0(s8)
    429a:	0c11                	add	s8,s8,4
                if (!s)
    429c:	1a0d0363          	beqz	s10,4442 <__neorv32_ram_size+0x442>
    for (sc = s; *sc != '\0' && count--; ++sc)
    42a0:	000d4703          	lbu	a4,0(s10)
    42a4:	c771                	beqz	a4,4370 <__neorv32_ram_size+0x370>
    42a6:	c469                	beqz	s0,4370 <__neorv32_ram_size+0x370>
    42a8:	876a                	mv	a4,s10
    42aa:	a029                	j	42b4 <__neorv32_ram_size+0x2b4>
    42ac:	408706b3          	sub	a3,a4,s0
    42b0:	01a68663          	beq	a3,s10,42bc <__neorv32_ram_size+0x2bc>
    42b4:	00174683          	lbu	a3,1(a4)
    42b8:	0705                	add	a4,a4,1
    42ba:	faed                	bnez	a3,42ac <__neorv32_ram_size+0x2ac>
                if (!(flags & LEFT))
    42bc:	8bc1                	and	a5,a5,16
    return sc - s;
    42be:	41a704b3          	sub	s1,a4,s10
                if (!(flags & LEFT))
    42c2:	cbad                	beqz	a5,4334 <__neorv32_ram_size+0x334>
                for (i = 0; i < len; ++i)
    42c4:	04905363          	blez	s1,430a <__neorv32_ram_size+0x30a>
    42c8:	fff48793          	add	a5,s1,-1
    42cc:	4719                	li	a4,6
    42ce:	16f77763          	bgeu	a4,a5,443c <__neorv32_ram_size+0x43c>
    42d2:	001d0793          	add	a5,s10,1
    42d6:	01ab6733          	or	a4,s6,s10
    42da:	40fb06b3          	sub	a3,s6,a5
    42de:	8b0d                	and	a4,a4,3
    42e0:	0036b693          	sltiu	a3,a3,3
    42e4:	00173713          	seqz	a4,a4
    42e8:	0016b693          	seqz	a3,a3
    42ec:	8f75                	and	a4,a4,a3
    42ee:	10071263          	bnez	a4,43f2 <__neorv32_ram_size+0x3f2>
    42f2:	9d26                	add	s10,s10,s1
    for (sc = s; *sc != '\0' && count--; ++sc)
    42f4:	875a                	mv	a4,s6
    42f6:	a011                	j	42fa <__neorv32_ram_size+0x2fa>
    42f8:	0785                	add	a5,a5,1
                    *str++ = *s++;
    42fa:	fff7c683          	lbu	a3,-1(a5)
    42fe:	0705                	add	a4,a4,1
    4300:	fed70fa3          	sb	a3,-1(a4)
                for (i = 0; i < len; ++i)
    4304:	fefd1ae3          	bne	s10,a5,42f8 <__neorv32_ram_size+0x2f8>
    4308:	9b26                	add	s6,s6,s1
    for (str = buf; *fmt; fmt++)
    430a:	001a0413          	add	s0,s4,1
                while (len < field_width--)
    430e:	1b34d463          	bge	s1,s3,44b6 <__neorv32_ram_size+0x4b6>
                    *str++ = ' ';
    4312:	409984b3          	sub	s1,s3,s1
    4316:	855a                	mv	a0,s6
    4318:	8626                	mv	a2,s1
    431a:	02000593          	li	a1,32
    431e:	0dd010ef          	jal	5bfa <memset>
    for (str = buf; *fmt; fmt++)
    4322:	001a4783          	lbu	a5,1(s4)
    4326:	1e012d03          	lw	s10,480(sp)
    432a:	9b26                	add	s6,s6,s1
    432c:	e8079063          	bnez	a5,39ac <printf+0x72>
    4330:	e8eff06f          	j	39be <printf+0x84>
                    while (len < field_width--)
    4334:	2134d363          	bge	s1,s3,453a <__neorv32_ram_size+0x53a>
                        *str++ = ' ';
    4338:	409989b3          	sub	s3,s3,s1
    433c:	864e                	mv	a2,s3
    433e:	855a                	mv	a0,s6
    4340:	02000593          	li	a1,32
    4344:	9b4e                	add	s6,s6,s3
    4346:	0b5010ef          	jal	5bfa <memset>
    434a:	fff48993          	add	s3,s1,-1
    434e:	bf9d                	j	42c4 <__neorv32_ram_size+0x2c4>
    4350:	1fa12023          	sw	s10,480(sp)
        switch (*fmt)
    4354:	8a26                	mv	s4,s1
    4356:	bbcd                	j	4148 <__neorv32_ram_size+0x148>
    4358:	1fa12023          	sw	s10,480(sp)
    435c:	8a26                	mv	s4,s1
    435e:	bf25                	j	4296 <__neorv32_ram_size+0x296>
    4360:	8a26                	mv	s4,s1
    4362:	ba1d                	j	3c98 <printf+0x35e>
                flags |= UPPERCASE;
    4364:	0407e793          	or	a5,a5,64
    4368:	8a26                	mv	s4,s1
                base = 16;
    436a:	4641                	li	a2,16
    436c:	827ff06f          	j	3b92 <printf+0x258>
                if (!(flags & LEFT))
    4370:	0107f493          	and	s1,a5,16
    4374:	d0e1                	beqz	s1,4334 <__neorv32_ram_size+0x334>
    return sc - s;
    4376:	4481                	li	s1,0
    4378:	bf49                	j	430a <__neorv32_ram_size+0x30a>
                *str++ = (unsigned char)va_arg(args, int);
    437a:	000c2783          	lw	a5,0(s8)
    437e:	0b05                	add	s6,s6,1
    4380:	8c26                	mv	s8,s1
    4382:	fefb0fa3          	sb	a5,-1(s6)
    for (str = buf; *fmt; fmt++)
    4386:	001a4783          	lbu	a5,1(s4)
    438a:	e2079163          	bnez	a5,39ac <printf+0x72>
    438e:	e30ff06f          	j	39be <printf+0x84>
    for (sc = s; *sc != '\0' && count--; ++sc)
    4392:	000e4703          	lbu	a4,0(t3)
    4396:	100e0693          	add	a3,t3,256
    439a:	87f2                	mv	a5,t3
    439c:	e701                	bnez	a4,43a4 <__neorv32_ram_size+0x3a4>
    439e:	a01d                	j	43c4 <__neorv32_ram_size+0x3c4>
    43a0:	00d78663          	beq	a5,a3,43ac <__neorv32_ram_size+0x3ac>
    43a4:	0017c703          	lbu	a4,1(a5)
    43a8:	0785                	add	a5,a5,1
    43aa:	fb7d                	bnez	a4,43a0 <__neorv32_ram_size+0x3a0>
    return sc - s;
    43ac:	41c78633          	sub	a2,a5,t3
        while (n > 0)
    43b0:	00c05a63          	blez	a2,43c4 <__neorv32_ram_size+0x3c4>
            buffer[n + 1] = buffer[n];
    43b4:	001e0593          	add	a1,t3,1
    43b8:	002e0513          	add	a0,t3,2
    43bc:	c872                	sw	t3,16(sp)
    43be:	770010ef          	jal	5b2e <memmove>
    43c2:	4e42                	lw	t3,16(sp)
        *buffer = '.';
    43c4:	02e00793          	li	a5,46
    43c8:	00fe0023          	sb	a5,0(t3)
    for (sc = s; *sc != '\0' && count--; ++sc)
    43cc:	03014703          	lbu	a4,48(sp)
    43d0:	bd15                	j	4204 <__neorv32_ram_size+0x204>
    43d2:	0017f693          	and	a3,a5,1
                str = flt(str,
    43d6:	0027e493          	or	s1,a5,2
    c    = (flags & ZEROPAD) ? '0' : ' ';
    43da:	8bc5                	and	a5,a5,17
    43dc:	c63e                	sw	a5,12(sp)
    43de:	c6e5                	beqz	a3,44c6 <__neorv32_ram_size+0x4c6>
    43e0:	03000793          	li	a5,48
    43e4:	cc3e                	sw	a5,24(sp)
    43e6:	b369                	j	4170 <__neorv32_ram_size+0x170>
    size -= n;
    43e8:	f0098993          	add	s3,s3,-256
    43ec:	10000413          	li	s0,256
    43f0:	bd15                	j	4224 <__neorv32_ram_size+0x224>
    43f2:	ffc4f613          	and	a2,s1,-4
    43f6:	87da                	mv	a5,s6
    43f8:	00cd06b3          	add	a3,s10,a2
                    *str++ = *s++;
    43fc:	000d2703          	lw	a4,0(s10)
    4400:	0d11                	add	s10,s10,4
    4402:	0791                	add	a5,a5,4
    4404:	fee7ae23          	sw	a4,-4(a5)
                for (i = 0; i < len; ++i)
    4408:	ffa69ae3          	bne	a3,s10,43fc <__neorv32_ram_size+0x3fc>
    440c:	00cb0733          	add	a4,s6,a2
    4410:	ee960ce3          	beq	a2,s1,4308 <__neorv32_ram_size+0x308>
                    *str++ = *s++;
    4414:	0006c583          	lbu	a1,0(a3)
                for (i = 0; i < len; ++i)
    4418:	00160793          	add	a5,a2,1
                    *str++ = *s++;
    441c:	00b70023          	sb	a1,0(a4)
                for (i = 0; i < len; ++i)
    4420:	ee97d4e3          	bge	a5,s1,4308 <__neorv32_ram_size+0x308>
                    *str++ = *s++;
    4424:	0016c783          	lbu	a5,1(a3)
                for (i = 0; i < len; ++i)
    4428:	0609                	add	a2,a2,2
                    *str++ = *s++;
    442a:	00f700a3          	sb	a5,1(a4)
                for (i = 0; i < len; ++i)
    442e:	ec965de3          	bge	a2,s1,4308 <__neorv32_ram_size+0x308>
                    *str++ = *s++;
    4432:	0026c783          	lbu	a5,2(a3)
    4436:	00f70123          	sb	a5,2(a4)
                for (i = 0; i < len; ++i)
    443a:	b5f9                	j	4308 <__neorv32_ram_size+0x308>
    443c:	001d0793          	add	a5,s10,1
    4440:	bd4d                	j	42f2 <__neorv32_ram_size+0x2f2>
                    s = "<NULL>";
    4442:	6d29                	lui	s10,0xa
    4444:	e40d0d13          	add	s10,s10,-448 # 9e40 <__fini_array_end+0x7cc>
    4448:	bdb9                	j	42a6 <__neorv32_ram_size+0x2a6>
            num  = -num;
    444a:	800007b7          	lui	a5,0x80000
    444e:	8f3d                	xor	a4,a4,a5
            size--;
    4450:	19fd                	add	s3,s3,-1
            sign = '-';
    4452:	02d00d13          	li	s10,45
    4456:	b381                	j	4196 <__neorv32_ram_size+0x196>
    *buffer = '\0';
    4458:	000780a3          	sb	zero,1(a5) # 80000001 <__malloc_av_+0x1>
    if ((flags & HEX_PREP) && precision == 0)
    445c:	0204f793          	and	a5,s1,32
    4460:	d7b5                	beqz	a5,43cc <__neorv32_ram_size+0x3cc>
    while (*buffer)
    4462:	03014703          	lbu	a4,48(sp)
    4466:	12070563          	beqz	a4,4590 <__neorv32_ram_size+0x590>
    446a:	1810                	add	a2,sp,48
    446c:	8e32                	mv	t3,a2
        if (*buffer == '.')
    446e:	02e00793          	li	a5,46
        if (*buffer == 'e' || *buffer == 'E')
    4472:	06500593          	li	a1,101
    4476:	04500693          	li	a3,69
        if (*buffer == '.')
    447a:	d8f708e3          	beq	a4,a5,420a <__neorv32_ram_size+0x20a>
        if (*buffer == 'e' || *buffer == 'E')
    447e:	f0b70ae3          	beq	a4,a1,4392 <__neorv32_ram_size+0x392>
    4482:	f0d708e3          	beq	a4,a3,4392 <__neorv32_ram_size+0x392>
    while (*buffer)
    4486:	001e4703          	lbu	a4,1(t3)
        buffer++;
    448a:	0e05                	add	t3,t3,1
    while (*buffer)
    448c:	f77d                	bnez	a4,447a <__neorv32_ram_size+0x47a>
        *buffer++ = '.';
    448e:	02e00793          	li	a5,46
    4492:	00fe0023          	sb	a5,0(t3)
    for (sc = s; *sc != '\0' && count--; ++sc)
    4496:	03014703          	lbu	a4,48(sp)
        *buffer   = '\0';
    449a:	000e00a3          	sb	zero,1(t3)
    if (fmt == 'g' && !(flags & HEX_PREP))
    449e:	b39d                	j	4204 <__neorv32_ram_size+0x204>
        else if (flags & SPACE)
    44a0:	0084f793          	and	a5,s1,8
    sign = 0;
    44a4:	4d01                	li	s10,0
        else if (flags & SPACE)
    44a6:	ce0788e3          	beqz	a5,4196 <__neorv32_ram_size+0x196>
            size--;
    44aa:	19fd                	add	s3,s3,-1
            sign = ' ';
    44ac:	02000d13          	li	s10,32
    44b0:	b1dd                	j	4196 <__neorv32_ram_size+0x196>
    while (len < size--)
    44b2:	8b2a                	mv	s6,a0
    44b4:	bae5                	j	3eac <printf+0x572>
    for (str = buf; *fmt; fmt++)
    44b6:	001a4783          	lbu	a5,1(s4)
    44ba:	1e012d03          	lw	s10,480(sp)
    44be:	ce079763          	bnez	a5,39ac <printf+0x72>
    44c2:	cfcff06f          	j	39be <printf+0x84>
    c    = (flags & ZEROPAD) ? '0' : ' ';
    44c6:	02000793          	li	a5,32
    44ca:	c602                	sw	zero,12(sp)
    44cc:	cc3e                	sw	a5,24(sp)
    44ce:	b14d                	j	4170 <__neorv32_ram_size+0x170>
                    *buffer++ = *digits++;
    44d0:	00e780a3          	sb	a4,1(a5)
                while (*digits)
    44d4:	fff64703          	lbu	a4,-1(a2)
                        *buffer++ = '.';
    44d8:	01d78023          	sb	t4,0(a5)
                    *buffer++ = *digits++;
    44dc:	0789                	add	a5,a5,2
                while (*digits)
    44de:	ce071de3          	bnez	a4,41d8 <__neorv32_ram_size+0x1d8>
    44e2:	b339                	j	41f0 <__neorv32_ram_size+0x1f0>
    for (str = buf; *fmt; fmt++)
    44e4:	001a4783          	lbu	a5,1(s4)
                *str++ = (unsigned char)va_arg(args, int);
    44e8:	8c26                	mv	s8,s1
    44ea:	8b2a                	mv	s6,a0
    for (str = buf; *fmt; fmt++)
    44ec:	cc079063          	bnez	a5,39ac <printf+0x72>
    44f0:	cceff06f          	j	39be <printf+0x84>
                    while (--field_width > 0)
    44f4:	19fd                	add	s3,s3,-1
    44f6:	ba59                	j	3e8c <printf+0x552>
            *buffer++ = '0';
    44f8:	03000713          	li	a4,48
    44fc:	00e78023          	sb	a4,0(a5)
            if (precision > 0)
    4500:	dc21                	beqz	s0,4458 <__neorv32_ram_size+0x458>
                *buffer++ = '.';
    4502:	00278713          	add	a4,a5,2
    4506:	02e00693          	li	a3,46
                    *buffer++ = '0';
    450a:	853a                	mv	a0,a4
                *buffer++ = '.';
    450c:	00d780a3          	sb	a3,1(a5)
                    *buffer++ = '0';
    4510:	8622                	mv	a2,s0
    4512:	03000593          	li	a1,48
    4516:	6e4010ef          	jal	5bfa <memset>
    *buffer = '\0';
    451a:	00850733          	add	a4,a0,s0
    451e:	00070023          	sb	zero,0(a4)
    for (sc = s; *sc != '\0' && count--; ++sc)
    4522:	03014703          	lbu	a4,48(sp)
    4526:	b9f9                	j	4204 <__neorv32_ram_size+0x204>
    if (sign)
    4528:	000d0d63          	beqz	s10,4542 <__neorv32_ram_size+0x542>
        *str++ = sign;
    452c:	01ab0023          	sb	s10,0(s6)
    if (!(flags & LEFT))
    4530:	88c1                	and	s1,s1,16
        *str++ = sign;
    4532:	0b05                	add	s6,s6,1
    if (!(flags & LEFT))
    4534:	e489                	bnez	s1,453e <__neorv32_ram_size+0x53e>
        while (size-- > 0)
    4536:	19f9                	add	s3,s3,-2
    4538:	b315                	j	425c <__neorv32_ram_size+0x25c>
                    while (len < field_width--)
    453a:	19fd                	add	s3,s3,-1
    453c:	b361                	j	42c4 <__neorv32_ram_size+0x2c4>
        while (size-- > 0)
    453e:	19fd                	add	s3,s3,-1
    4540:	bb31                	j	425c <__neorv32_ram_size+0x25c>
        while (size-- > 0)
    4542:	19f9                	add	s3,s3,-2
    for (i = 0; i < n; i++)
    4544:	d0804ee3          	bgtz	s0,4260 <__neorv32_ram_size+0x260>
    4548:	bb1d                	j	427e <__neorv32_ram_size+0x27e>
                *buffer++ = '0';
    454a:	03000613          	li	a2,48
    454e:	00c78023          	sb	a2,0(a5)
                *buffer++ = '.';
    4552:	02e00613          	li	a2,46
    4556:	00c780a3          	sb	a2,1(a5)
    455a:	0789                	add	a5,a5,2
                for (pos = 0; pos < -decpt; pos++)
    455c:	40a00633          	neg	a2,a0
    4560:	cd11                	beqz	a0,457c <__neorv32_ram_size+0x57c>
                    *buffer++ = '0';
    4562:	853e                	mv	a0,a5
    4564:	03000593          	li	a1,48
    4568:	ce36                	sw	a3,28(sp)
    456a:	ca3a                	sw	a4,20(sp)
    456c:	c832                	sw	a2,16(sp)
    456e:	68c010ef          	jal	5bfa <memset>
    4572:	4642                	lw	a2,16(sp)
    4574:	46f2                	lw	a3,28(sp)
    4576:	4752                	lw	a4,20(sp)
    4578:	00c507b3          	add	a5,a0,a2
                    *buffer++ = *digits++;
    457c:	0685                	add	a3,a3,1
    457e:	00e78023          	sb	a4,0(a5)
                while (*digits)
    4582:	0006c703          	lbu	a4,0(a3)
                    *buffer++ = *digits++;
    4586:	0785                	add	a5,a5,1
                while (*digits)
    4588:	fb75                	bnez	a4,457c <__neorv32_ram_size+0x57c>
    458a:	b19d                	j	41f0 <__neorv32_ram_size+0x1f0>
    while (len < size--)
    458c:	8b2a                	mv	s6,a0
    458e:	bc25                	j	3fc6 <printf+0x68c>
    while (*buffer)
    4590:	03010e13          	add	t3,sp,48
    4594:	bded                	j	448e <__neorv32_ram_size+0x48e>

00004596 <neorv32_aux_itoa>:
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
    4596:	67a9                	lui	a5,0xa
    4598:	e4878793          	add	a5,a5,-440 # 9e48 <__fini_array_end+0x7d4>
    459c:	43d4                	lw	a3,4(a5)
    459e:	4798                	lw	a4,8(a5)
    45a0:	0007a803          	lw	a6,0(a5)
    45a4:	47dc                	lw	a5,12(a5)
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
    45a6:	7139                	add	sp,sp,-64
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
    45a8:	c836                	sw	a3,16(sp)
    45aa:	ca3a                	sw	a4,20(sp)
    45ac:	cc3e                	sw	a5,24(sp)
    45ae:	c642                	sw	a6,12(sp)
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
    45b0:	ce02                	sw	zero,28(sp)
  }

  if ((base < 2) || (base > 16)) { // invalid base?
    45b2:	ffe60693          	add	a3,a2,-2
    45b6:	47b9                	li	a5,14
    tmp[i] = 0;
    45b8:	d002                	sw	zero,32(sp)
    45ba:	d202                	sw	zero,36(sp)
    45bc:	d402                	sw	zero,40(sp)
    45be:	d602                	sw	zero,44(sp)
    45c0:	d802                	sw	zero,48(sp)
    45c2:	da02                	sw	zero,52(sp)
    45c4:	dc02                	sw	zero,56(sp)
    45c6:	de02                	sw	zero,60(sp)
  if ((base < 2) || (base > 16)) { // invalid base?
    45c8:	03f10713          	add	a4,sp,63
    45cc:	02d7ec63          	bltu	a5,a3,4604 <neorv32_aux_itoa+0x6e>
  }

  tmp_ptr = &tmp[sizeof(tmp)-1]; // go to end of array
  do { // generate digit by digit
    tmp_ptr--;
    *tmp_ptr = digits[num%base];
    45d0:	02c5f7b3          	remu	a5,a1,a2
    tmp_ptr--;
    45d4:	177d                	add	a4,a4,-1
    *tmp_ptr = digits[num%base];
    45d6:	86ae                	mv	a3,a1
    45d8:	04078793          	add	a5,a5,64
    45dc:	978a                	add	a5,a5,sp
    45de:	fcc7c783          	lbu	a5,-52(a5)
    num /= base;
    45e2:	02c5d5b3          	divu	a1,a1,a2
    *tmp_ptr = digits[num%base];
    45e6:	00f70023          	sb	a5,0(a4)
  } while (num != 0);
    45ea:	fec6f3e3          	bgeu	a3,a2,45d0 <neorv32_aux_itoa+0x3a>
    45ee:	087c                	add	a5,sp,28
    45f0:	0094                	add	a3,sp,64

  // delete leading zeros
  for (i=0; i<sizeof(tmp); i++) {
    if (tmp[i] != '\0') {
    45f2:	0007c703          	lbu	a4,0(a5)
  for (i=0; i<sizeof(tmp); i++) {
    45f6:	0785                	add	a5,a5,1
    if (tmp[i] != '\0') {
    45f8:	c701                	beqz	a4,4600 <neorv32_aux_itoa+0x6a>
      *buffer = tmp[i];
    45fa:	00e50023          	sb	a4,0(a0)
      buffer++;
    45fe:	0505                	add	a0,a0,1
  for (i=0; i<sizeof(tmp); i++) {
    4600:	fef699e3          	bne	a3,a5,45f2 <neorv32_aux_itoa+0x5c>
    }
  }

  // terminate result string
  *buffer = '\0';
    4604:	00050023          	sb	zero,0(a0)
}
    4608:	6121                	add	sp,sp,64
    460a:	8082                	ret

0000460c <neorv32_cpu_get_cycle>:
    460c:	c80027f3          	rdcycleh	a5
    4610:	c0002573          	rdcycle	a0
    4614:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
    4618:	fef59ae3          	bne	a1,a5,460c <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
    461c:	8082                	ret

0000461e <neorv32_cpu_hpm_get_num_counters>:
    461e:	fc002573          	csrr	a0,0xfc0
 * @return Returns number of available HPM counters.
 **************************************************************************/
uint32_t neorv32_cpu_hpm_get_num_counters(void) {

  // HPMs implemented at all?
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1<<CSR_MXISA_ZIHPM)) == 0) {
    4622:	20057513          	and	a0,a0,512
    4626:	c549                	beqz	a0,46b0 <neorv32_cpu_hpm_get_num_counters+0x92>
 * @param[in] mask Bit mask (high-active) to set bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_set(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrs %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    4628:	57e1                	li	a5,-8
    462a:	3207a073          	csrs	mcountinhibit,a5
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    462e:	4785                	li	a5,1
    4630:	b0379073          	csrw	mhpmcounter3,a5
    4634:	b0479073          	csrw	mhpmcounter4,a5
    4638:	b0579073          	csrw	mhpmcounter5,a5
    463c:	b0679073          	csrw	mhpmcounter6,a5
    4640:	b0779073          	csrw	mhpmcounter7,a5
    4644:	b0879073          	csrw	mhpmcounter8,a5
    4648:	b0979073          	csrw	mhpmcounter9,a5
    464c:	b0a79073          	csrw	mhpmcounter10,a5
    4650:	b0b79073          	csrw	mhpmcounter11,a5
    4654:	b0c79073          	csrw	mhpmcounter12,a5
    4658:	b0d79073          	csrw	mhpmcounter13,a5
    465c:	b0e79073          	csrw	mhpmcounter14,a5
    4660:	b0f79073          	csrw	mhpmcounter15,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    4664:	b03027f3          	csrr	a5,mhpmcounter3
    4668:	b0402573          	csrr	a0,mhpmcounter4
  neorv32_cpu_csr_write(CSR_MHPMCOUNTER15, 1);

  // sum-up all actually set HPMs
  uint32_t num_hpm = 0;
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER3);
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER4);
    466c:	953e                	add	a0,a0,a5
    466e:	b05027f3          	csrr	a5,mhpmcounter5
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER5);
    4672:	953e                	add	a0,a0,a5
    4674:	b06027f3          	csrr	a5,mhpmcounter6
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER6);
    4678:	953e                	add	a0,a0,a5
    467a:	b07027f3          	csrr	a5,mhpmcounter7
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER7);
    467e:	953e                	add	a0,a0,a5
    4680:	b08027f3          	csrr	a5,mhpmcounter8
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER8);
    4684:	953e                	add	a0,a0,a5
    4686:	b09027f3          	csrr	a5,mhpmcounter9
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER9);
    468a:	953e                	add	a0,a0,a5
    468c:	b0a027f3          	csrr	a5,mhpmcounter10
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER10);
    4690:	953e                	add	a0,a0,a5
    4692:	b0b027f3          	csrr	a5,mhpmcounter11
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER11);
    4696:	953e                	add	a0,a0,a5
    4698:	b0c027f3          	csrr	a5,mhpmcounter12
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER12);
    469c:	953e                	add	a0,a0,a5
    469e:	b0d027f3          	csrr	a5,mhpmcounter13
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER13);
    46a2:	953e                	add	a0,a0,a5
    46a4:	b0e027f3          	csrr	a5,mhpmcounter14
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER14);
    46a8:	953e                	add	a0,a0,a5
    46aa:	b0f027f3          	csrr	a5,mhpmcounter15
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER15);
    46ae:	953e                	add	a0,a0,a5

  return num_hpm;
}
    46b0:	8082                	ret

000046b2 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
    46b2:	557d                	li	a0,-1
    46b4:	8082                	ret

000046b6 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
    46b6:	6789                	lui	a5,0x2
    46b8:	c1dc                	sw	a5,4(a1)
  return 0;
}
    46ba:	4501                	li	a0,0
    46bc:	8082                	ret

000046be <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
    46be:	4505                	li	a0,1
    46c0:	8082                	ret

000046c2 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
    46c2:	4501                	li	a0,0
    46c4:	8082                	ret

000046c6 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
    46c6:	1101                	add	sp,sp,-32
    46c8:	ca26                	sw	s1,20(sp)
    46ca:	c84a                	sw	s2,16(sp)
    46cc:	ce06                	sw	ra,28(sp)
    46ce:	cc22                	sw	s0,24(sp)
    46d0:	c64e                	sw	s3,12(sp)
    46d2:	c452                	sw	s4,8(sp)
    46d4:	892e                	mv	s2,a1
    46d6:	84b2                	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
    46d8:	e909                	bnez	a0,46ea <_read+0x24>
    46da:	842a                	mv	s0,a0
    46dc:	fff50537          	lui	a0,0xfff50
    46e0:	087000ef          	jal	4f66 <neorv32_uart_available>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    46e4:	49a9                	li	s3,10
    46e6:	4a35                	li	s4,13
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
    46e8:	ed31                	bnez	a0,4744 <_read+0x7e>
      }
    }
    return read_cnt;
  }
  // read all other input streams from NEORV32.UART1 (if available)
  else if (neorv32_uart_available(NEORV32_UART1)) {
    46ea:	fff60537          	lui	a0,0xfff60
    46ee:	079000ef          	jal	4f66 <neorv32_uart_available>
  int read_cnt = 0;
    46f2:	4401                	li	s0,0
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART1);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    46f4:	49a9                	li	s3,10
    46f6:	4a35                	li	s4,13
  else if (neorv32_uart_available(NEORV32_UART1)) {
    46f8:	ed09                	bnez	a0,4712 <_read+0x4c>
    46fa:	a899                	j	4750 <_read+0x8a>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
    46fc:	0ff000ef          	jal	4ffa <neorv32_uart_getc>
      *ptr++ = c;
    4700:	008907b3          	add	a5,s2,s0
    4704:	00a78023          	sb	a0,0(a5) # 2000 <__neorv32_heap_size>
      read_cnt++;
    4708:	0405                	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    470a:	01350963          	beq	a0,s3,471c <_read+0x56>
    470e:	01450763          	beq	a0,s4,471c <_read+0x56>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
    4712:	fff60537          	lui	a0,0xfff60
    while (len--) {
    4716:	fe9413e3          	bne	s0,s1,46fc <_read+0x36>
    return read_cnt;
    471a:	8426                	mv	s0,s1
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    471c:	40f2                	lw	ra,28(sp)
    471e:	8522                	mv	a0,s0
    4720:	4462                	lw	s0,24(sp)
    4722:	44d2                	lw	s1,20(sp)
    4724:	4942                	lw	s2,16(sp)
    4726:	49b2                	lw	s3,12(sp)
    4728:	4a22                	lw	s4,8(sp)
    472a:	6105                	add	sp,sp,32
    472c:	8082                	ret
      c = (char)neorv32_uart_getc(NEORV32_UART0);
    472e:	0cd000ef          	jal	4ffa <neorv32_uart_getc>
      *ptr++ = c;
    4732:	008907b3          	add	a5,s2,s0
    4736:	00a78023          	sb	a0,0(a5)
      read_cnt++;
    473a:	0405                	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    473c:	ff3500e3          	beq	a0,s3,471c <_read+0x56>
    4740:	fd450ee3          	beq	a0,s4,471c <_read+0x56>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
    4744:	fff50537          	lui	a0,0xfff50
    while (len--) {
    4748:	fe9413e3          	bne	s0,s1,472e <_read+0x68>
    return read_cnt;
    474c:	8426                	mv	s0,s1
    474e:	b7f9                	j	471c <_read+0x56>
    errno = ENOSYS;
    4750:	800007b7          	lui	a5,0x80000
    4754:	05800713          	li	a4,88
    4758:	58e7ae23          	sw	a4,1436(a5) # 8000059c <errno>
    return -1;
    475c:	547d                	li	s0,-1
    475e:	bf7d                	j	471c <_read+0x56>

00004760 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
    4760:	1141                	add	sp,sp,-16
    4762:	c226                	sw	s1,4(sp)
    4764:	c04a                	sw	s2,0(sp)
    4766:	c606                	sw	ra,12(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    4768:	157d                	add	a0,a0,-1 # fff4ffff <__crt0_ram_last+0x7ff4c000>
    476a:	4785                	li	a5,1
int _write(int file, char *ptr, int len) {
    476c:	892e                	mv	s2,a1
    476e:	84b2                	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    4770:	02a7fc63          	bgeu	a5,a0,47a8 <_write+0x48>
      return -1;
    }
  }

  // write all other output streams to NEORV32.UART1 (if available)
  if (neorv32_uart_available(NEORV32_UART1)) {
    4774:	fff60537          	lui	a0,0xfff60
    4778:	7ee000ef          	jal	4f66 <neorv32_uart_available>
    477c:	c12d                	beqz	a0,47de <_write+0x7e>
    while (len--) {
    477e:	c8b1                	beqz	s1,47d2 <_write+0x72>
    4780:	c422                	sw	s0,8(sp)
    4782:	844a                	mv	s0,s2
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
    4784:	00044583          	lbu	a1,0(s0)
    4788:	fff60537          	lui	a0,0xfff60
    478c:	0405                	add	s0,s0,1
    478e:	05f000ef          	jal	4fec <neorv32_uart_putc>
    while (len--) {
    4792:	409407b3          	sub	a5,s0,s1
    4796:	ff2797e3          	bne	a5,s2,4784 <_write+0x24>
      return write_cnt;
    479a:	4422                	lw	s0,8(sp)
    479c:	8526                	mv	a0,s1
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    479e:	40b2                	lw	ra,12(sp)
    47a0:	4492                	lw	s1,4(sp)
    47a2:	4902                	lw	s2,0(sp)
    47a4:	0141                	add	sp,sp,16
    47a6:	8082                	ret
    if (neorv32_uart_available(NEORV32_UART0)) {
    47a8:	fff50537          	lui	a0,0xfff50
    47ac:	7ba000ef          	jal	4f66 <neorv32_uart_available>
    47b0:	c51d                	beqz	a0,47de <_write+0x7e>
    47b2:	c422                	sw	s0,8(sp)
      while (len--) {
    47b4:	844a                	mv	s0,s2
    47b6:	cc89                	beqz	s1,47d0 <_write+0x70>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
    47b8:	00044583          	lbu	a1,0(s0)
    47bc:	fff50537          	lui	a0,0xfff50
    47c0:	0405                	add	s0,s0,1
    47c2:	02b000ef          	jal	4fec <neorv32_uart_putc>
      while (len--) {
    47c6:	409407b3          	sub	a5,s0,s1
    47ca:	ff2797e3          	bne	a5,s2,47b8 <_write+0x58>
    47ce:	b7f1                	j	479a <_write+0x3a>
    47d0:	4422                	lw	s0,8(sp)
}
    47d2:	40b2                	lw	ra,12(sp)
    47d4:	4492                	lw	s1,4(sp)
    47d6:	4902                	lw	s2,0(sp)
      return write_cnt;
    47d8:	4501                	li	a0,0
}
    47da:	0141                	add	sp,sp,16
    47dc:	8082                	ret
      errno = ENOSYS;
    47de:	800007b7          	lui	a5,0x80000
    47e2:	05800713          	li	a4,88
    47e6:	58e7ae23          	sw	a4,1436(a5) # 8000059c <errno>
      return -1;
    47ea:	557d                	li	a0,-1
    47ec:	bf4d                	j	479e <_write+0x3e>

000047ee <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
    47ee:	800006b7          	lui	a3,0x80000
    47f2:	58c6a703          	lw	a4,1420(a3) # 8000058c <curr_heap.0>
    47f6:	800007b7          	lui	a5,0x80000
    47fa:	78078613          	add	a2,a5,1920 # 80000780 <__crt0_bss_end>
    47fe:	c715                	beqz	a4,482a <_sbrk+0x3c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
    4800:	800027b7          	lui	a5,0x80002
    4804:	78078793          	add	a5,a5,1920 # 80002780 <__heap_end>
    4808:	00c78963          	beq	a5,a2,481a <_sbrk+0x2c>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
    480c:	953a                	add	a0,a0,a4
    480e:	00f57663          	bgeu	a0,a5,481a <_sbrk+0x2c>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
    4812:	58a6a623          	sw	a0,1420(a3)

  return (void*)prev_heap;
}
    4816:	853a                	mv	a0,a4
    4818:	8082                	ret
    errno = ENOMEM;
    481a:	800007b7          	lui	a5,0x80000
    481e:	4731                	li	a4,12
    4820:	58e7ae23          	sw	a4,1436(a5) # 8000059c <errno>
    return (void*)-1; // error - no more memory
    4824:	577d                	li	a4,-1
}
    4826:	853a                	mv	a0,a4
    4828:	8082                	ret
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
    482a:	58c6a623          	sw	a2,1420(a3)
    482e:	78078713          	add	a4,a5,1920
    4832:	b7f9                	j	4800 <_sbrk+0x12>

00004834 <neorv32_rte_core>:
 * executed in machine mode).
 **************************************************************************/
void __attribute__((__naked__,aligned(4))) neorv32_rte_core(void) {

  // save context
  asm volatile (
    4834:	34011073          	csrw	mscratch,sp
    4838:	7119                	add	sp,sp,-128
    483a:	c002                	sw	zero,0(sp)
    483c:	c206                	sw	ra,4(sp)
    483e:	340110f3          	csrrw	ra,mscratch,sp
    4842:	c406                	sw	ra,8(sp)
    4844:	c60e                	sw	gp,12(sp)
    4846:	c812                	sw	tp,16(sp)
    4848:	ca16                	sw	t0,20(sp)
    484a:	cc1a                	sw	t1,24(sp)
    484c:	ce1e                	sw	t2,28(sp)
    484e:	d022                	sw	s0,32(sp)
    4850:	d226                	sw	s1,36(sp)
    4852:	d42a                	sw	a0,40(sp)
    4854:	d62e                	sw	a1,44(sp)
    4856:	d832                	sw	a2,48(sp)
    4858:	da36                	sw	a3,52(sp)
    485a:	dc3a                	sw	a4,56(sp)
    485c:	de3e                	sw	a5,60(sp)
    485e:	c0c2                	sw	a6,64(sp)
    4860:	c2c6                	sw	a7,68(sp)
    4862:	c4ca                	sw	s2,72(sp)
    4864:	c6ce                	sw	s3,76(sp)
    4866:	c8d2                	sw	s4,80(sp)
    4868:	cad6                	sw	s5,84(sp)
    486a:	ccda                	sw	s6,88(sp)
    486c:	cede                	sw	s7,92(sp)
    486e:	d0e2                	sw	s8,96(sp)
    4870:	d2e6                	sw	s9,100(sp)
    4872:	d4ea                	sw	s10,104(sp)
    4874:	d6ee                	sw	s11,108(sp)
    4876:	d8f2                	sw	t3,112(sp)
    4878:	daf6                	sw	t4,116(sp)
    487a:	dcfa                	sw	t5,120(sp)
    487c:	defe                	sw	t6,124(sp)
#endif
  );

  // flush context (stack frame) to main memory
  // reload trap table from main memory
  asm volatile ("fence");
    487e:	0ff0000f          	fence
    4882:	342027f3          	csrr	a5,mcause

  // find according trap handler base address
  uint32_t handler_base = 0;
  switch (neorv32_cpu_csr_read(CSR_MCAUSE)) {
    4886:	472d                	li	a4,11
    4888:	02f77063          	bgeu	a4,a5,48a8 <neorv32_rte_core+0x74>
    488c:	80000737          	lui	a4,0x80000
    4890:	1775                	add	a4,a4,-3 # 7ffffffd <__neorv32_rom_size+0x7ffefffd>
    4892:	97ba                	add	a5,a5,a4
    4894:	4771                	li	a4,28
    4896:	02f76063          	bltu	a4,a5,48b6 <neorv32_rte_core+0x82>
    489a:	6729                	lui	a4,0xa
    489c:	078a                	sll	a5,a5,0x2
    489e:	2c870713          	add	a4,a4,712 # a2c8 <intpat+0x22c>
    48a2:	97ba                	add	a5,a5,a4
    48a4:	439c                	lw	a5,0(a5)
    48a6:	8782                	jr	a5
    48a8:	6729                	lui	a4,0xa
    48aa:	078a                	sll	a5,a5,0x2
    48ac:	33c70713          	add	a4,a4,828 # a33c <intpat+0x2a0>
    48b0:	97ba                	add	a5,a5,a4
    48b2:	439c                	lw	a5,0(a5)
    48b4:	8782                	jr	a5
    48b6:	6795                	lui	a5,0x5
    48b8:	aec78793          	add	a5,a5,-1300 # 4aec <neorv32_rte_debug_handler>

  // call handler
  if (handler_base != 0) {
    typedef void handler_t();
    handler_t* handler = (handler_t*)handler_base;
    handler();
    48bc:	9782                	jalr	a5
    48be:	342027f3          	csrr	a5,mcause
  }

  // compute return address (for exceptions only)
  // do not alter return address if instruction access exception (fatal?)
  uint32_t cause = neorv32_cpu_csr_read(CSR_MCAUSE);
  if (((cause >> 31) == 0) && (cause != TRAP_CODE_I_ACCESS)) {
    48c2:	0207c763          	bltz	a5,48f0 <neorv32_rte_core+0xbc>
    48c6:	4705                	li	a4,1
    48c8:	02e78463          	beq	a5,a4,48f0 <neorv32_rte_core+0xbc>
    48cc:	341026f3          	csrr	a3,mepc

    uint32_t rte_mepc = neorv32_cpu_csr_read(CSR_MEPC);
    rte_mepc += 4; // default: faulting instruction is uncompressed
    48d0:	00468713          	add	a4,a3,4
    48d4:	301027f3          	csrr	a5,misa

    // adjust return address if compressed instruction
    if (neorv32_cpu_csr_read(CSR_MISA) & (1 << CSR_MISA_C)) { // C extension implemented?
    48d8:	8b91                	and	a5,a5,4
    48da:	cb89                	beqz	a5,48ec <neorv32_rte_core+0xb8>
    48dc:	34a027f3          	csrr	a5,0x34a
      if ((neorv32_cpu_csr_read(CSR_MTINST) & 3) != 3) { // faulting instruction is compressed instruction
    48e0:	460d                	li	a2,3
    48e2:	8b8d                	and	a5,a5,3
    48e4:	00c78463          	beq	a5,a2,48ec <neorv32_rte_core+0xb8>
        rte_mepc -= 2;
    48e8:	00268713          	add	a4,a3,2
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    48ec:	34171073          	csrw	mepc,a4
    // update return address
    neorv32_cpu_csr_write(CSR_MEPC, rte_mepc);
  }

  // restore context
  asm volatile (
    48f0:	4092                	lw	ra,4(sp)
    48f2:	41b2                	lw	gp,12(sp)
    48f4:	4242                	lw	tp,16(sp)
    48f6:	42d2                	lw	t0,20(sp)
    48f8:	4362                	lw	t1,24(sp)
    48fa:	43f2                	lw	t2,28(sp)
    48fc:	5402                	lw	s0,32(sp)
    48fe:	5492                	lw	s1,36(sp)
    4900:	5522                	lw	a0,40(sp)
    4902:	55b2                	lw	a1,44(sp)
    4904:	5642                	lw	a2,48(sp)
    4906:	56d2                	lw	a3,52(sp)
    4908:	5762                	lw	a4,56(sp)
    490a:	57f2                	lw	a5,60(sp)
    490c:	4806                	lw	a6,64(sp)
    490e:	4896                	lw	a7,68(sp)
    4910:	4926                	lw	s2,72(sp)
    4912:	49b6                	lw	s3,76(sp)
    4914:	4a46                	lw	s4,80(sp)
    4916:	4ad6                	lw	s5,84(sp)
    4918:	4b66                	lw	s6,88(sp)
    491a:	4bf6                	lw	s7,92(sp)
    491c:	5c06                	lw	s8,96(sp)
    491e:	5c96                	lw	s9,100(sp)
    4920:	5d26                	lw	s10,104(sp)
    4922:	5db6                	lw	s11,108(sp)
    4924:	5e46                	lw	t3,112(sp)
    4926:	5ed6                	lw	t4,116(sp)
    4928:	5f66                	lw	t5,120(sp)
    492a:	5ff6                	lw	t6,124(sp)
    492c:	4122                	lw	sp,8(sp)
    492e:	30200073          	mret
    case TRAP_CODE_MENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MENV_CALL];    break;
    4932:	800007b7          	lui	a5,0x80000
    4936:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    493a:	53dc                	lw	a5,36(a5)
  if (handler_base != 0) {
    493c:	d3c9                	beqz	a5,48be <neorv32_rte_core+0x8a>
    493e:	bfbd                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_I_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_MISALIGNED]; break;
    4940:	800007b7          	lui	a5,0x80000
    4944:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4948:	479c                	lw	a5,8(a5)
  if (handler_base != 0) {
    494a:	dbb5                	beqz	a5,48be <neorv32_rte_core+0x8a>
    494c:	bf85                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_I_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ACCESS];     break;
    494e:	800007b7          	lui	a5,0x80000
    4952:	5ac7a783          	lw	a5,1452(a5) # 800005ac <__neorv32_rte_vector_lut>
  if (handler_base != 0) {
    4956:	d7a5                	beqz	a5,48be <neorv32_rte_core+0x8a>
    4958:	b795                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_I_ILLEGAL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ILLEGAL];    break;
    495a:	800007b7          	lui	a5,0x80000
    495e:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4962:	43dc                	lw	a5,4(a5)
  if (handler_base != 0) {
    4964:	dfa9                	beqz	a5,48be <neorv32_rte_core+0x8a>
    4966:	bf99                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_BREAKPOINT:   handler_base = __neorv32_rte_vector_lut[RTE_TRAP_BREAKPOINT];   break;
    4968:	800007b7          	lui	a5,0x80000
    496c:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4970:	47dc                	lw	a5,12(a5)
  if (handler_base != 0) {
    4972:	d7b1                	beqz	a5,48be <neorv32_rte_core+0x8a>
    4974:	b7a1                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_L_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_MISALIGNED]; break;
    4976:	800007b7          	lui	a5,0x80000
    497a:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    497e:	4b9c                	lw	a5,16(a5)
  if (handler_base != 0) {
    4980:	df9d                	beqz	a5,48be <neorv32_rte_core+0x8a>
    4982:	bf2d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_L_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_ACCESS];     break;
    4984:	800007b7          	lui	a5,0x80000
    4988:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    498c:	4bdc                	lw	a5,20(a5)
  if (handler_base != 0) {
    498e:	db85                	beqz	a5,48be <neorv32_rte_core+0x8a>
    4990:	b735                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_S_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_MISALIGNED]; break;
    4992:	800007b7          	lui	a5,0x80000
    4996:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    499a:	4f9c                	lw	a5,24(a5)
  if (handler_base != 0) {
    499c:	d38d                	beqz	a5,48be <neorv32_rte_core+0x8a>
    499e:	bf39                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_S_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_ACCESS];     break;
    49a0:	800007b7          	lui	a5,0x80000
    49a4:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    49a8:	4fdc                	lw	a5,28(a5)
  if (handler_base != 0) {
    49aa:	db91                	beqz	a5,48be <neorv32_rte_core+0x8a>
    49ac:	bf01                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_UENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_UENV_CALL];    break;
    49ae:	800007b7          	lui	a5,0x80000
    49b2:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    49b6:	539c                	lw	a5,32(a5)
  if (handler_base != 0) {
    49b8:	d399                	beqz	a5,48be <neorv32_rte_core+0x8a>
    49ba:	b709                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_MSI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MSI];          break;
    49bc:	800007b7          	lui	a5,0x80000
    49c0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    49c4:	579c                	lw	a5,40(a5)
  if (handler_base != 0) {
    49c6:	ee078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    49ca:	bdcd                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_MEI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MEI];          break;
    49cc:	800007b7          	lui	a5,0x80000
    49d0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    49d4:	5b9c                	lw	a5,48(a5)
  if (handler_base != 0) {
    49d6:	ee0784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    49da:	b5cd                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_MTI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MTI];          break;
    49dc:	800007b7          	lui	a5,0x80000
    49e0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    49e4:	57dc                	lw	a5,44(a5)
  if (handler_base != 0) {
    49e6:	ec078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    49ea:	bdc9                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    49ec:	800007b7          	lui	a5,0x80000
    49f0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    49f4:	53bc                	lw	a5,96(a5)
  if (handler_base != 0) {
    49f6:	ec0784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    49fa:	b5c9                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_10:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_10];      break;
    49fc:	800007b7          	lui	a5,0x80000
    4a00:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a04:	4ffc                	lw	a5,92(a5)
  if (handler_base != 0) {
    4a06:	ea078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a0a:	bd4d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_9:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_9];       break;
    4a0c:	800007b7          	lui	a5,0x80000
    4a10:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a14:	4fbc                	lw	a5,88(a5)
  if (handler_base != 0) {
    4a16:	ea0784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a1a:	b54d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_8:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_8];       break;
    4a1c:	800007b7          	lui	a5,0x80000
    4a20:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a24:	4bfc                	lw	a5,84(a5)
  if (handler_base != 0) {
    4a26:	e8078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a2a:	bd49                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_7:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_7];       break;
    4a2c:	800007b7          	lui	a5,0x80000
    4a30:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a34:	4bbc                	lw	a5,80(a5)
  if (handler_base != 0) {
    4a36:	e80784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a3a:	b549                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_6:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_6];       break;
    4a3c:	800007b7          	lui	a5,0x80000
    4a40:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a44:	47fc                	lw	a5,76(a5)
  if (handler_base != 0) {
    4a46:	e6078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a4a:	bd8d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_5:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_5];       break;
    4a4c:	800007b7          	lui	a5,0x80000
    4a50:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a54:	47bc                	lw	a5,72(a5)
  if (handler_base != 0) {
    4a56:	e60784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a5a:	b58d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_4:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_4];       break;
    4a5c:	800007b7          	lui	a5,0x80000
    4a60:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a64:	43fc                	lw	a5,68(a5)
  if (handler_base != 0) {
    4a66:	e4078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a6a:	bd89                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    4a6c:	800007b7          	lui	a5,0x80000
    4a70:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a74:	5bbc                	lw	a5,112(a5)
  if (handler_base != 0) {
    4a76:	e40784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a7a:	b589                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    4a7c:	800007b7          	lui	a5,0x80000
    4a80:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a84:	57fc                	lw	a5,108(a5)
  if (handler_base != 0) {
    4a86:	e2078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a8a:	bd0d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    4a8c:	800007b7          	lui	a5,0x80000
    4a90:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4a94:	57bc                	lw	a5,104(a5)
  if (handler_base != 0) {
    4a96:	e20784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4a9a:	b50d                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    4a9c:	800007b7          	lui	a5,0x80000
    4aa0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4aa4:	53fc                	lw	a5,100(a5)
  if (handler_base != 0) {
    4aa6:	e0078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4aaa:	bd09                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_3:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_3];       break;
    4aac:	800007b7          	lui	a5,0x80000
    4ab0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4ab4:	43bc                	lw	a5,64(a5)
  if (handler_base != 0) {
    4ab6:	e00784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4aba:	b509                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_2:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_2];       break;
    4abc:	800007b7          	lui	a5,0x80000
    4ac0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4ac4:	5fdc                	lw	a5,60(a5)
  if (handler_base != 0) {
    4ac6:	de078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4aca:	bbcd                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_1:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_1];       break;
    4acc:	800007b7          	lui	a5,0x80000
    4ad0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4ad4:	5f9c                	lw	a5,56(a5)
  if (handler_base != 0) {
    4ad6:	de0784e3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4ada:	b3cd                	j	48bc <neorv32_rte_core+0x88>
    case TRAP_CODE_FIRQ_0:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_0];       break;
    4adc:	800007b7          	lui	a5,0x80000
    4ae0:	5ac78793          	add	a5,a5,1452 # 800005ac <__neorv32_rte_vector_lut>
    4ae4:	5bdc                	lw	a5,52(a5)
  if (handler_base != 0) {
    4ae6:	dc078ce3          	beqz	a5,48be <neorv32_rte_core+0x8a>
    4aea:	bbc9                	j	48bc <neorv32_rte_core+0x88>

00004aec <neorv32_rte_debug_handler>:
 * Debug trap handler, printing information via UART0.
 *
 * @note This function operates on the RTE instance of the
 * core on which this function is executed.
 **************************************************************************/
void neorv32_rte_debug_handler(void) {
    4aec:	7139                	add	sp,sp,-64

  if (neorv32_uart0_available() == 0) {
    4aee:	fff50537          	lui	a0,0xfff50
void neorv32_rte_debug_handler(void) {
    4af2:	de06                	sw	ra,60(sp)
  if (neorv32_uart0_available() == 0) {
    4af4:	298d                	jal	4f66 <neorv32_uart_available>
    4af6:	e501                	bnez	a0,4afe <neorv32_rte_debug_handler+0x12>
    }
  }

  // outro
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
}
    4af8:	50f2                	lw	ra,60(sp)
    4afa:	6121                	add	sp,sp,64
    4afc:	8082                	ret
  neorv32_uart0_puts("<NEORV32-RTE> ");
    4afe:	65a9                	lui	a1,0xa
    4b00:	e5c58593          	add	a1,a1,-420 # 9e5c <__fini_array_end+0x7e8>
    4b04:	fff50537          	lui	a0,0xfff50
    4b08:	dc22                	sw	s0,56(sp)
    4b0a:	da26                	sw	s1,52(sp)
    4b0c:	d84a                	sw	s2,48(sp)
    4b0e:	d64e                	sw	s3,44(sp)
    4b10:	29f5                	jal	500c <neorv32_uart_puts>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    4b12:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) & 1) {
    4b16:	8b85                	and	a5,a5,1
    4b18:	c3a1                	beqz	a5,4b58 <neorv32_rte_debug_handler+0x6c>
    neorv32_uart0_puts("[cpu1|");
    4b1a:	65a9                	lui	a1,0xa
    4b1c:	e6c58593          	add	a1,a1,-404 # 9e6c <__fini_array_end+0x7f8>
    4b20:	fff50537          	lui	a0,0xfff50
    4b24:	21e5                	jal	500c <neorv32_uart_puts>
    4b26:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
    4b2a:	00b7d713          	srl	a4,a5,0xb
    4b2e:	8b0d                	and	a4,a4,3
    4b30:	c321                	beqz	a4,4b70 <neorv32_rte_debug_handler+0x84>
    neorv32_uart0_puts("M] "); // machine-mode
    4b32:	65a9                	lui	a1,0xa
    4b34:	e7c58593          	add	a1,a1,-388 # 9e7c <__fini_array_end+0x808>
    4b38:	fff50537          	lui	a0,0xfff50
    4b3c:	29c1                	jal	500c <neorv32_uart_puts>
    4b3e:	342024f3          	csrr	s1,mcause
  switch (trap_cause) {
    4b42:	47ad                	li	a5,11
    4b44:	0497e163          	bltu	a5,s1,4b86 <neorv32_rte_debug_handler+0x9a>
    4b48:	6729                	lui	a4,0xa
    4b4a:	00249793          	sll	a5,s1,0x2
    4b4e:	36c70713          	add	a4,a4,876 # a36c <intpat+0x2d0>
    4b52:	97ba                	add	a5,a5,a4
    4b54:	439c                	lw	a5,0(a5)
    4b56:	8782                	jr	a5
    neorv32_uart0_puts("[cpu0|");
    4b58:	65a9                	lui	a1,0xa
    4b5a:	e7458593          	add	a1,a1,-396 # 9e74 <__fini_array_end+0x800>
    4b5e:	fff50537          	lui	a0,0xfff50
    4b62:	216d                	jal	500c <neorv32_uart_puts>
    4b64:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
    4b68:	00b7d713          	srl	a4,a5,0xb
    4b6c:	8b0d                	and	a4,a4,3
    4b6e:	f371                	bnez	a4,4b32 <neorv32_rte_debug_handler+0x46>
    neorv32_uart0_puts("U] "); // user-mode
    4b70:	65a9                	lui	a1,0xa
    4b72:	e8058593          	add	a1,a1,-384 # 9e80 <__fini_array_end+0x80c>
    4b76:	fff50537          	lui	a0,0xfff50
    4b7a:	2949                	jal	500c <neorv32_uart_puts>
    4b7c:	342024f3          	csrr	s1,mcause
  switch (trap_cause) {
    4b80:	47ad                	li	a5,11
    4b82:	fc97f3e3          	bgeu	a5,s1,4b48 <neorv32_rte_debug_handler+0x5c>
    4b86:	800007b7          	lui	a5,0x80000
    4b8a:	07ad                	add	a5,a5,11 # 8000000b <__malloc_av_+0xb>
    4b8c:	38f48163          	beq	s1,a5,4f0e <neorv32_rte_debug_handler+0x422>
    4b90:	3097e263          	bltu	a5,s1,4e94 <neorv32_rte_debug_handler+0x3a8>
    4b94:	800007b7          	lui	a5,0x80000
    4b98:	078d                	add	a5,a5,3 # 80000003 <__malloc_av_+0x3>
    4b9a:	14f48063          	beq	s1,a5,4cda <neorv32_rte_debug_handler+0x1ee>
    4b9e:	800007b7          	lui	a5,0x80000
    4ba2:	079d                	add	a5,a5,7 # 80000007 <__malloc_av_+0x7>
    4ba4:	1cf49b63          	bne	s1,a5,4d7a <neorv32_rte_debug_handler+0x28e>
    case TRAP_CODE_MTI:          neorv32_uart0_puts("Machine timer IRQ"); break;
    4ba8:	65a9                	lui	a1,0xa
    4baa:	fa058593          	add	a1,a1,-96 # 9fa0 <__fini_array_end+0x92c>
    4bae:	fff50537          	lui	a0,0xfff50
    4bb2:	6429                	lui	s0,0xa
    4bb4:	29a1                	jal	500c <neorv32_uart_puts>
    4bb6:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
  neorv32_uart0_puts(" @ PC=");
    4bba:	65a9                	lui	a1,0xa
    4bbc:	fec58593          	add	a1,a1,-20 # 9fec <__fini_array_end+0x978>
    4bc0:	fff50537          	lui	a0,0xfff50
    4bc4:	21a1                	jal	500c <neorv32_uart_puts>
    4bc6:	341029f3          	csrr	s3,mepc
 * @param[in] digits Number of hexadecimal digits to print (0..8).
 **************************************************************************/
void __neorv32_rte_print_hex(uint32_t num, int digits) {

  int i = 0;
  const char hex_symbols[] = "0123456789ABCDEF";
    4bca:	400c                	lw	a1,0(s0)
    4bcc:	4050                	lw	a2,4(s0)
    4bce:	4414                	lw	a3,8(s0)
    4bd0:	4458                	lw	a4,12(s0)
    4bd2:	01044783          	lbu	a5,16(s0)

  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4bd6:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4bda:	c62e                	sw	a1,12(sp)
    4bdc:	c832                	sw	a2,16(sp)
    4bde:	ca36                	sw	a3,20(sp)
    4be0:	cc3a                	sw	a4,24(sp)
    4be2:	00f10e23          	sb	a5,28(sp)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4be6:	2641                	jal	4f66 <neorv32_uart_available>
    4be8:	26051963          	bnez	a0,4e5a <neorv32_rte_debug_handler+0x36e>
  neorv32_uart0_puts(", MTINST=");
    4bec:	65a9                	lui	a1,0xa
    4bee:	ff458593          	add	a1,a1,-12 # 9ff4 <__fini_array_end+0x980>
    4bf2:	fff50537          	lui	a0,0xfff50
    4bf6:	2919                	jal	500c <neorv32_uart_puts>
    4bf8:	34a029f3          	csrr	s3,0x34a
  const char hex_symbols[] = "0123456789ABCDEF";
    4bfc:	400c                	lw	a1,0(s0)
    4bfe:	4050                	lw	a2,4(s0)
    4c00:	4414                	lw	a3,8(s0)
    4c02:	4458                	lw	a4,12(s0)
    4c04:	01044783          	lbu	a5,16(s0)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4c08:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4c0c:	c62e                	sw	a1,12(sp)
    4c0e:	c832                	sw	a2,16(sp)
    4c10:	ca36                	sw	a3,20(sp)
    4c12:	cc3a                	sw	a4,24(sp)
    4c14:	00f10e23          	sb	a5,28(sp)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4c18:	26b9                	jal	4f66 <neorv32_uart_available>
    4c1a:	20051363          	bnez	a0,4e20 <neorv32_rte_debug_handler+0x334>
  neorv32_uart0_puts(", MTVAL=");
    4c1e:	65a9                	lui	a1,0xa
    4c20:	00058593          	mv	a1,a1
    4c24:	fff50537          	lui	a0,0xfff50
    4c28:	26d5                	jal	500c <neorv32_uart_puts>
    4c2a:	34302973          	csrr	s2,mtval
  const char hex_symbols[] = "0123456789ABCDEF";
    4c2e:	400c                	lw	a1,0(s0)
    4c30:	4050                	lw	a2,4(s0)
    4c32:	4414                	lw	a3,8(s0)
    4c34:	4458                	lw	a4,12(s0)
    4c36:	01044783          	lbu	a5,16(s0)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4c3a:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4c3e:	c62e                	sw	a1,12(sp)
    4c40:	c832                	sw	a2,16(sp)
    4c42:	ca36                	sw	a3,20(sp)
    4c44:	cc3a                	sw	a4,24(sp)
    4c46:	00f10e23          	sb	a5,28(sp)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4c4a:	2e31                	jal	4f66 <neorv32_uart_available>
    4c4c:	e505                	bnez	a0,4c74 <neorv32_rte_debug_handler+0x188>
  if (((int32_t)trap_cause) < 0) { // is interrupt
    4c4e:	0404cf63          	bltz	s1,4cac <neorv32_rte_debug_handler+0x1c0>
  if ((trap_cause == TRAP_CODE_I_ACCESS) || (trap_cause == TRAP_CODE_I_MISALIGNED)) {
    4c52:	4785                	li	a5,1
    4c54:	0697e763          	bltu	a5,s1,4cc2 <neorv32_rte_debug_handler+0x1d6>
    neorv32_uart0_puts(" !!FATAL EXCEPTION!! Halting CPU </NEORV32-RTE>\n");
    4c58:	65a9                	lui	a1,0xa
    4c5a:	02458593          	add	a1,a1,36 # a024 <__fini_array_end+0x9b0>
    4c5e:	fff50537          	lui	a0,0xfff50
    4c62:	266d                	jal	500c <neorv32_uart_puts>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    4c64:	4781                	li	a5,0
    4c66:	30479073          	csrw	mie,a5
      asm volatile ("wfi");
    4c6a:	10500073          	wfi
    4c6e:	10500073          	wfi
    while(1) {
    4c72:	bfe5                	j	4c6a <neorv32_rte_debug_handler+0x17e>
    neorv32_uart0_putc('0');
    4c74:	03000593          	li	a1,48
    4c78:	fff50537          	lui	a0,0xfff50
    4c7c:	2e85                	jal	4fec <neorv32_uart_putc>
    neorv32_uart0_putc('x');
    4c7e:	07800593          	li	a1,120
    4c82:	fff50537          	lui	a0,0xfff50
    4c86:	269d                	jal	4fec <neorv32_uart_putc>
    4c88:	4471                	li	s0,28

    for (i=(digits-8); i<8; i++) {
    4c8a:	59f1                	li	s3,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
    4c8c:	008957b3          	srl	a5,s2,s0
    4c90:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
    4c92:	02078793          	add	a5,a5,32
    4c96:	978a                	add	a5,a5,sp
    4c98:	fec7c583          	lbu	a1,-20(a5)
    4c9c:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
    4ca0:	1471                	add	s0,s0,-4
      neorv32_uart0_putc(hex_symbols[index]);
    4ca2:	26a9                	jal	4fec <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
    4ca4:	ff3414e3          	bne	s0,s3,4c8c <neorv32_rte_debug_handler+0x1a0>
  if (((int32_t)trap_cause) < 0) { // is interrupt
    4ca8:	fa04d5e3          	bgez	s1,4c52 <neorv32_rte_debug_handler+0x166>
    neorv32_uart0_puts(" Disabling IRQ source");
    4cac:	65a9                	lui	a1,0xa
    4cae:	00c58593          	add	a1,a1,12 # a00c <__fini_array_end+0x998>
    4cb2:	fff50537          	lui	a0,0xfff50
    4cb6:	2e99                	jal	500c <neorv32_uart_puts>
    neorv32_cpu_csr_clr(CSR_MIE, 1 << (trap_cause & 0x1f));
    4cb8:	4785                	li	a5,1
    4cba:	009797b3          	sll	a5,a5,s1
 * @param[in] mask Bit mask (high-active) to clear bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrc %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    4cbe:	3047b073          	csrc	mie,a5
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    4cc2:	5462                	lw	s0,56(sp)
    4cc4:	54d2                	lw	s1,52(sp)
    4cc6:	5942                	lw	s2,48(sp)
    4cc8:	59b2                	lw	s3,44(sp)
}
    4cca:	50f2                	lw	ra,60(sp)
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    4ccc:	65a9                	lui	a1,0xa
    4cce:	04458593          	add	a1,a1,68 # a044 <__fini_array_end+0x9d0>
    4cd2:	fff50537          	lui	a0,0xfff50
}
    4cd6:	6121                	add	sp,sp,64
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    4cd8:	ae15                	j	500c <neorv32_uart_puts>
    case TRAP_CODE_MSI:          neorv32_uart0_puts("Machine software IRQ"); break;
    4cda:	65a9                	lui	a1,0xa
    4cdc:	f8858593          	add	a1,a1,-120 # 9f88 <__fini_array_end+0x914>
    4ce0:	fff50537          	lui	a0,0xfff50
    4ce4:	6429                	lui	s0,0xa
    4ce6:	261d                	jal	500c <neorv32_uart_puts>
    4ce8:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4cec:	b5f9                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_MENV_CALL:    neorv32_uart0_puts("Environment call from M-mode"); break;
    4cee:	65a9                	lui	a1,0xa
    4cf0:	f6858593          	add	a1,a1,-152 # 9f68 <__fini_array_end+0x8f4>
    4cf4:	fff50537          	lui	a0,0xfff50
    4cf8:	6429                	lui	s0,0xa
    4cfa:	2e09                	jal	500c <neorv32_uart_puts>
    4cfc:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d00:	bd6d                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_S_ACCESS:     neorv32_uart0_puts("Store access fault"); break;
    4d02:	65a9                	lui	a1,0xa
    4d04:	f3458593          	add	a1,a1,-204 # 9f34 <__fini_array_end+0x8c0>
    4d08:	fff50537          	lui	a0,0xfff50
    4d0c:	6429                	lui	s0,0xa
    4d0e:	2cfd                	jal	500c <neorv32_uart_puts>
    4d10:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d14:	b55d                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_UENV_CALL:    neorv32_uart0_puts("Environment call from U-mode"); break;
    4d16:	65a9                	lui	a1,0xa
    4d18:	f4858593          	add	a1,a1,-184 # 9f48 <__fini_array_end+0x8d4>
    4d1c:	fff50537          	lui	a0,0xfff50
    4d20:	6429                	lui	s0,0xa
    4d22:	24ed                	jal	500c <neorv32_uart_puts>
    4d24:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d28:	bd49                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_BREAKPOINT:   neorv32_uart0_puts("Environment breakpoint"); break;
    4d2a:	65a9                	lui	a1,0xa
    4d2c:	ed458593          	add	a1,a1,-300 # 9ed4 <__fini_array_end+0x860>
    4d30:	fff50537          	lui	a0,0xfff50
    4d34:	6429                	lui	s0,0xa
    4d36:	2cd9                	jal	500c <neorv32_uart_puts>
    4d38:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d3c:	bdbd                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_L_MISALIGNED: neorv32_uart0_puts("Load address misaligned"); break;
    4d3e:	65a9                	lui	a1,0xa
    4d40:	eec58593          	add	a1,a1,-276 # 9eec <__fini_array_end+0x878>
    4d44:	fff50537          	lui	a0,0xfff50
    4d48:	6429                	lui	s0,0xa
    4d4a:	24c9                	jal	500c <neorv32_uart_puts>
    4d4c:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d50:	b5ad                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_L_ACCESS:     neorv32_uart0_puts("Load access fault"); break;
    4d52:	65a9                	lui	a1,0xa
    4d54:	f0458593          	add	a1,a1,-252 # 9f04 <__fini_array_end+0x890>
    4d58:	fff50537          	lui	a0,0xfff50
    4d5c:	6429                	lui	s0,0xa
    4d5e:	247d                	jal	500c <neorv32_uart_puts>
    4d60:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d64:	bd99                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_S_MISALIGNED: neorv32_uart0_puts("Store address misaligned"); break;
    4d66:	65a9                	lui	a1,0xa
    4d68:	f1858593          	add	a1,a1,-232 # 9f18 <__fini_array_end+0x8a4>
    4d6c:	fff50537          	lui	a0,0xfff50
    4d70:	6429                	lui	s0,0xa
    4d72:	2c69                	jal	500c <neorv32_uart_puts>
    4d74:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d78:	b589                	j	4bba <neorv32_rte_debug_handler+0xce>
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
    4d7a:	65a9                	lui	a1,0xa
    4d7c:	fd858593          	add	a1,a1,-40 # 9fd8 <__fini_array_end+0x964>
    4d80:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4d84:	6429                	lui	s0,0xa
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
    4d86:	2459                	jal	500c <neorv32_uart_puts>
  const char hex_symbols[] = "0123456789ABCDEF";
    4d88:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4d8c:	400c                	lw	a1,0(s0)
    4d8e:	4050                	lw	a2,4(s0)
    4d90:	4414                	lw	a3,8(s0)
    4d92:	4458                	lw	a4,12(s0)
    4d94:	01044783          	lbu	a5,16(s0)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4d98:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4d9c:	c62e                	sw	a1,12(sp)
    4d9e:	c832                	sw	a2,16(sp)
    4da0:	ca36                	sw	a3,20(sp)
    4da2:	cc3a                	sw	a4,24(sp)
    4da4:	00f10e23          	sb	a5,28(sp)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4da8:	2a7d                	jal	4f66 <neorv32_uart_available>
    4daa:	e00508e3          	beqz	a0,4bba <neorv32_rte_debug_handler+0xce>
    neorv32_uart0_putc('0');
    4dae:	03000593          	li	a1,48
    4db2:	fff50537          	lui	a0,0xfff50
    4db6:	2c1d                	jal	4fec <neorv32_uart_putc>
    neorv32_uart0_putc('x');
    4db8:	07800593          	li	a1,120
    4dbc:	fff50537          	lui	a0,0xfff50
    4dc0:	2435                	jal	4fec <neorv32_uart_putc>
    4dc2:	4971                	li	s2,28
    for (i=(digits-8); i<8; i++) {
    4dc4:	59f1                	li	s3,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
    4dc6:	0124d7b3          	srl	a5,s1,s2
    4dca:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
    4dcc:	02078793          	add	a5,a5,32
    4dd0:	978a                	add	a5,a5,sp
    4dd2:	fec7c583          	lbu	a1,-20(a5)
    4dd6:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
    4dda:	1971                	add	s2,s2,-4
      neorv32_uart0_putc(hex_symbols[index]);
    4ddc:	2c01                	jal	4fec <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
    4dde:	ff3914e3          	bne	s2,s3,4dc6 <neorv32_rte_debug_handler+0x2da>
    4de2:	bbe1                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_I_MISALIGNED: neorv32_uart0_puts("Instruction address misaligned"); break;
    4de4:	65a9                	lui	a1,0xa
    4de6:	eb458593          	add	a1,a1,-332 # 9eb4 <__fini_array_end+0x840>
    4dea:	fff50537          	lui	a0,0xfff50
    4dee:	6429                	lui	s0,0xa
    4df0:	2c31                	jal	500c <neorv32_uart_puts>
    4df2:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4df6:	b3d1                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_I_ACCESS:     neorv32_uart0_puts("Instruction access fault"); break;
    4df8:	65a9                	lui	a1,0xa
    4dfa:	e8458593          	add	a1,a1,-380 # 9e84 <__fini_array_end+0x810>
    4dfe:	fff50537          	lui	a0,0xfff50
    4e02:	6429                	lui	s0,0xa
    4e04:	2421                	jal	500c <neorv32_uart_puts>
    4e06:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4e0a:	bb45                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
    4e0c:	65a9                	lui	a1,0xa
    4e0e:	ea058593          	add	a1,a1,-352 # 9ea0 <__fini_array_end+0x82c>
    4e12:	fff50537          	lui	a0,0xfff50
    4e16:	6429                	lui	s0,0xa
    4e18:	2ad5                	jal	500c <neorv32_uart_puts>
    4e1a:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4e1e:	bb71                	j	4bba <neorv32_rte_debug_handler+0xce>
    neorv32_uart0_putc('0');
    4e20:	03000593          	li	a1,48
    4e24:	fff50537          	lui	a0,0xfff50
    4e28:	d452                	sw	s4,40(sp)
    4e2a:	22c9                	jal	4fec <neorv32_uart_putc>
    neorv32_uart0_putc('x');
    4e2c:	07800593          	li	a1,120
    4e30:	fff50537          	lui	a0,0xfff50
    4e34:	2a65                	jal	4fec <neorv32_uart_putc>
    4e36:	4971                	li	s2,28
    for (i=(digits-8); i<8; i++) {
    4e38:	5a71                	li	s4,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
    4e3a:	0129d7b3          	srl	a5,s3,s2
    4e3e:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
    4e40:	02078793          	add	a5,a5,32
    4e44:	978a                	add	a5,a5,sp
    4e46:	fec7c583          	lbu	a1,-20(a5)
    4e4a:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
    4e4e:	1971                	add	s2,s2,-4
      neorv32_uart0_putc(hex_symbols[index]);
    4e50:	2a71                	jal	4fec <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
    4e52:	ff4914e3          	bne	s2,s4,4e3a <neorv32_rte_debug_handler+0x34e>
    4e56:	5a22                	lw	s4,40(sp)
    4e58:	b3d9                	j	4c1e <neorv32_rte_debug_handler+0x132>
    neorv32_uart0_putc('0');
    4e5a:	03000593          	li	a1,48
    4e5e:	fff50537          	lui	a0,0xfff50
    4e62:	d452                	sw	s4,40(sp)
    4e64:	2261                	jal	4fec <neorv32_uart_putc>
    neorv32_uart0_putc('x');
    4e66:	07800593          	li	a1,120
    4e6a:	fff50537          	lui	a0,0xfff50
    4e6e:	2abd                	jal	4fec <neorv32_uart_putc>
    4e70:	4971                	li	s2,28
    for (i=(digits-8); i<8; i++) {
    4e72:	5a71                	li	s4,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
    4e74:	0129d7b3          	srl	a5,s3,s2
    4e78:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
    4e7a:	02078793          	add	a5,a5,32
    4e7e:	978a                	add	a5,a5,sp
    4e80:	fec7c583          	lbu	a1,-20(a5)
    4e84:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
    4e88:	1971                	add	s2,s2,-4
      neorv32_uart0_putc(hex_symbols[index]);
    4e8a:	228d                	jal	4fec <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
    4e8c:	ff4914e3          	bne	s2,s4,4e74 <neorv32_rte_debug_handler+0x388>
    4e90:	5a22                	lw	s4,40(sp)
    4e92:	bba9                	j	4bec <neorv32_rte_debug_handler+0x100>
  switch (trap_cause) {
    4e94:	800007b7          	lui	a5,0x80000
    4e98:	17c1                	add	a5,a5,-16 # 7ffffff0 <__neorv32_rom_size+0x7ffefff0>
    4e9a:	97a6                	add	a5,a5,s1
    4e9c:	473d                	li	a4,15
    4e9e:	ecf76ee3          	bltu	a4,a5,4d7a <neorv32_rte_debug_handler+0x28e>
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex(trap_cause, 1); break;
    4ea2:	65a9                	lui	a1,0xa
    4ea4:	fcc58593          	add	a1,a1,-52 # 9fcc <__fini_array_end+0x958>
    4ea8:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4eac:	6429                	lui	s0,0xa
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex(trap_cause, 1); break;
    4eae:	2ab9                	jal	500c <neorv32_uart_puts>
  const char hex_symbols[] = "0123456789ABCDEF";
    4eb0:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4eb4:	400c                	lw	a1,0(s0)
    4eb6:	4050                	lw	a2,4(s0)
    4eb8:	4414                	lw	a3,8(s0)
    4eba:	4458                	lw	a4,12(s0)
    4ebc:	01044783          	lbu	a5,16(s0)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4ec0:	fff50537          	lui	a0,0xfff50
  const char hex_symbols[] = "0123456789ABCDEF";
    4ec4:	c62e                	sw	a1,12(sp)
    4ec6:	c832                	sw	a2,16(sp)
    4ec8:	ca36                	sw	a3,20(sp)
    4eca:	cc3a                	sw	a4,24(sp)
    4ecc:	00f10e23          	sb	a5,28(sp)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    4ed0:	2859                	jal	4f66 <neorv32_uart_available>
    4ed2:	ce0504e3          	beqz	a0,4bba <neorv32_rte_debug_handler+0xce>
    neorv32_uart0_putc('0');
    4ed6:	03000593          	li	a1,48
    4eda:	fff50537          	lui	a0,0xfff50
    4ede:	2239                	jal	4fec <neorv32_uart_putc>
    neorv32_uart0_putc('x');
    4ee0:	07800593          	li	a1,120
    4ee4:	fff50537          	lui	a0,0xfff50
    4ee8:	2211                	jal	4fec <neorv32_uart_putc>
    4eea:	03800913          	li	s2,56
    for (i=(digits-8); i<8; i++) {
    4eee:	59f1                	li	s3,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
    4ef0:	0124d7b3          	srl	a5,s1,s2
    4ef4:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
    4ef6:	02078793          	add	a5,a5,32
    4efa:	978a                	add	a5,a5,sp
    4efc:	fec7c583          	lbu	a1,-20(a5)
    4f00:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
    4f04:	1971                	add	s2,s2,-4
      neorv32_uart0_putc(hex_symbols[index]);
    4f06:	20dd                	jal	4fec <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
    4f08:	ff3914e3          	bne	s2,s3,4ef0 <neorv32_rte_debug_handler+0x404>
    4f0c:	b17d                	j	4bba <neorv32_rte_debug_handler+0xce>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
    4f0e:	65a9                	lui	a1,0xa
    4f10:	fb458593          	add	a1,a1,-76 # 9fb4 <__fini_array_end+0x940>
    4f14:	fff50537          	lui	a0,0xfff50
    4f18:	6429                	lui	s0,0xa
    4f1a:	28cd                	jal	500c <neorv32_uart_puts>
    4f1c:	05840413          	add	s0,s0,88 # a058 <__fini_array_end+0x9e4>
    4f20:	b969                	j	4bba <neorv32_rte_debug_handler+0xce>

00004f22 <neorv32_rte_setup>:
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    4f22:	6789                	lui	a5,0x2
    4f24:	80078793          	add	a5,a5,-2048 # 1800 <core_init_matrix+0x26>
    4f28:	30079073          	csrw	mstatus,a5
    4f2c:	6795                	lui	a5,0x5
    4f2e:	83478793          	add	a5,a5,-1996 # 4834 <neorv32_rte_core>
    4f32:	30579073          	csrw	mtvec,a5
    4f36:	4781                	li	a5,0
    4f38:	30479073          	csrw	mie,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    4f3c:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) == 0) {
    4f40:	e395                	bnez	a5,4f64 <neorv32_rte_setup+0x42>
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
    4f42:	6615                	lui	a2,0x5
    4f44:	800006b7          	lui	a3,0x80000
    4f48:	aec60613          	add	a2,a2,-1300 # 4aec <neorv32_rte_debug_handler>
    4f4c:	5ac68693          	add	a3,a3,1452 # 800005ac <__neorv32_rte_vector_lut>
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
    4f50:	45f5                	li	a1,29
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
    4f52:	00279713          	sll	a4,a5,0x2
    4f56:	9736                	add	a4,a4,a3
    4f58:	c310                	sw	a2,0(a4)
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
    4f5a:	0785                	add	a5,a5,1
    4f5c:	feb79be3          	bne	a5,a1,4f52 <neorv32_rte_setup+0x30>
    asm volatile ("fence"); // flush handler table to main memory
    4f60:	0ff0000f          	fence
}
    4f64:	8082                	ret

00004f66 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
    4f66:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
    4f6a:	87aa                	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
    4f6c:	00e50e63          	beq	a0,a4,4f88 <neorv32_uart_available+0x22>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
  }
  else if (UARTx == NEORV32_UART1) {
    4f70:	fff60737          	lui	a4,0xfff60
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
  }
  else {
    return 0;
    4f74:	4501                	li	a0,0
  else if (UARTx == NEORV32_UART1) {
    4f76:	00e78363          	beq	a5,a4,4f7c <neorv32_uart_available+0x16>
  }
}
    4f7a:	8082                	ret
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    4f7c:	7781                	lui	a5,0xfffe0
    4f7e:	4788                	lw	a0,8(a5)
    4f80:	020007b7          	lui	a5,0x2000
    4f84:	8d7d                	and	a0,a0,a5
}
    4f86:	8082                	ret
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
    4f88:	7781                	lui	a5,0xfffe0
    4f8a:	4788                	lw	a0,8(a5)
    4f8c:	000207b7          	lui	a5,0x20
    4f90:	8d7d                	and	a0,a0,a5
    4f92:	8082                	ret

00004f94 <neorv32_uart_setup>:

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
    4f94:	00052023          	sw	zero,0(a0) # fff50000 <__crt0_ram_last+0x7ff4c001>
    4f98:	7781                	lui	a5,0xfffe0
    4f9a:	439c                	lw	a5,0(a5)

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
    4f9c:	0586                	sll	a1,a1,0x1
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
    4f9e:	3fe00713          	li	a4,1022
  baud_div = clock / (2*baudrate);
    4fa2:	02b7d7b3          	divu	a5,a5,a1
  while (baud_div >= 0x3ffU) {
    4fa6:	4681                	li	a3,0
    4fa8:	02f77363          	bgeu	a4,a5,4fce <neorv32_uart_setup+0x3a>
    4fac:	3fe00593          	li	a1,1022
    4fb0:	a029                	j	4fba <neorv32_uart_setup+0x26>
    if ((prsc_sel == 2) || (prsc_sel == 4))
      baud_div >>= 3;
    else
      baud_div >>= 1;
    4fb2:	8385                	srl	a5,a5,0x1
    prsc_sel++;
    4fb4:	0685                	add	a3,a3,1
  while (baud_div >= 0x3ffU) {
    4fb6:	00f5fa63          	bgeu	a1,a5,4fca <neorv32_uart_setup+0x36>
    if ((prsc_sel == 2) || (prsc_sel == 4))
    4fba:	ffe68713          	add	a4,a3,-2
    4fbe:	9b75                	and	a4,a4,-3
    4fc0:	fb6d                	bnez	a4,4fb2 <neorv32_uart_setup+0x1e>
      baud_div >>= 3;
    4fc2:	838d                	srl	a5,a5,0x3
    prsc_sel++;
    4fc4:	0685                	add	a3,a3,1
  while (baud_div >= 0x3ffU) {
    4fc6:	fef5eae3          	bltu	a1,a5,4fba <neorv32_uart_setup+0x26>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    4fca:	068e                	sll	a3,a3,0x3
    4fcc:	8ae1                	and	a3,a3,24
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    4fce:	17fd                	add	a5,a5,-1 # fffdffff <__crt0_ram_last+0x7ffdc000>
    4fd0:	6741                	lui	a4,0x10
    4fd2:	fc070713          	add	a4,a4,-64 # ffc0 <__crt0_copy_data_src_begin+0x5988>
    4fd6:	079a                	sll	a5,a5,0x6
    4fd8:	8ff9                	and	a5,a5,a4
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    4fda:	07c00737          	lui	a4,0x7c00
    4fde:	8e79                	and	a2,a2,a4
    4fe0:	8fd1                	or	a5,a5,a2
    4fe2:	8fd5                	or	a5,a5,a3
    4fe4:	0017e793          	or	a5,a5,1
  if (((uint32_t)UARTx) == NEORV32_UART1_BASE) {
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
    4fe8:	c11c                	sw	a5,0(a0)
}
    4fea:	8082                	ret

00004fec <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    4fec:	411c                	lw	a5,0(a0)
    4fee:	00a79713          	sll	a4,a5,0xa
    4ff2:	fe075de3          	bgez	a4,4fec <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    4ff6:	c14c                	sw	a1,4(a0)
}
    4ff8:	8082                	ret

00004ffa <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
    4ffa:	411c                	lw	a5,0(a0)
    4ffc:	00f79713          	sll	a4,a5,0xf
    5000:	fe075de3          	bgez	a4,4ffa <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
    5004:	4148                	lw	a0,4(a0)
}
    5006:	0ff57513          	zext.b	a0,a0
    500a:	8082                	ret

0000500c <neorv32_uart_puts>:
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {

  char c = 0;
  while ((c = *s++)) {
    500c:	0005c683          	lbu	a3,0(a1)
    5010:	00158613          	add	a2,a1,1
    5014:	ce99                	beqz	a3,5032 <neorv32_uart_puts+0x26>
    if (c == '\n') {
    5016:	45a9                	li	a1,10
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5018:	4835                	li	a6,13
    if (c == '\n') {
    501a:	00b68d63          	beq	a3,a1,5034 <neorv32_uart_puts+0x28>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    501e:	411c                	lw	a5,0(a0)
    5020:	00a79713          	sll	a4,a5,0xa
    5024:	fe075de3          	bgez	a4,501e <neorv32_uart_puts+0x12>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5028:	c154                	sw	a3,4(a0)
  while ((c = *s++)) {
    502a:	00064683          	lbu	a3,0(a2)
    502e:	0605                	add	a2,a2,1
    5030:	f6ed                	bnez	a3,501a <neorv32_uart_puts+0xe>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
    5032:	8082                	ret
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5034:	411c                	lw	a5,0(a0)
    5036:	00a79713          	sll	a4,a5,0xa
    503a:	fe075de3          	bgez	a4,5034 <neorv32_uart_puts+0x28>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    503e:	01052223          	sw	a6,4(a0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5042:	bff1                	j	501e <neorv32_uart_puts+0x12>

00005044 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
    5044:	711d                	add	sp,sp,-96
    5046:	ce86                	sw	ra,92(sp)
  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
  }

  while ((c = *format++)) {
    5048:	0005c703          	lbu	a4,0(a1)
    string_buf[i] = 0;
    504c:	c602                	sw	zero,12(sp)
    504e:	c802                	sw	zero,16(sp)
    5050:	ca02                	sw	zero,20(sp)
    5052:	cc02                	sw	zero,24(sp)
    5054:	ce02                	sw	zero,28(sp)
    5056:	d002                	sw	zero,32(sp)
    5058:	d202                	sw	zero,36(sp)
    505a:	d402                	sw	zero,40(sp)
    505c:	d602                	sw	zero,44(sp)
  while ((c = *format++)) {
    505e:	c749                	beqz	a4,50e8 <neorv32_uart_vprintf+0xa4>
    5060:	c8ca                	sw	s2,80(sp)
    5062:	c6ce                	sw	s3,76(sp)
    5064:	6929                	lui	s2,0xa
    5066:	69a9                	lui	s3,0xa
    5068:	cca2                	sw	s0,88(sp)
    506a:	caa6                	sw	s1,84(sp)
    506c:	c4d2                	sw	s4,72(sp)
    506e:	c2d6                	sw	s5,68(sp)
    5070:	8832                	mv	a6,a2
    5072:	c0da                	sw	s6,64(sp)
    5074:	de5e                	sw	s7,60(sp)
    5076:	842a                	mv	s0,a0
    5078:	00158613          	add	a2,a1,1
    507c:	02500493          	li	s1,37
    5080:	4aa9                	li	s5,10
    5082:	3f590913          	add	s2,s2,1013 # a3f5 <_ctype_+0x1>
    5086:	4a05                	li	s4,1
    5088:	39c98993          	add	s3,s3,924 # a39c <intpat+0x300>
    if (c == '%') {
    508c:	1e971c63          	bne	a4,s1,5284 <neorv32_uart_vprintf+0x240>
      c = tolower(*format++);
    5090:	0015c783          	lbu	a5,1(a1)
    5094:	00258b13          	add	s6,a1,2
    5098:	01278733          	add	a4,a5,s2
    509c:	00074703          	lbu	a4,0(a4) # 7c00000 <__neorv32_rom_size+0x7bf0000>
    50a0:	8b0d                	and	a4,a4,3
    50a2:	07470463          	beq	a4,s4,510a <neorv32_uart_vprintf+0xc6>
      switch (c) {
    50a6:	00978b63          	beq	a5,s1,50bc <neorv32_uart_vprintf+0x78>
    50aa:	f9d78713          	add	a4,a5,-99
    50ae:	46d5                	li	a3,21
    50b0:	02e6ef63          	bltu	a3,a4,50ee <neorv32_uart_vprintf+0xaa>
    50b4:	070a                	sll	a4,a4,0x2
    50b6:	974e                	add	a4,a4,s3
    50b8:	4318                	lw	a4,0(a4)
    50ba:	8702                	jr	a4
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    50bc:	401c                	lw	a5,0(s0)
    50be:	00a79713          	sll	a4,a5,0xa
    50c2:	fe075de3          	bgez	a4,50bc <neorv32_uart_vprintf+0x78>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    50c6:	02500793          	li	a5,37
    50ca:	c05c                	sw	a5,4(s0)
      c = tolower(*format++);
    50cc:	85da                	mv	a1,s6
  while ((c = *format++)) {
    50ce:	0005c703          	lbu	a4,0(a1)
    50d2:	00158613          	add	a2,a1,1
    50d6:	fb5d                	bnez	a4,508c <neorv32_uart_vprintf+0x48>
    50d8:	4466                	lw	s0,88(sp)
    50da:	44d6                	lw	s1,84(sp)
    50dc:	4946                	lw	s2,80(sp)
    50de:	49b6                	lw	s3,76(sp)
    50e0:	4a26                	lw	s4,72(sp)
    50e2:	4a96                	lw	s5,68(sp)
    50e4:	4b06                	lw	s6,64(sp)
    50e6:	5bf2                	lw	s7,60(sp)
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
    50e8:	40f6                	lw	ra,92(sp)
    50ea:	6125                	add	sp,sp,96
    50ec:	8082                	ret
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    50ee:	4018                	lw	a4,0(s0)
    50f0:	00a71693          	sll	a3,a4,0xa
    50f4:	fe06dde3          	bgez	a3,50ee <neorv32_uart_vprintf+0xaa>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    50f8:	02500713          	li	a4,37
    50fc:	c058                	sw	a4,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    50fe:	4018                	lw	a4,0(s0)
    5100:	00a71693          	sll	a3,a4,0xa
    5104:	fe06dde3          	bgez	a3,50fe <neorv32_uart_vprintf+0xba>
    5108:	b7c9                	j	50ca <neorv32_uart_vprintf+0x86>
      c = tolower(*format++);
    510a:	02078793          	add	a5,a5,32
    510e:	0ff7f793          	zext.b	a5,a5
    5112:	bf51                	j	50a6 <neorv32_uart_vprintf+0x62>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    5114:	00082583          	lw	a1,0(a6)
    5118:	4641                	li	a2,16
    511a:	0068                	add	a0,sp,12
    511c:	00480b93          	add	s7,a6,4
    5120:	c76ff0ef          	jal	4596 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
    5124:	0068                	add	a0,sp,12
    5126:	4c3000ef          	jal	5de8 <strlen>
          while (i--) { // add leading zeros
    512a:	469d                	li	a3,7
    512c:	47a1                	li	a5,8
    512e:	8e89                	sub	a3,a3,a0
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5130:	03000593          	li	a1,48
          while (i--) { // add leading zeros
    5134:	567d                	li	a2,-1
    5136:	00f50b63          	beq	a0,a5,514c <neorv32_uart_vprintf+0x108>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    513a:	401c                	lw	a5,0(s0)
    513c:	00a79713          	sll	a4,a5,0xa
    5140:	fe075de3          	bgez	a4,513a <neorv32_uart_vprintf+0xf6>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5144:	c04c                	sw	a1,4(s0)
          while (i--) { // add leading zeros
    5146:	16fd                	add	a3,a3,-1
    5148:	fec699e3          	bne	a3,a2,513a <neorv32_uart_vprintf+0xf6>
  while ((c = *s++)) {
    514c:	00c14683          	lbu	a3,12(sp)
    5150:	00d10613          	add	a2,sp,13
    if (c == '\n') {
    5154:	45a9                	li	a1,10
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5156:	4535                	li	a0,13
  while ((c = *s++)) {
    5158:	ce89                	beqz	a3,5172 <neorv32_uart_vprintf+0x12e>
    if (c == '\n') {
    515a:	00b68f63          	beq	a3,a1,5178 <neorv32_uart_vprintf+0x134>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    515e:	401c                	lw	a5,0(s0)
    5160:	00a79713          	sll	a4,a5,0xa
    5164:	fe075de3          	bgez	a4,515e <neorv32_uart_vprintf+0x11a>
  while ((c = *s++)) {
    5168:	0605                	add	a2,a2,1
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    516a:	c054                	sw	a3,4(s0)
  while ((c = *s++)) {
    516c:	fff64683          	lbu	a3,-1(a2)
    5170:	f6ed                	bnez	a3,515a <neorv32_uart_vprintf+0x116>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    5172:	885e                	mv	a6,s7
      c = tolower(*format++);
    5174:	85da                	mv	a1,s6
    5176:	bfa1                	j	50ce <neorv32_uart_vprintf+0x8a>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5178:	401c                	lw	a5,0(s0)
    517a:	00a79713          	sll	a4,a5,0xa
    517e:	fe075de3          	bgez	a4,5178 <neorv32_uart_vprintf+0x134>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5182:	c048                	sw	a0,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5184:	bfe9                	j	515e <neorv32_uart_vprintf+0x11a>
          n = (int32_t)va_arg(args, int32_t);
    5186:	00082583          	lw	a1,0(a6)
    518a:	00480b93          	add	s7,a6,4
          if (n < 0) {
    518e:	1005cd63          	bltz	a1,52a8 <neorv32_uart_vprintf+0x264>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
    5192:	4629                	li	a2,10
    5194:	0068                	add	a0,sp,12
    5196:	c00ff0ef          	jal	4596 <neorv32_aux_itoa>
  while ((c = *s++)) {
    519a:	00c14683          	lbu	a3,12(sp)
          n = (int32_t)va_arg(args, int32_t);
    519e:	885e                	mv	a6,s7
      c = tolower(*format++);
    51a0:	85da                	mv	a1,s6
  while ((c = *s++)) {
    51a2:	d695                	beqz	a3,50ce <neorv32_uart_vprintf+0x8a>
    if (c == '\n') {
    51a4:	45a9                	li	a1,10
  while ((c = *s++)) {
    51a6:	00d10613          	add	a2,sp,13
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    51aa:	4535                	li	a0,13
    if (c == '\n') {
    51ac:	00b68e63          	beq	a3,a1,51c8 <neorv32_uart_vprintf+0x184>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    51b0:	401c                	lw	a5,0(s0)
    51b2:	00a79713          	sll	a4,a5,0xa
    51b6:	fe075de3          	bgez	a4,51b0 <neorv32_uart_vprintf+0x16c>
  while ((c = *s++)) {
    51ba:	0605                	add	a2,a2,1
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    51bc:	c054                	sw	a3,4(s0)
  while ((c = *s++)) {
    51be:	fff64683          	lbu	a3,-1(a2)
    51c2:	dac5                	beqz	a3,5172 <neorv32_uart_vprintf+0x12e>
    if (c == '\n') {
    51c4:	feb696e3          	bne	a3,a1,51b0 <neorv32_uart_vprintf+0x16c>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    51c8:	401c                	lw	a5,0(s0)
    51ca:	00a79713          	sll	a4,a5,0xa
    51ce:	fe075de3          	bgez	a4,51c8 <neorv32_uart_vprintf+0x184>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    51d2:	c048                	sw	a0,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    51d4:	bff1                	j	51b0 <neorv32_uart_vprintf+0x16c>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
    51d6:	00082683          	lw	a3,0(a6)
    51da:	0811                	add	a6,a6,4
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    51dc:	401c                	lw	a5,0(s0)
    51de:	00a79713          	sll	a4,a5,0xa
    51e2:	fe075de3          	bgez	a4,51dc <neorv32_uart_vprintf+0x198>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    51e6:	0ff6f793          	zext.b	a5,a3
    51ea:	c05c                	sw	a5,4(s0)
      c = tolower(*format++);
    51ec:	85da                	mv	a1,s6
}
    51ee:	b5c5                	j	50ce <neorv32_uart_vprintf+0x8a>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    51f0:	00082583          	lw	a1,0(a6)
    51f4:	4629                	li	a2,10
    51f6:	0068                	add	a0,sp,12
    51f8:	00480b93          	add	s7,a6,4
    51fc:	b9aff0ef          	jal	4596 <neorv32_aux_itoa>
  while ((c = *s++)) {
    5200:	00c14683          	lbu	a3,12(sp)
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    5204:	885e                	mv	a6,s7
      c = tolower(*format++);
    5206:	85da                	mv	a1,s6
  while ((c = *s++)) {
    5208:	ec0683e3          	beqz	a3,50ce <neorv32_uart_vprintf+0x8a>
    if (c == '\n') {
    520c:	45a9                	li	a1,10
  while ((c = *s++)) {
    520e:	00d10613          	add	a2,sp,13
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5212:	4535                	li	a0,13
    if (c == '\n') {
    5214:	00b68e63          	beq	a3,a1,5230 <neorv32_uart_vprintf+0x1ec>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5218:	401c                	lw	a5,0(s0)
    521a:	00a79713          	sll	a4,a5,0xa
    521e:	fe075de3          	bgez	a4,5218 <neorv32_uart_vprintf+0x1d4>
  while ((c = *s++)) {
    5222:	0605                	add	a2,a2,1
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5224:	c054                	sw	a3,4(s0)
  while ((c = *s++)) {
    5226:	fff64683          	lbu	a3,-1(a2)
    522a:	d6a1                	beqz	a3,5172 <neorv32_uart_vprintf+0x12e>
    if (c == '\n') {
    522c:	feb696e3          	bne	a3,a1,5218 <neorv32_uart_vprintf+0x1d4>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5230:	401c                	lw	a5,0(s0)
    5232:	00a79713          	sll	a4,a5,0xa
    5236:	fe075de3          	bgez	a4,5230 <neorv32_uart_vprintf+0x1ec>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    523a:	c048                	sw	a0,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    523c:	bff1                	j	5218 <neorv32_uart_vprintf+0x1d4>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    523e:	00082503          	lw	a0,0(a6)
    5242:	00480893          	add	a7,a6,4
    5246:	8846                	mv	a6,a7
  while ((c = *s++)) {
    5248:	00054683          	lbu	a3,0(a0)
      c = tolower(*format++);
    524c:	85da                	mv	a1,s6
  while ((c = *s++)) {
    524e:	0505                	add	a0,a0,1
    5250:	e6068fe3          	beqz	a3,50ce <neorv32_uart_vprintf+0x8a>
    if (c == '\n') {
    5254:	4629                	li	a2,10
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5256:	45b5                	li	a1,13
    if (c == '\n') {
    5258:	00c68f63          	beq	a3,a2,5276 <neorv32_uart_vprintf+0x232>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    525c:	401c                	lw	a5,0(s0)
    525e:	00a79713          	sll	a4,a5,0xa
    5262:	fe075de3          	bgez	a4,525c <neorv32_uart_vprintf+0x218>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5266:	c054                	sw	a3,4(s0)
  while ((c = *s++)) {
    5268:	00054683          	lbu	a3,0(a0)
    526c:	0505                	add	a0,a0,1
    526e:	f6ed                	bnez	a3,5258 <neorv32_uart_vprintf+0x214>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    5270:	8846                	mv	a6,a7
      c = tolower(*format++);
    5272:	85da                	mv	a1,s6
    5274:	bda9                	j	50ce <neorv32_uart_vprintf+0x8a>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5276:	401c                	lw	a5,0(s0)
    5278:	00a79713          	sll	a4,a5,0xa
    527c:	fe075de3          	bgez	a4,5276 <neorv32_uart_vprintf+0x232>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5280:	c04c                	sw	a1,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5282:	bfe9                	j	525c <neorv32_uart_vprintf+0x218>
      if (c == '\n') {
    5284:	01570a63          	beq	a4,s5,5298 <neorv32_uart_vprintf+0x254>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5288:	401c                	lw	a5,0(s0)
    528a:	00a79693          	sll	a3,a5,0xa
    528e:	fe06dde3          	bgez	a3,5288 <neorv32_uart_vprintf+0x244>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    5292:	c058                	sw	a4,4(s0)
  while ((c = *format++)) {
    5294:	85b2                	mv	a1,a2
}
    5296:	bd25                	j	50ce <neorv32_uart_vprintf+0x8a>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    5298:	401c                	lw	a5,0(s0)
    529a:	00a79693          	sll	a3,a5,0xa
    529e:	fe06dde3          	bgez	a3,5298 <neorv32_uart_vprintf+0x254>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    52a2:	47b5                	li	a5,13
    52a4:	c05c                	sw	a5,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    52a6:	b7cd                	j	5288 <neorv32_uart_vprintf+0x244>
            n = -n;
    52a8:	40b005b3          	neg	a1,a1
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    52ac:	401c                	lw	a5,0(s0)
    52ae:	00a79713          	sll	a4,a5,0xa
    52b2:	fe075de3          	bgez	a4,52ac <neorv32_uart_vprintf+0x268>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    52b6:	02d00793          	li	a5,45
    52ba:	c05c                	sw	a5,4(s0)
}
    52bc:	bdd9                	j	5192 <neorv32_uart_vprintf+0x14e>

000052be <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    52be:	7139                	add	sp,sp,-64

  va_list args;
  va_start(args, format);
    52c0:	02810313          	add	t1,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    52c4:	d432                	sw	a2,40(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    52c6:	861a                	mv	a2,t1
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    52c8:	ce06                	sw	ra,28(sp)
    52ca:	d636                	sw	a3,44(sp)
    52cc:	d83a                	sw	a4,48(sp)
    52ce:	da3e                	sw	a5,52(sp)
    52d0:	dc42                	sw	a6,56(sp)
    52d2:	de46                	sw	a7,60(sp)
  va_start(args, format);
    52d4:	c61a                	sw	t1,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    52d6:	33bd                	jal	5044 <neorv32_uart_vprintf>
  va_end(args);
}
    52d8:	40f2                	lw	ra,28(sp)
    52da:	6121                	add	sp,sp,64
    52dc:	8082                	ret

000052de <modf>:
    52de:	4145d793          	sra	a5,a1,0x14
    52e2:	1141                	add	sp,sp,-16
    52e4:	7ff7f793          	and	a5,a5,2047
    52e8:	c422                	sw	s0,8(sp)
    52ea:	c226                	sw	s1,4(sp)
    52ec:	c04a                	sw	s2,0(sp)
    52ee:	c606                	sw	ra,12(sp)
    52f0:	c0178713          	add	a4,a5,-1023
    52f4:	46cd                	li	a3,19
    52f6:	842e                	mv	s0,a1
    52f8:	84aa                	mv	s1,a0
    52fa:	8932                	mv	s2,a2
    52fc:	02e6ce63          	blt	a3,a4,5338 <modf+0x5a>
    5300:	0a074b63          	bltz	a4,53b6 <modf+0xd8>
    5304:	001007b7          	lui	a5,0x100
    5308:	17fd                	add	a5,a5,-1 # fffff <__neorv32_rom_size+0xeffff>
    530a:	40e7d7b3          	sra	a5,a5,a4
    530e:	00b7f733          	and	a4,a5,a1
    5312:	8f49                	or	a4,a4,a0
    5314:	e731                	bnez	a4,5360 <modf+0x82>
    5316:	87a2                	mv	a5,s0
    5318:	800006b7          	lui	a3,0x80000
    531c:	00992023          	sw	s1,0(s2)
    5320:	8c75                	and	s0,s0,a3
    5322:	00f92223          	sw	a5,4(s2)
    5326:	4481                	li	s1,0
    5328:	40b2                	lw	ra,12(sp)
    532a:	85a2                	mv	a1,s0
    532c:	4422                	lw	s0,8(sp)
    532e:	4902                	lw	s2,0(sp)
    5330:	8526                	mv	a0,s1
    5332:	4492                	lw	s1,4(sp)
    5334:	0141                	add	sp,sp,16
    5336:	8082                	ret
    5338:	03300693          	li	a3,51
    533c:	04e6ca63          	blt	a3,a4,5390 <modf+0xb2>
    5340:	577d                	li	a4,-1
    5342:	bed78793          	add	a5,a5,-1043
    5346:	00f757b3          	srl	a5,a4,a5
    534a:	00a7f733          	and	a4,a5,a0
    534e:	d761                	beqz	a4,5316 <modf+0x38>
    5350:	fff7c793          	not	a5,a5
    5354:	8fe9                	and	a5,a5,a0
    5356:	883e                	mv	a6,a5
    5358:	863e                	mv	a2,a5
    535a:	88ae                	mv	a7,a1
    535c:	86ae                	mv	a3,a1
    535e:	a809                	j	5370 <modf+0x92>
    5360:	fff7c793          	not	a5,a5
    5364:	4701                	li	a4,0
    5366:	8fed                	and	a5,a5,a1
    5368:	883a                	mv	a6,a4
    536a:	863a                	mv	a2,a4
    536c:	88be                	mv	a7,a5
    536e:	86be                	mv	a3,a5
    5370:	01092023          	sw	a6,0(s2)
    5374:	01192223          	sw	a7,4(s2)
    5378:	08b030ef          	jal	8c02 <__subdf3>
    537c:	842e                	mv	s0,a1
    537e:	40b2                	lw	ra,12(sp)
    5380:	85a2                	mv	a1,s0
    5382:	4422                	lw	s0,8(sp)
    5384:	84aa                	mv	s1,a0
    5386:	4902                	lw	s2,0(sp)
    5388:	8526                	mv	a0,s1
    538a:	4492                	lw	s1,4(sp)
    538c:	0141                	add	sp,sp,16
    538e:	8082                	ret
    5390:	00a92023          	sw	a0,0(s2)
    5394:	00b92223          	sw	a1,4(s2)
    5398:	2091                	jal	53dc <__fpclassifyd>
    539a:	ed05                	bnez	a0,53d2 <modf+0xf4>
    539c:	8626                	mv	a2,s1
    539e:	8526                	mv	a0,s1
    53a0:	86a2                	mv	a3,s0
    53a2:	85a2                	mv	a1,s0
    53a4:	478020ef          	jal	781c <__adddf3>
    53a8:	84aa                	mv	s1,a0
    53aa:	842e                	mv	s0,a1
    53ac:	00a92023          	sw	a0,0(s2)
    53b0:	00b92223          	sw	a1,4(s2)
    53b4:	bf95                	j	5328 <modf+0x4a>
    53b6:	800007b7          	lui	a5,0x80000
    53ba:	40b2                	lw	ra,12(sp)
    53bc:	8fed                	and	a5,a5,a1
    53be:	85a2                	mv	a1,s0
    53c0:	4422                	lw	s0,8(sp)
    53c2:	00062023          	sw	zero,0(a2)
    53c6:	c25c                	sw	a5,4(a2)
    53c8:	4902                	lw	s2,0(sp)
    53ca:	8526                	mv	a0,s1
    53cc:	4492                	lw	s1,4(sp)
    53ce:	0141                	add	sp,sp,16
    53d0:	8082                	ret
    53d2:	800007b7          	lui	a5,0x80000
    53d6:	8c7d                	and	s0,s0,a5
    53d8:	4481                	li	s1,0
    53da:	b7b9                	j	5328 <modf+0x4a>

000053dc <__fpclassifyd>:
    53dc:	00b56733          	or	a4,a0,a1
    53e0:	87aa                	mv	a5,a0
    53e2:	c331                	beqz	a4,5426 <__fpclassifyd+0x4a>
    53e4:	80000737          	lui	a4,0x80000
    53e8:	02e58b63          	beq	a1,a4,541e <__fpclassifyd+0x42>
    53ec:	fff70693          	add	a3,a4,-1 # 7fffffff <__neorv32_rom_size+0x7ffeffff>
    53f0:	8eed                	and	a3,a3,a1
    53f2:	fff00837          	lui	a6,0xfff00
    53f6:	9836                	add	a6,a6,a3
    53f8:	7fe008b7          	lui	a7,0x7fe00
    53fc:	4511                	li	a0,4
    53fe:	01186f63          	bltu	a6,a7,541c <__fpclassifyd+0x40>
    5402:	00100837          	lui	a6,0x100
    5406:	450d                	li	a0,3
    5408:	0105ea63          	bltu	a1,a6,541c <__fpclassifyd+0x40>
    540c:	972e                	add	a4,a4,a1
    540e:	01076763          	bltu	a4,a6,541c <__fpclassifyd+0x40>
    5412:	7ff00737          	lui	a4,0x7ff00
    5416:	4501                	li	a0,0
    5418:	00e68963          	beq	a3,a4,542a <__fpclassifyd+0x4e>
    541c:	8082                	ret
    541e:	00a03533          	snez	a0,a0
    5422:	0509                	add	a0,a0,2
    5424:	8082                	ret
    5426:	4509                	li	a0,2
    5428:	8082                	ret
    542a:	0017b513          	seqz	a0,a5
    542e:	8082                	ret

00005430 <malloc>:
    5430:	85aa                	mv	a1,a0
    5432:	7fffb517          	auipc	a0,0x7fffb
    5436:	13252503          	lw	a0,306(a0) # 80000564 <_impure_ptr>
    543a:	a801                	j	544a <_malloc_r>

0000543c <free>:
    543c:	85aa                	mv	a1,a0
    543e:	7fffb517          	auipc	a0,0x7fffb
    5442:	12652503          	lw	a0,294(a0) # 80000564 <_impure_ptr>
    5446:	2e10006f          	j	5f26 <_free_r>

0000544a <_malloc_r>:
    544a:	7179                	add	sp,sp,-48
    544c:	d04a                	sw	s2,32(sp)
    544e:	d606                	sw	ra,44(sp)
    5450:	d422                	sw	s0,40(sp)
    5452:	d226                	sw	s1,36(sp)
    5454:	ce4e                	sw	s3,28(sp)
    5456:	00b58793          	add	a5,a1,11
    545a:	4759                	li	a4,22
    545c:	892a                	mv	s2,a0
    545e:	04f76963          	bltu	a4,a5,54b0 <_malloc_r+0x66>
    5462:	47c1                	li	a5,16
    5464:	16b7eb63          	bltu	a5,a1,55da <_malloc_r+0x190>
    5468:	2345                	jal	5a08 <__malloc_lock>
    546a:	47e1                	li	a5,24
    546c:	4589                	li	a1,2
    546e:	44c1                	li	s1,16
    5470:	7fffb997          	auipc	s3,0x7fffb
    5474:	b9098993          	add	s3,s3,-1136 # 80000000 <__malloc_av_>
    5478:	97ce                	add	a5,a5,s3
    547a:	43c0                	lw	s0,4(a5)
    547c:	ff878713          	add	a4,a5,-8 # 7ffffff8 <__neorv32_rom_size+0x7ffefff8>
    5480:	26e40a63          	beq	s0,a4,56f4 <_malloc_r+0x2aa>
    5484:	405c                	lw	a5,4(s0)
    5486:	4454                	lw	a3,12(s0)
    5488:	4410                	lw	a2,8(s0)
    548a:	9bf1                	and	a5,a5,-4
    548c:	97a2                	add	a5,a5,s0
    548e:	43d8                	lw	a4,4(a5)
    5490:	c654                	sw	a3,12(a2)
    5492:	c690                	sw	a2,8(a3)
    5494:	00176713          	or	a4,a4,1
    5498:	854a                	mv	a0,s2
    549a:	c3d8                	sw	a4,4(a5)
    549c:	2b9d                	jal	5a12 <__malloc_unlock>
    549e:	00840513          	add	a0,s0,8
    54a2:	50b2                	lw	ra,44(sp)
    54a4:	5422                	lw	s0,40(sp)
    54a6:	5492                	lw	s1,36(sp)
    54a8:	5902                	lw	s2,32(sp)
    54aa:	49f2                	lw	s3,28(sp)
    54ac:	6145                	add	sp,sp,48
    54ae:	8082                	ret
    54b0:	ff87f493          	and	s1,a5,-8
    54b4:	1207c363          	bltz	a5,55da <_malloc_r+0x190>
    54b8:	12b4e163          	bltu	s1,a1,55da <_malloc_r+0x190>
    54bc:	23b1                	jal	5a08 <__malloc_lock>
    54be:	1f700793          	li	a5,503
    54c2:	2e97f863          	bgeu	a5,s1,57b2 <_malloc_r+0x368>
    54c6:	0094d793          	srl	a5,s1,0x9
    54ca:	10078d63          	beqz	a5,55e4 <_malloc_r+0x19a>
    54ce:	4711                	li	a4,4
    54d0:	26f76763          	bltu	a4,a5,573e <_malloc_r+0x2f4>
    54d4:	0064d793          	srl	a5,s1,0x6
    54d8:	03978593          	add	a1,a5,57
    54dc:	03878813          	add	a6,a5,56
    54e0:	00359613          	sll	a2,a1,0x3
    54e4:	7fffb997          	auipc	s3,0x7fffb
    54e8:	b1c98993          	add	s3,s3,-1252 # 80000000 <__malloc_av_>
    54ec:	964e                	add	a2,a2,s3
    54ee:	4240                	lw	s0,4(a2)
    54f0:	1661                	add	a2,a2,-8
    54f2:	02860163          	beq	a2,s0,5514 <_malloc_r+0xca>
    54f6:	453d                	li	a0,15
    54f8:	a039                	j	5506 <_malloc_r+0xbc>
    54fa:	4454                	lw	a3,12(s0)
    54fc:	1e075a63          	bgez	a4,56f0 <_malloc_r+0x2a6>
    5500:	00d60a63          	beq	a2,a3,5514 <_malloc_r+0xca>
    5504:	8436                	mv	s0,a3
    5506:	405c                	lw	a5,4(s0)
    5508:	9bf1                	and	a5,a5,-4
    550a:	40978733          	sub	a4,a5,s1
    550e:	fee556e3          	bge	a0,a4,54fa <_malloc_r+0xb0>
    5512:	85c2                	mv	a1,a6
    5514:	0109a403          	lw	s0,16(s3)
    5518:	7fffb897          	auipc	a7,0x7fffb
    551c:	af088893          	add	a7,a7,-1296 # 80000008 <__malloc_av_+0x8>
    5520:	1d140563          	beq	s0,a7,56ea <_malloc_r+0x2a0>
    5524:	405c                	lw	a5,4(s0)
    5526:	46bd                	li	a3,15
    5528:	9bf1                	and	a5,a5,-4
    552a:	40978733          	sub	a4,a5,s1
    552e:	28e6c763          	blt	a3,a4,57bc <_malloc_r+0x372>
    5532:	0119aa23          	sw	a7,20(s3)
    5536:	0119a823          	sw	a7,16(s3)
    553a:	26075263          	bgez	a4,579e <_malloc_r+0x354>
    553e:	1ff00713          	li	a4,511
    5542:	0049a503          	lw	a0,4(s3)
    5546:	1af76c63          	bltu	a4,a5,56fe <_malloc_r+0x2b4>
    554a:	ff87f713          	and	a4,a5,-8
    554e:	0721                	add	a4,a4,8 # 7ff00008 <__neorv32_rom_size+0x7fef0008>
    5550:	974e                	add	a4,a4,s3
    5552:	4314                	lw	a3,0(a4)
    5554:	0057d613          	srl	a2,a5,0x5
    5558:	4785                	li	a5,1
    555a:	00c797b3          	sll	a5,a5,a2
    555e:	8d5d                	or	a0,a0,a5
    5560:	ff870793          	add	a5,a4,-8
    5564:	c45c                	sw	a5,12(s0)
    5566:	c414                	sw	a3,8(s0)
    5568:	00a9a223          	sw	a0,4(s3)
    556c:	c300                	sw	s0,0(a4)
    556e:	c6c0                	sw	s0,12(a3)
    5570:	4025d793          	sra	a5,a1,0x2
    5574:	4605                	li	a2,1
    5576:	00f61633          	sll	a2,a2,a5
    557a:	06c56c63          	bltu	a0,a2,55f2 <_malloc_r+0x1a8>
    557e:	00a677b3          	and	a5,a2,a0
    5582:	ef81                	bnez	a5,559a <_malloc_r+0x150>
    5584:	0606                	sll	a2,a2,0x1
    5586:	99f1                	and	a1,a1,-4
    5588:	00a677b3          	and	a5,a2,a0
    558c:	0591                	add	a1,a1,4
    558e:	e791                	bnez	a5,559a <_malloc_r+0x150>
    5590:	0606                	sll	a2,a2,0x1
    5592:	00a677b3          	and	a5,a2,a0
    5596:	0591                	add	a1,a1,4
    5598:	dfe5                	beqz	a5,5590 <_malloc_r+0x146>
    559a:	483d                	li	a6,15
    559c:	00359313          	sll	t1,a1,0x3
    55a0:	934e                	add	t1,t1,s3
    55a2:	851a                	mv	a0,t1
    55a4:	455c                	lw	a5,12(a0)
    55a6:	8e2e                	mv	t3,a1
    55a8:	1af50b63          	beq	a0,a5,575e <_malloc_r+0x314>
    55ac:	43d8                	lw	a4,4(a5)
    55ae:	843e                	mv	s0,a5
    55b0:	47dc                	lw	a5,12(a5)
    55b2:	9b71                	and	a4,a4,-4
    55b4:	409706b3          	sub	a3,a4,s1
    55b8:	1ad84a63          	blt	a6,a3,576c <_malloc_r+0x322>
    55bc:	fe06c6e3          	bltz	a3,55a8 <_malloc_r+0x15e>
    55c0:	9722                	add	a4,a4,s0
    55c2:	4354                	lw	a3,4(a4)
    55c4:	4410                	lw	a2,8(s0)
    55c6:	854a                	mv	a0,s2
    55c8:	0016e693          	or	a3,a3,1
    55cc:	c354                	sw	a3,4(a4)
    55ce:	c65c                	sw	a5,12(a2)
    55d0:	c790                	sw	a2,8(a5)
    55d2:	2181                	jal	5a12 <__malloc_unlock>
    55d4:	00840513          	add	a0,s0,8
    55d8:	b5e9                	j	54a2 <_malloc_r+0x58>
    55da:	47b1                	li	a5,12
    55dc:	00f92023          	sw	a5,0(s2)
    55e0:	4501                	li	a0,0
    55e2:	b5c1                	j	54a2 <_malloc_r+0x58>
    55e4:	20000613          	li	a2,512
    55e8:	04000593          	li	a1,64
    55ec:	03f00813          	li	a6,63
    55f0:	bdd5                	j	54e4 <_malloc_r+0x9a>
    55f2:	0089a403          	lw	s0,8(s3)
    55f6:	c85a                	sw	s6,16(sp)
    55f8:	405c                	lw	a5,4(s0)
    55fa:	ffc7fb13          	and	s6,a5,-4
    55fe:	009b6763          	bltu	s6,s1,560c <_malloc_r+0x1c2>
    5602:	409b0733          	sub	a4,s6,s1
    5606:	47bd                	li	a5,15
    5608:	0ae7cc63          	blt	a5,a4,56c0 <_malloc_r+0x276>
    560c:	c266                	sw	s9,4(sp)
    560e:	7fffbc97          	auipc	s9,0x7fffb
    5612:	f4ec8c93          	add	s9,s9,-178 # 8000055c <__malloc_sbrk_base>
    5616:	000ca703          	lw	a4,0(s9)
    561a:	cc52                	sw	s4,24(sp)
    561c:	ca56                	sw	s5,20(sp)
    561e:	c65e                	sw	s7,12(sp)
    5620:	7fffba97          	auipc	s5,0x7fffb
    5624:	f78aaa83          	lw	s5,-136(s5) # 80000598 <__malloc_top_pad>
    5628:	57fd                	li	a5,-1
    562a:	01640a33          	add	s4,s0,s6
    562e:	9aa6                	add	s5,s5,s1
    5630:	2cf70c63          	beq	a4,a5,5908 <_malloc_r+0x4be>
    5634:	6785                	lui	a5,0x1
    5636:	07bd                	add	a5,a5,15 # 100f <cfs_stream_4xK_Kx4.constprop.0+0x57>
    5638:	9abe                	add	s5,s5,a5
    563a:	77fd                	lui	a5,0xfffff
    563c:	00fafab3          	and	s5,s5,a5
    5640:	85d6                	mv	a1,s5
    5642:	854a                	mv	a0,s2
    5644:	216d                	jal	5aee <_sbrk_r>
    5646:	57fd                	li	a5,-1
    5648:	8baa                	mv	s7,a0
    564a:	32f50e63          	beq	a0,a5,5986 <_malloc_r+0x53c>
    564e:	c462                	sw	s8,8(sp)
    5650:	1b456463          	bltu	a0,s4,57f8 <_malloc_r+0x3ae>
    5654:	7fffbc17          	auipc	s8,0x7fffb
    5658:	fccc0c13          	add	s8,s8,-52 # 80000620 <__malloc_current_mallinfo>
    565c:	000c2583          	lw	a1,0(s8)
    5660:	95d6                	add	a1,a1,s5
    5662:	00bc2023          	sw	a1,0(s8)
    5666:	872e                	mv	a4,a1
    5668:	1eaa1e63          	bne	s4,a0,5864 <_malloc_r+0x41a>
    566c:	01451793          	sll	a5,a0,0x14
    5670:	1e079a63          	bnez	a5,5864 <_malloc_r+0x41a>
    5674:	0089ab83          	lw	s7,8(s3)
    5678:	015b07b3          	add	a5,s6,s5
    567c:	0017e793          	or	a5,a5,1
    5680:	00fba223          	sw	a5,4(s7)
    5684:	7fffb717          	auipc	a4,0x7fffb
    5688:	f1070713          	add	a4,a4,-240 # 80000594 <__malloc_max_sbrked_mem>
    568c:	4314                	lw	a3,0(a4)
    568e:	00b6f363          	bgeu	a3,a1,5694 <_malloc_r+0x24a>
    5692:	c30c                	sw	a1,0(a4)
    5694:	7fffb717          	auipc	a4,0x7fffb
    5698:	efc70713          	add	a4,a4,-260 # 80000590 <__malloc_max_total_mem>
    569c:	4314                	lw	a3,0(a4)
    569e:	00b6f363          	bgeu	a3,a1,56a4 <_malloc_r+0x25a>
    56a2:	c30c                	sw	a1,0(a4)
    56a4:	4c22                	lw	s8,8(sp)
    56a6:	845e                	mv	s0,s7
    56a8:	9bf1                	and	a5,a5,-4
    56aa:	40978733          	sub	a4,a5,s1
    56ae:	2897ea63          	bltu	a5,s1,5942 <_malloc_r+0x4f8>
    56b2:	47bd                	li	a5,15
    56b4:	28e7d763          	bge	a5,a4,5942 <_malloc_r+0x4f8>
    56b8:	4a62                	lw	s4,24(sp)
    56ba:	4ad2                	lw	s5,20(sp)
    56bc:	4bb2                	lw	s7,12(sp)
    56be:	4c92                	lw	s9,4(sp)
    56c0:	0014e793          	or	a5,s1,1
    56c4:	c05c                	sw	a5,4(s0)
    56c6:	94a2                	add	s1,s1,s0
    56c8:	0099a423          	sw	s1,8(s3)
    56cc:	00176713          	or	a4,a4,1
    56d0:	854a                	mv	a0,s2
    56d2:	c0d8                	sw	a4,4(s1)
    56d4:	2e3d                	jal	5a12 <__malloc_unlock>
    56d6:	50b2                	lw	ra,44(sp)
    56d8:	00840513          	add	a0,s0,8
    56dc:	5422                	lw	s0,40(sp)
    56de:	4b42                	lw	s6,16(sp)
    56e0:	5492                	lw	s1,36(sp)
    56e2:	5902                	lw	s2,32(sp)
    56e4:	49f2                	lw	s3,28(sp)
    56e6:	6145                	add	sp,sp,48
    56e8:	8082                	ret
    56ea:	0049a503          	lw	a0,4(s3)
    56ee:	b549                	j	5570 <_malloc_r+0x126>
    56f0:	4410                	lw	a2,8(s0)
    56f2:	bb69                	j	548c <_malloc_r+0x42>
    56f4:	47c0                	lw	s0,12(a5)
    56f6:	0589                	add	a1,a1,2
    56f8:	e0878ee3          	beq	a5,s0,5514 <_malloc_r+0xca>
    56fc:	b361                	j	5484 <_malloc_r+0x3a>
    56fe:	0097d713          	srl	a4,a5,0x9
    5702:	4691                	li	a3,4
    5704:	0ee6f263          	bgeu	a3,a4,57e8 <_malloc_r+0x39e>
    5708:	46d1                	li	a3,20
    570a:	24e6e563          	bltu	a3,a4,5954 <_malloc_r+0x50a>
    570e:	05c70613          	add	a2,a4,92
    5712:	05b70693          	add	a3,a4,91
    5716:	060e                	sll	a2,a2,0x3
    5718:	964e                	add	a2,a2,s3
    571a:	4218                	lw	a4,0(a2)
    571c:	1661                	add	a2,a2,-8
    571e:	00e61663          	bne	a2,a4,572a <_malloc_r+0x2e0>
    5722:	a2ed                	j	590c <_malloc_r+0x4c2>
    5724:	4718                	lw	a4,8(a4)
    5726:	00e60663          	beq	a2,a4,5732 <_malloc_r+0x2e8>
    572a:	4354                	lw	a3,4(a4)
    572c:	9af1                	and	a3,a3,-4
    572e:	fed7ebe3          	bltu	a5,a3,5724 <_malloc_r+0x2da>
    5732:	4750                	lw	a2,12(a4)
    5734:	c450                	sw	a2,12(s0)
    5736:	c418                	sw	a4,8(s0)
    5738:	c600                	sw	s0,8(a2)
    573a:	c740                	sw	s0,12(a4)
    573c:	bd15                	j	5570 <_malloc_r+0x126>
    573e:	4751                	li	a4,20
    5740:	0cf77363          	bgeu	a4,a5,5806 <_malloc_r+0x3bc>
    5744:	05400713          	li	a4,84
    5748:	22f76263          	bltu	a4,a5,596c <_malloc_r+0x522>
    574c:	00c4d793          	srl	a5,s1,0xc
    5750:	06f78593          	add	a1,a5,111 # fffff06f <__crt0_ram_last+0x7fffb070>
    5754:	06e78813          	add	a6,a5,110
    5758:	00359613          	sll	a2,a1,0x3
    575c:	b361                	j	54e4 <_malloc_r+0x9a>
    575e:	0e05                	add	t3,t3,1
    5760:	003e7793          	and	a5,t3,3
    5764:	0521                	add	a0,a0,8
    5766:	cfc5                	beqz	a5,581e <_malloc_r+0x3d4>
    5768:	455c                	lw	a5,12(a0)
    576a:	bd3d                	j	55a8 <_malloc_r+0x15e>
    576c:	4410                	lw	a2,8(s0)
    576e:	0014e593          	or	a1,s1,1
    5772:	c04c                	sw	a1,4(s0)
    5774:	c65c                	sw	a5,12(a2)
    5776:	c790                	sw	a2,8(a5)
    5778:	94a2                	add	s1,s1,s0
    577a:	0099aa23          	sw	s1,20(s3)
    577e:	0099a823          	sw	s1,16(s3)
    5782:	0016e793          	or	a5,a3,1
    5786:	0114a623          	sw	a7,12(s1)
    578a:	0114a423          	sw	a7,8(s1)
    578e:	c0dc                	sw	a5,4(s1)
    5790:	9722                	add	a4,a4,s0
    5792:	854a                	mv	a0,s2
    5794:	c314                	sw	a3,0(a4)
    5796:	2cb5                	jal	5a12 <__malloc_unlock>
    5798:	00840513          	add	a0,s0,8
    579c:	b319                	j	54a2 <_malloc_r+0x58>
    579e:	97a2                	add	a5,a5,s0
    57a0:	43d8                	lw	a4,4(a5)
    57a2:	854a                	mv	a0,s2
    57a4:	00176713          	or	a4,a4,1
    57a8:	c3d8                	sw	a4,4(a5)
    57aa:	24a5                	jal	5a12 <__malloc_unlock>
    57ac:	00840513          	add	a0,s0,8
    57b0:	b9cd                	j	54a2 <_malloc_r+0x58>
    57b2:	0034d593          	srl	a1,s1,0x3
    57b6:	00848793          	add	a5,s1,8
    57ba:	b95d                	j	5470 <_malloc_r+0x26>
    57bc:	0014e693          	or	a3,s1,1
    57c0:	c054                	sw	a3,4(s0)
    57c2:	94a2                	add	s1,s1,s0
    57c4:	0099aa23          	sw	s1,20(s3)
    57c8:	0099a823          	sw	s1,16(s3)
    57cc:	00176693          	or	a3,a4,1
    57d0:	0114a623          	sw	a7,12(s1)
    57d4:	0114a423          	sw	a7,8(s1)
    57d8:	c0d4                	sw	a3,4(s1)
    57da:	97a2                	add	a5,a5,s0
    57dc:	854a                	mv	a0,s2
    57de:	c398                	sw	a4,0(a5)
    57e0:	2c0d                	jal	5a12 <__malloc_unlock>
    57e2:	00840513          	add	a0,s0,8
    57e6:	b975                	j	54a2 <_malloc_r+0x58>
    57e8:	0067d713          	srl	a4,a5,0x6
    57ec:	03970613          	add	a2,a4,57
    57f0:	03870693          	add	a3,a4,56
    57f4:	060e                	sll	a2,a2,0x3
    57f6:	b70d                	j	5718 <_malloc_r+0x2ce>
    57f8:	05340d63          	beq	s0,s3,5852 <_malloc_r+0x408>
    57fc:	0089a403          	lw	s0,8(s3)
    5800:	4c22                	lw	s8,8(sp)
    5802:	405c                	lw	a5,4(s0)
    5804:	b555                	j	56a8 <_malloc_r+0x25e>
    5806:	05c78593          	add	a1,a5,92
    580a:	05b78813          	add	a6,a5,91
    580e:	00359613          	sll	a2,a1,0x3
    5812:	b9c9                	j	54e4 <_malloc_r+0x9a>
    5814:	00832783          	lw	a5,8(t1)
    5818:	15fd                	add	a1,a1,-1
    581a:	1e679463          	bne	a5,t1,5a02 <_malloc_r+0x5b8>
    581e:	0035f793          	and	a5,a1,3
    5822:	1361                	add	t1,t1,-8
    5824:	fbe5                	bnez	a5,5814 <_malloc_r+0x3ca>
    5826:	0049a703          	lw	a4,4(s3)
    582a:	fff64793          	not	a5,a2
    582e:	8ff9                	and	a5,a5,a4
    5830:	00f9a223          	sw	a5,4(s3)
    5834:	0606                	sll	a2,a2,0x1
    5836:	dac7eee3          	bltu	a5,a2,55f2 <_malloc_r+0x1a8>
    583a:	da060ce3          	beqz	a2,55f2 <_malloc_r+0x1a8>
    583e:	00f67733          	and	a4,a2,a5
    5842:	e711                	bnez	a4,584e <_malloc_r+0x404>
    5844:	0606                	sll	a2,a2,0x1
    5846:	00f67733          	and	a4,a2,a5
    584a:	0e11                	add	t3,t3,4
    584c:	df65                	beqz	a4,5844 <_malloc_r+0x3fa>
    584e:	85f2                	mv	a1,t3
    5850:	b3b1                	j	559c <_malloc_r+0x152>
    5852:	7fffbc17          	auipc	s8,0x7fffb
    5856:	dcec0c13          	add	s8,s8,-562 # 80000620 <__malloc_current_mallinfo>
    585a:	000c2703          	lw	a4,0(s8)
    585e:	9756                	add	a4,a4,s5
    5860:	00ec2023          	sw	a4,0(s8)
    5864:	000ca683          	lw	a3,0(s9)
    5868:	57fd                	li	a5,-1
    586a:	12f68263          	beq	a3,a5,598e <_malloc_r+0x544>
    586e:	414b87b3          	sub	a5,s7,s4
    5872:	97ba                	add	a5,a5,a4
    5874:	00fc2023          	sw	a5,0(s8)
    5878:	007bfc93          	and	s9,s7,7
    587c:	0a0c8063          	beqz	s9,591c <_malloc_r+0x4d2>
    5880:	419b8bb3          	sub	s7,s7,s9
    5884:	6785                	lui	a5,0x1
    5886:	07a1                	add	a5,a5,8 # 1008 <cfs_stream_4xK_Kx4.constprop.0+0x50>
    5888:	0ba1                	add	s7,s7,8
    588a:	419785b3          	sub	a1,a5,s9
    588e:	9ade                	add	s5,s5,s7
    5890:	415585b3          	sub	a1,a1,s5
    5894:	05d2                	sll	a1,a1,0x14
    5896:	0145da13          	srl	s4,a1,0x14
    589a:	85d2                	mv	a1,s4
    589c:	854a                	mv	a0,s2
    589e:	2c81                	jal	5aee <_sbrk_r>
    58a0:	57fd                	li	a5,-1
    58a2:	12f50263          	beq	a0,a5,59c6 <_malloc_r+0x57c>
    58a6:	41750533          	sub	a0,a0,s7
    58aa:	01450ab3          	add	s5,a0,s4
    58ae:	000c2703          	lw	a4,0(s8)
    58b2:	0179a423          	sw	s7,8(s3)
    58b6:	001ae793          	or	a5,s5,1
    58ba:	00ea05b3          	add	a1,s4,a4
    58be:	00bc2023          	sw	a1,0(s8)
    58c2:	00fba223          	sw	a5,4(s7)
    58c6:	db340fe3          	beq	s0,s3,5684 <_malloc_r+0x23a>
    58ca:	46bd                	li	a3,15
    58cc:	0766f763          	bgeu	a3,s6,593a <_malloc_r+0x4f0>
    58d0:	4058                	lw	a4,4(s0)
    58d2:	ff4b0793          	add	a5,s6,-12
    58d6:	9be1                	and	a5,a5,-8
    58d8:	8b05                	and	a4,a4,1
    58da:	8f5d                	or	a4,a4,a5
    58dc:	c058                	sw	a4,4(s0)
    58de:	4615                	li	a2,5
    58e0:	00f40733          	add	a4,s0,a5
    58e4:	c350                	sw	a2,4(a4)
    58e6:	c710                	sw	a2,8(a4)
    58e8:	00f6e563          	bltu	a3,a5,58f2 <_malloc_r+0x4a8>
    58ec:	004ba783          	lw	a5,4(s7)
    58f0:	bb51                	j	5684 <_malloc_r+0x23a>
    58f2:	00840593          	add	a1,s0,8
    58f6:	854a                	mv	a0,s2
    58f8:	253d                	jal	5f26 <_free_r>
    58fa:	0089ab83          	lw	s7,8(s3)
    58fe:	000c2583          	lw	a1,0(s8)
    5902:	004ba783          	lw	a5,4(s7)
    5906:	bbbd                	j	5684 <_malloc_r+0x23a>
    5908:	0ac1                	add	s5,s5,16
    590a:	bb1d                	j	5640 <_malloc_r+0x1f6>
    590c:	8689                	sra	a3,a3,0x2
    590e:	4785                	li	a5,1
    5910:	00d797b3          	sll	a5,a5,a3
    5914:	8d5d                	or	a0,a0,a5
    5916:	00a9a223          	sw	a0,4(s3)
    591a:	bd29                	j	5734 <_malloc_r+0x2ea>
    591c:	015b85b3          	add	a1,s7,s5
    5920:	40b005b3          	neg	a1,a1
    5924:	05d2                	sll	a1,a1,0x14
    5926:	0145da13          	srl	s4,a1,0x14
    592a:	85d2                	mv	a1,s4
    592c:	854a                	mv	a0,s2
    592e:	22c1                	jal	5aee <_sbrk_r>
    5930:	57fd                	li	a5,-1
    5932:	f6f51ae3          	bne	a0,a5,58a6 <_malloc_r+0x45c>
    5936:	4a01                	li	s4,0
    5938:	bf9d                	j	58ae <_malloc_r+0x464>
    593a:	4c22                	lw	s8,8(sp)
    593c:	4785                	li	a5,1
    593e:	00fba223          	sw	a5,4(s7)
    5942:	854a                	mv	a0,s2
    5944:	20f9                	jal	5a12 <__malloc_unlock>
    5946:	4501                	li	a0,0
    5948:	4a62                	lw	s4,24(sp)
    594a:	4ad2                	lw	s5,20(sp)
    594c:	4b42                	lw	s6,16(sp)
    594e:	4bb2                	lw	s7,12(sp)
    5950:	4c92                	lw	s9,4(sp)
    5952:	be81                	j	54a2 <_malloc_r+0x58>
    5954:	05400693          	li	a3,84
    5958:	02e6ee63          	bltu	a3,a4,5994 <_malloc_r+0x54a>
    595c:	00c7d713          	srl	a4,a5,0xc
    5960:	06f70613          	add	a2,a4,111
    5964:	06e70693          	add	a3,a4,110
    5968:	060e                	sll	a2,a2,0x3
    596a:	b37d                	j	5718 <_malloc_r+0x2ce>
    596c:	15400713          	li	a4,340
    5970:	02f76e63          	bltu	a4,a5,59ac <_malloc_r+0x562>
    5974:	00f4d793          	srl	a5,s1,0xf
    5978:	07878593          	add	a1,a5,120
    597c:	07778813          	add	a6,a5,119
    5980:	00359613          	sll	a2,a1,0x3
    5984:	b685                	j	54e4 <_malloc_r+0x9a>
    5986:	0089a403          	lw	s0,8(s3)
    598a:	405c                	lw	a5,4(s0)
    598c:	bb31                	j	56a8 <_malloc_r+0x25e>
    598e:	017ca023          	sw	s7,0(s9)
    5992:	b5dd                	j	5878 <_malloc_r+0x42e>
    5994:	15400693          	li	a3,340
    5998:	02e6ed63          	bltu	a3,a4,59d2 <_malloc_r+0x588>
    599c:	00f7d713          	srl	a4,a5,0xf
    59a0:	07870613          	add	a2,a4,120
    59a4:	07770693          	add	a3,a4,119
    59a8:	060e                	sll	a2,a2,0x3
    59aa:	b3bd                	j	5718 <_malloc_r+0x2ce>
    59ac:	55400713          	li	a4,1364
    59b0:	02f76d63          	bltu	a4,a5,59ea <_malloc_r+0x5a0>
    59b4:	0124d793          	srl	a5,s1,0x12
    59b8:	07d78593          	add	a1,a5,125
    59bc:	07c78813          	add	a6,a5,124
    59c0:	00359613          	sll	a2,a1,0x3
    59c4:	b605                	j	54e4 <_malloc_r+0x9a>
    59c6:	1ce1                	add	s9,s9,-8
    59c8:	9ae6                	add	s5,s5,s9
    59ca:	417a8ab3          	sub	s5,s5,s7
    59ce:	4a01                	li	s4,0
    59d0:	bdf9                	j	58ae <_malloc_r+0x464>
    59d2:	55400693          	li	a3,1364
    59d6:	02e6e163          	bltu	a3,a4,59f8 <_malloc_r+0x5ae>
    59da:	0127d713          	srl	a4,a5,0x12
    59de:	07d70613          	add	a2,a4,125
    59e2:	07c70693          	add	a3,a4,124
    59e6:	060e                	sll	a2,a2,0x3
    59e8:	bb05                	j	5718 <_malloc_r+0x2ce>
    59ea:	3f800613          	li	a2,1016
    59ee:	07f00593          	li	a1,127
    59f2:	07e00813          	li	a6,126
    59f6:	b4fd                	j	54e4 <_malloc_r+0x9a>
    59f8:	3f800613          	li	a2,1016
    59fc:	07e00693          	li	a3,126
    5a00:	bb21                	j	5718 <_malloc_r+0x2ce>
    5a02:	0049a783          	lw	a5,4(s3)
    5a06:	b53d                	j	5834 <_malloc_r+0x3ea>

00005a08 <__malloc_lock>:
    5a08:	7fffb517          	auipc	a0,0x7fffb
    5a0c:	b9850513          	add	a0,a0,-1128 # 800005a0 <__lock___malloc_recursive_mutex>
    5a10:	aa29                	j	5b2a <__retarget_lock_acquire_recursive>

00005a12 <__malloc_unlock>:
    5a12:	7fffb517          	auipc	a0,0x7fffb
    5a16:	b8e50513          	add	a0,a0,-1138 # 800005a0 <__lock___malloc_recursive_mutex>
    5a1a:	aa09                	j	5b2c <__retarget_lock_release_recursive>

00005a1c <putchar>:
    5a1c:	7fffb797          	auipc	a5,0x7fffb
    5a20:	b487a783          	lw	a5,-1208(a5) # 80000564 <_impure_ptr>
    5a24:	4790                	lw	a2,8(a5)
    5a26:	85aa                	mv	a1,a0
    5a28:	853e                	mv	a0,a5
    5a2a:	5270006f          	j	6750 <_putc_r>

00005a2e <_puts_r>:
    5a2e:	7179                	add	sp,sp,-48
    5a30:	d422                	sw	s0,40(sp)
    5a32:	842a                	mv	s0,a0
    5a34:	852e                	mv	a0,a1
    5a36:	d226                	sw	s1,36(sp)
    5a38:	d606                	sw	ra,44(sp)
    5a3a:	84ae                	mv	s1,a1
    5a3c:	2675                	jal	5de8 <strlen>
    5a3e:	00150713          	add	a4,a0,1
    5a42:	00004697          	auipc	a3,0x4
    5a46:	0e268693          	add	a3,a3,226 # 9b24 <__fini_array_end+0x4b0>
    5a4a:	c63a                	sw	a4,12(sp)
    5a4c:	585c                	lw	a5,52(s0)
    5a4e:	0818                	add	a4,sp,16
    5a50:	cc36                	sw	a3,24(sp)
    5a52:	c23a                	sw	a4,4(sp)
    5a54:	4685                	li	a3,1
    5a56:	4709                	li	a4,2
    5a58:	c826                	sw	s1,16(sp)
    5a5a:	ca2a                	sw	a0,20(sp)
    5a5c:	ce36                	sw	a3,28(sp)
    5a5e:	c43a                	sw	a4,8(sp)
    5a60:	4404                	lw	s1,8(s0)
    5a62:	cfa5                	beqz	a5,5ada <_puts_r+0xac>
    5a64:	50f8                	lw	a4,100(s1)
    5a66:	00c49783          	lh	a5,12(s1)
    5a6a:	8b05                	and	a4,a4,1
    5a6c:	e701                	bnez	a4,5a74 <_puts_r+0x46>
    5a6e:	2007f713          	and	a4,a5,512
    5a72:	cf39                	beqz	a4,5ad0 <_puts_r+0xa2>
    5a74:	01279713          	sll	a4,a5,0x12
    5a78:	00074b63          	bltz	a4,5a8e <_puts_r+0x60>
    5a7c:	50f8                	lw	a4,100(s1)
    5a7e:	76f9                	lui	a3,0xffffe
    5a80:	16fd                	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7fffa000>
    5a82:	6609                	lui	a2,0x2
    5a84:	8fd1                	or	a5,a5,a2
    5a86:	8f75                	and	a4,a4,a3
    5a88:	00f49623          	sh	a5,12(s1)
    5a8c:	d0f8                	sw	a4,100(s1)
    5a8e:	8522                	mv	a0,s0
    5a90:	0050                	add	a2,sp,4
    5a92:	85a6                	mv	a1,s1
    5a94:	0f5000ef          	jal	6388 <__sfvwrite_r>
    5a98:	50fc                	lw	a5,100(s1)
    5a9a:	00153413          	seqz	s0,a0
    5a9e:	40800433          	neg	s0,s0
    5aa2:	882d                	and	s0,s0,11
    5aa4:	8b85                	and	a5,a5,1
    5aa6:	147d                	add	s0,s0,-1
    5aa8:	e791                	bnez	a5,5ab4 <_puts_r+0x86>
    5aaa:	00c4d783          	lhu	a5,12(s1)
    5aae:	2007f793          	and	a5,a5,512
    5ab2:	c799                	beqz	a5,5ac0 <_puts_r+0x92>
    5ab4:	50b2                	lw	ra,44(sp)
    5ab6:	8522                	mv	a0,s0
    5ab8:	5422                	lw	s0,40(sp)
    5aba:	5492                	lw	s1,36(sp)
    5abc:	6145                	add	sp,sp,48
    5abe:	8082                	ret
    5ac0:	4ca8                	lw	a0,88(s1)
    5ac2:	20ad                	jal	5b2c <__retarget_lock_release_recursive>
    5ac4:	50b2                	lw	ra,44(sp)
    5ac6:	8522                	mv	a0,s0
    5ac8:	5422                	lw	s0,40(sp)
    5aca:	5492                	lw	s1,36(sp)
    5acc:	6145                	add	sp,sp,48
    5ace:	8082                	ret
    5ad0:	4ca8                	lw	a0,88(s1)
    5ad2:	28a1                	jal	5b2a <__retarget_lock_acquire_recursive>
    5ad4:	00c49783          	lh	a5,12(s1)
    5ad8:	bf71                	j	5a74 <_puts_r+0x46>
    5ada:	8522                	mv	a0,s0
    5adc:	043000ef          	jal	631e <__sinit>
    5ae0:	b751                	j	5a64 <_puts_r+0x36>

00005ae2 <puts>:
    5ae2:	85aa                	mv	a1,a0
    5ae4:	7fffb517          	auipc	a0,0x7fffb
    5ae8:	a8052503          	lw	a0,-1408(a0) # 80000564 <_impure_ptr>
    5aec:	b789                	j	5a2e <_puts_r>

00005aee <_sbrk_r>:
    5aee:	1141                	add	sp,sp,-16
    5af0:	c422                	sw	s0,8(sp)
    5af2:	842a                	mv	s0,a0
    5af4:	852e                	mv	a0,a1
    5af6:	7fffb797          	auipc	a5,0x7fffb
    5afa:	aa07a323          	sw	zero,-1370(a5) # 8000059c <errno>
    5afe:	c606                	sw	ra,12(sp)
    5b00:	ceffe0ef          	jal	47ee <_sbrk>
    5b04:	57fd                	li	a5,-1
    5b06:	00f50663          	beq	a0,a5,5b12 <_sbrk_r+0x24>
    5b0a:	40b2                	lw	ra,12(sp)
    5b0c:	4422                	lw	s0,8(sp)
    5b0e:	0141                	add	sp,sp,16
    5b10:	8082                	ret
    5b12:	7fffb797          	auipc	a5,0x7fffb
    5b16:	a8a7a783          	lw	a5,-1398(a5) # 8000059c <errno>
    5b1a:	dbe5                	beqz	a5,5b0a <_sbrk_r+0x1c>
    5b1c:	40b2                	lw	ra,12(sp)
    5b1e:	c01c                	sw	a5,0(s0)
    5b20:	4422                	lw	s0,8(sp)
    5b22:	0141                	add	sp,sp,16
    5b24:	8082                	ret

00005b26 <__retarget_lock_init_recursive>:
    5b26:	8082                	ret

00005b28 <__retarget_lock_close_recursive>:
    5b28:	8082                	ret

00005b2a <__retarget_lock_acquire_recursive>:
    5b2a:	8082                	ret

00005b2c <__retarget_lock_release_recursive>:
    5b2c:	8082                	ret

00005b2e <memmove>:
    5b2e:	02a5f263          	bgeu	a1,a0,5b52 <memmove+0x24>
    5b32:	00c58733          	add	a4,a1,a2
    5b36:	00e57e63          	bgeu	a0,a4,5b52 <memmove+0x24>
    5b3a:	00c507b3          	add	a5,a0,a2
    5b3e:	ca1d                	beqz	a2,5b74 <memmove+0x46>
    5b40:	fff74683          	lbu	a3,-1(a4)
    5b44:	17fd                	add	a5,a5,-1
    5b46:	177d                	add	a4,a4,-1
    5b48:	00d78023          	sb	a3,0(a5)
    5b4c:	fef51ae3          	bne	a0,a5,5b40 <memmove+0x12>
    5b50:	8082                	ret
    5b52:	47bd                	li	a5,15
    5b54:	02c7e163          	bltu	a5,a2,5b76 <memmove+0x48>
    5b58:	87aa                	mv	a5,a0
    5b5a:	fff60693          	add	a3,a2,-1 # 1fff <matrix_mul_matrix+0x745>
    5b5e:	ca59                	beqz	a2,5bf4 <memmove+0xc6>
    5b60:	0685                	add	a3,a3,1
    5b62:	96be                	add	a3,a3,a5
    5b64:	0005c703          	lbu	a4,0(a1)
    5b68:	0785                	add	a5,a5,1
    5b6a:	0585                	add	a1,a1,1
    5b6c:	fee78fa3          	sb	a4,-1(a5)
    5b70:	fed79ae3          	bne	a5,a3,5b64 <memmove+0x36>
    5b74:	8082                	ret
    5b76:	00b567b3          	or	a5,a0,a1
    5b7a:	8b8d                	and	a5,a5,3
    5b7c:	eba5                	bnez	a5,5bec <memmove+0xbe>
    5b7e:	ff060893          	add	a7,a2,-16
    5b82:	ff08f893          	and	a7,a7,-16
    5b86:	08c1                	add	a7,a7,16
    5b88:	011506b3          	add	a3,a0,a7
    5b8c:	872e                	mv	a4,a1
    5b8e:	87aa                	mv	a5,a0
    5b90:	00072803          	lw	a6,0(a4)
    5b94:	0741                	add	a4,a4,16
    5b96:	07c1                	add	a5,a5,16
    5b98:	ff07a823          	sw	a6,-16(a5)
    5b9c:	ff472803          	lw	a6,-12(a4)
    5ba0:	ff07aa23          	sw	a6,-12(a5)
    5ba4:	ff872803          	lw	a6,-8(a4)
    5ba8:	ff07ac23          	sw	a6,-8(a5)
    5bac:	ffc72803          	lw	a6,-4(a4)
    5bb0:	ff07ae23          	sw	a6,-4(a5)
    5bb4:	fcd79ee3          	bne	a5,a3,5b90 <memmove+0x62>
    5bb8:	00c67813          	and	a6,a2,12
    5bbc:	95c6                	add	a1,a1,a7
    5bbe:	00f67713          	and	a4,a2,15
    5bc2:	02080a63          	beqz	a6,5bf6 <memmove+0xc8>
    5bc6:	ffc70813          	add	a6,a4,-4
    5bca:	ffc87813          	and	a6,a6,-4
    5bce:	0811                	add	a6,a6,4 # 100004 <__neorv32_rom_size+0xf0004>
    5bd0:	010687b3          	add	a5,a3,a6
    5bd4:	872e                	mv	a4,a1
    5bd6:	00072883          	lw	a7,0(a4)
    5bda:	0691                	add	a3,a3,4
    5bdc:	0711                	add	a4,a4,4
    5bde:	ff16ae23          	sw	a7,-4(a3)
    5be2:	fef69ae3          	bne	a3,a5,5bd6 <memmove+0xa8>
    5be6:	8a0d                	and	a2,a2,3
    5be8:	95c2                	add	a1,a1,a6
    5bea:	bf85                	j	5b5a <memmove+0x2c>
    5bec:	fff60693          	add	a3,a2,-1
    5bf0:	87aa                	mv	a5,a0
    5bf2:	b7bd                	j	5b60 <memmove+0x32>
    5bf4:	8082                	ret
    5bf6:	863a                	mv	a2,a4
    5bf8:	b78d                	j	5b5a <memmove+0x2c>

00005bfa <memset>:
    5bfa:	433d                	li	t1,15
    5bfc:	872a                	mv	a4,a0
    5bfe:	02c37363          	bgeu	t1,a2,5c24 <memset+0x2a>
    5c02:	00f77793          	and	a5,a4,15
    5c06:	efbd                	bnez	a5,5c84 <memset+0x8a>
    5c08:	e5ad                	bnez	a1,5c72 <memset+0x78>
    5c0a:	ff067693          	and	a3,a2,-16
    5c0e:	8a3d                	and	a2,a2,15
    5c10:	96ba                	add	a3,a3,a4
    5c12:	c30c                	sw	a1,0(a4)
    5c14:	c34c                	sw	a1,4(a4)
    5c16:	c70c                	sw	a1,8(a4)
    5c18:	c74c                	sw	a1,12(a4)
    5c1a:	0741                	add	a4,a4,16
    5c1c:	fed76be3          	bltu	a4,a3,5c12 <memset+0x18>
    5c20:	e211                	bnez	a2,5c24 <memset+0x2a>
    5c22:	8082                	ret
    5c24:	40c306b3          	sub	a3,t1,a2
    5c28:	068a                	sll	a3,a3,0x2
    5c2a:	00000297          	auipc	t0,0x0
    5c2e:	9696                	add	a3,a3,t0
    5c30:	00a68067          	jr	10(a3)
    5c34:	00b70723          	sb	a1,14(a4)
    5c38:	00b706a3          	sb	a1,13(a4)
    5c3c:	00b70623          	sb	a1,12(a4)
    5c40:	00b705a3          	sb	a1,11(a4)
    5c44:	00b70523          	sb	a1,10(a4)
    5c48:	00b704a3          	sb	a1,9(a4)
    5c4c:	00b70423          	sb	a1,8(a4)
    5c50:	00b703a3          	sb	a1,7(a4)
    5c54:	00b70323          	sb	a1,6(a4)
    5c58:	00b702a3          	sb	a1,5(a4)
    5c5c:	00b70223          	sb	a1,4(a4)
    5c60:	00b701a3          	sb	a1,3(a4)
    5c64:	00b70123          	sb	a1,2(a4)
    5c68:	00b700a3          	sb	a1,1(a4)
    5c6c:	00b70023          	sb	a1,0(a4)
    5c70:	8082                	ret
    5c72:	0ff5f593          	zext.b	a1,a1
    5c76:	00859693          	sll	a3,a1,0x8
    5c7a:	8dd5                	or	a1,a1,a3
    5c7c:	01059693          	sll	a3,a1,0x10
    5c80:	8dd5                	or	a1,a1,a3
    5c82:	b761                	j	5c0a <memset+0x10>
    5c84:	00279693          	sll	a3,a5,0x2
    5c88:	00000297          	auipc	t0,0x0
    5c8c:	9696                	add	a3,a3,t0
    5c8e:	8286                	mv	t0,ra
    5c90:	fa8680e7          	jalr	-88(a3)
    5c94:	8096                	mv	ra,t0
    5c96:	17c1                	add	a5,a5,-16
    5c98:	8f1d                	sub	a4,a4,a5
    5c9a:	963e                	add	a2,a2,a5
    5c9c:	f8c374e3          	bgeu	t1,a2,5c24 <memset+0x2a>
    5ca0:	b7a5                	j	5c08 <memset+0xe>

00005ca2 <memcpy>:
    5ca2:	00a5c7b3          	xor	a5,a1,a0
    5ca6:	8b8d                	and	a5,a5,3
    5ca8:	00c508b3          	add	a7,a0,a2
    5cac:	e7b1                	bnez	a5,5cf8 <memcpy+0x56>
    5cae:	478d                	li	a5,3
    5cb0:	04c7f463          	bgeu	a5,a2,5cf8 <memcpy+0x56>
    5cb4:	00357793          	and	a5,a0,3
    5cb8:	872a                	mv	a4,a0
    5cba:	ebb9                	bnez	a5,5d10 <memcpy+0x6e>
    5cbc:	ffc8f613          	and	a2,a7,-4
    5cc0:	40e606b3          	sub	a3,a2,a4
    5cc4:	02000793          	li	a5,32
    5cc8:	06d7c863          	blt	a5,a3,5d38 <memcpy+0x96>
    5ccc:	86ae                	mv	a3,a1
    5cce:	87ba                	mv	a5,a4
    5cd0:	02c77163          	bgeu	a4,a2,5cf2 <memcpy+0x50>
    5cd4:	0006a803          	lw	a6,0(a3)
    5cd8:	0791                	add	a5,a5,4
    5cda:	0691                	add	a3,a3,4
    5cdc:	ff07ae23          	sw	a6,-4(a5)
    5ce0:	fec7eae3          	bltu	a5,a2,5cd4 <memcpy+0x32>
    5ce4:	fff60793          	add	a5,a2,-1
    5ce8:	8f99                	sub	a5,a5,a4
    5cea:	9bf1                	and	a5,a5,-4
    5cec:	0791                	add	a5,a5,4
    5cee:	973e                	add	a4,a4,a5
    5cf0:	95be                	add	a1,a1,a5
    5cf2:	01176663          	bltu	a4,a7,5cfe <memcpy+0x5c>
    5cf6:	8082                	ret
    5cf8:	872a                	mv	a4,a0
    5cfa:	03157e63          	bgeu	a0,a7,5d36 <memcpy+0x94>
    5cfe:	0005c783          	lbu	a5,0(a1)
    5d02:	0705                	add	a4,a4,1
    5d04:	0585                	add	a1,a1,1
    5d06:	fef70fa3          	sb	a5,-1(a4)
    5d0a:	fee89ae3          	bne	a7,a4,5cfe <memcpy+0x5c>
    5d0e:	8082                	ret
    5d10:	0005c683          	lbu	a3,0(a1)
    5d14:	0705                	add	a4,a4,1
    5d16:	00377793          	and	a5,a4,3
    5d1a:	fed70fa3          	sb	a3,-1(a4)
    5d1e:	0585                	add	a1,a1,1
    5d20:	dfd1                	beqz	a5,5cbc <memcpy+0x1a>
    5d22:	0005c683          	lbu	a3,0(a1)
    5d26:	0705                	add	a4,a4,1
    5d28:	00377793          	and	a5,a4,3
    5d2c:	fed70fa3          	sb	a3,-1(a4)
    5d30:	0585                	add	a1,a1,1
    5d32:	fff9                	bnez	a5,5d10 <memcpy+0x6e>
    5d34:	b761                	j	5cbc <memcpy+0x1a>
    5d36:	8082                	ret
    5d38:	1141                	add	sp,sp,-16
    5d3a:	c622                	sw	s0,12(sp)
    5d3c:	02000413          	li	s0,32
    5d40:	0005a383          	lw	t2,0(a1)
    5d44:	0045a283          	lw	t0,4(a1)
    5d48:	0085af83          	lw	t6,8(a1)
    5d4c:	00c5af03          	lw	t5,12(a1)
    5d50:	0105ae83          	lw	t4,16(a1)
    5d54:	0145ae03          	lw	t3,20(a1)
    5d58:	0185a303          	lw	t1,24(a1)
    5d5c:	01c5a803          	lw	a6,28(a1)
    5d60:	5194                	lw	a3,32(a1)
    5d62:	02470713          	add	a4,a4,36
    5d66:	40e607b3          	sub	a5,a2,a4
    5d6a:	fc772e23          	sw	t2,-36(a4)
    5d6e:	fe572023          	sw	t0,-32(a4)
    5d72:	fff72223          	sw	t6,-28(a4)
    5d76:	ffe72423          	sw	t5,-24(a4)
    5d7a:	ffd72623          	sw	t4,-20(a4)
    5d7e:	ffc72823          	sw	t3,-16(a4)
    5d82:	fe672a23          	sw	t1,-12(a4)
    5d86:	ff072c23          	sw	a6,-8(a4)
    5d8a:	fed72e23          	sw	a3,-4(a4)
    5d8e:	02458593          	add	a1,a1,36
    5d92:	faf447e3          	blt	s0,a5,5d40 <memcpy+0x9e>
    5d96:	86ae                	mv	a3,a1
    5d98:	87ba                	mv	a5,a4
    5d9a:	02c77163          	bgeu	a4,a2,5dbc <memcpy+0x11a>
    5d9e:	0006a803          	lw	a6,0(a3)
    5da2:	0791                	add	a5,a5,4
    5da4:	0691                	add	a3,a3,4
    5da6:	ff07ae23          	sw	a6,-4(a5)
    5daa:	fec7eae3          	bltu	a5,a2,5d9e <memcpy+0xfc>
    5dae:	fff60793          	add	a5,a2,-1
    5db2:	8f99                	sub	a5,a5,a4
    5db4:	9bf1                	and	a5,a5,-4
    5db6:	0791                	add	a5,a5,4
    5db8:	973e                	add	a4,a4,a5
    5dba:	95be                	add	a1,a1,a5
    5dbc:	01176563          	bltu	a4,a7,5dc6 <memcpy+0x124>
    5dc0:	4432                	lw	s0,12(sp)
    5dc2:	0141                	add	sp,sp,16
    5dc4:	8082                	ret
    5dc6:	0005c783          	lbu	a5,0(a1)
    5dca:	0705                	add	a4,a4,1
    5dcc:	0585                	add	a1,a1,1
    5dce:	fef70fa3          	sb	a5,-1(a4)
    5dd2:	fee887e3          	beq	a7,a4,5dc0 <memcpy+0x11e>
    5dd6:	0005c783          	lbu	a5,0(a1)
    5dda:	0705                	add	a4,a4,1
    5ddc:	0585                	add	a1,a1,1
    5dde:	fef70fa3          	sb	a5,-1(a4)
    5de2:	fee892e3          	bne	a7,a4,5dc6 <memcpy+0x124>
    5de6:	bfe9                	j	5dc0 <memcpy+0x11e>

00005de8 <strlen>:
    5de8:	00357793          	and	a5,a0,3
    5dec:	872a                	mv	a4,a0
    5dee:	ef9d                	bnez	a5,5e2c <strlen+0x44>
    5df0:	7f7f86b7          	lui	a3,0x7f7f8
    5df4:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7e7f7f>
    5df8:	55fd                	li	a1,-1
    5dfa:	4310                	lw	a2,0(a4)
    5dfc:	0711                	add	a4,a4,4
    5dfe:	00d677b3          	and	a5,a2,a3
    5e02:	97b6                	add	a5,a5,a3
    5e04:	8fd1                	or	a5,a5,a2
    5e06:	8fd5                	or	a5,a5,a3
    5e08:	feb789e3          	beq	a5,a1,5dfa <strlen+0x12>
    5e0c:	ffc74683          	lbu	a3,-4(a4)
    5e10:	40a707b3          	sub	a5,a4,a0
    5e14:	ca8d                	beqz	a3,5e46 <strlen+0x5e>
    5e16:	ffd74683          	lbu	a3,-3(a4)
    5e1a:	c29d                	beqz	a3,5e40 <strlen+0x58>
    5e1c:	ffe74503          	lbu	a0,-2(a4)
    5e20:	00a03533          	snez	a0,a0
    5e24:	953e                	add	a0,a0,a5
    5e26:	1579                	add	a0,a0,-2
    5e28:	8082                	ret
    5e2a:	d2f9                	beqz	a3,5df0 <strlen+0x8>
    5e2c:	00074783          	lbu	a5,0(a4)
    5e30:	0705                	add	a4,a4,1
    5e32:	00377693          	and	a3,a4,3
    5e36:	fbf5                	bnez	a5,5e2a <strlen+0x42>
    5e38:	8f09                	sub	a4,a4,a0
    5e3a:	fff70513          	add	a0,a4,-1
    5e3e:	8082                	ret
    5e40:	ffd78513          	add	a0,a5,-3
    5e44:	8082                	ret
    5e46:	ffc78513          	add	a0,a5,-4
    5e4a:	8082                	ret

00005e4c <_malloc_trim_r>:
    5e4c:	1101                	add	sp,sp,-32
    5e4e:	cc22                	sw	s0,24(sp)
    5e50:	ca26                	sw	s1,20(sp)
    5e52:	c84a                	sw	s2,16(sp)
    5e54:	c64e                	sw	s3,12(sp)
    5e56:	c452                	sw	s4,8(sp)
    5e58:	89ae                	mv	s3,a1
    5e5a:	ce06                	sw	ra,28(sp)
    5e5c:	892a                	mv	s2,a0
    5e5e:	7fffaa17          	auipc	s4,0x7fffa
    5e62:	1a2a0a13          	add	s4,s4,418 # 80000000 <__malloc_av_>
    5e66:	ba3ff0ef          	jal	5a08 <__malloc_lock>
    5e6a:	008a2703          	lw	a4,8(s4)
    5e6e:	6785                	lui	a5,0x1
    5e70:	17bd                	add	a5,a5,-17 # fef <cfs_stream_4xK_Kx4.constprop.0+0x37>
    5e72:	4344                	lw	s1,4(a4)
    5e74:	6705                	lui	a4,0x1
    5e76:	98f1                	and	s1,s1,-4
    5e78:	00f48433          	add	s0,s1,a5
    5e7c:	41340433          	sub	s0,s0,s3
    5e80:	8031                	srl	s0,s0,0xc
    5e82:	147d                	add	s0,s0,-1
    5e84:	0432                	sll	s0,s0,0xc
    5e86:	00e44b63          	blt	s0,a4,5e9c <_malloc_trim_r+0x50>
    5e8a:	4581                	li	a1,0
    5e8c:	854a                	mv	a0,s2
    5e8e:	c61ff0ef          	jal	5aee <_sbrk_r>
    5e92:	008a2783          	lw	a5,8(s4)
    5e96:	97a6                	add	a5,a5,s1
    5e98:	00f50e63          	beq	a0,a5,5eb4 <_malloc_trim_r+0x68>
    5e9c:	854a                	mv	a0,s2
    5e9e:	b75ff0ef          	jal	5a12 <__malloc_unlock>
    5ea2:	40f2                	lw	ra,28(sp)
    5ea4:	4462                	lw	s0,24(sp)
    5ea6:	44d2                	lw	s1,20(sp)
    5ea8:	4942                	lw	s2,16(sp)
    5eaa:	49b2                	lw	s3,12(sp)
    5eac:	4a22                	lw	s4,8(sp)
    5eae:	4501                	li	a0,0
    5eb0:	6105                	add	sp,sp,32
    5eb2:	8082                	ret
    5eb4:	408005b3          	neg	a1,s0
    5eb8:	854a                	mv	a0,s2
    5eba:	c35ff0ef          	jal	5aee <_sbrk_r>
    5ebe:	57fd                	li	a5,-1
    5ec0:	02f50b63          	beq	a0,a5,5ef6 <_malloc_trim_r+0xaa>
    5ec4:	7fffa717          	auipc	a4,0x7fffa
    5ec8:	75c70713          	add	a4,a4,1884 # 80000620 <__malloc_current_mallinfo>
    5ecc:	431c                	lw	a5,0(a4)
    5ece:	008a2683          	lw	a3,8(s4)
    5ed2:	8c81                	sub	s1,s1,s0
    5ed4:	0014e493          	or	s1,s1,1
    5ed8:	8f81                	sub	a5,a5,s0
    5eda:	854a                	mv	a0,s2
    5edc:	c2c4                	sw	s1,4(a3)
    5ede:	c31c                	sw	a5,0(a4)
    5ee0:	b33ff0ef          	jal	5a12 <__malloc_unlock>
    5ee4:	40f2                	lw	ra,28(sp)
    5ee6:	4462                	lw	s0,24(sp)
    5ee8:	44d2                	lw	s1,20(sp)
    5eea:	4942                	lw	s2,16(sp)
    5eec:	49b2                	lw	s3,12(sp)
    5eee:	4a22                	lw	s4,8(sp)
    5ef0:	4505                	li	a0,1
    5ef2:	6105                	add	sp,sp,32
    5ef4:	8082                	ret
    5ef6:	4581                	li	a1,0
    5ef8:	854a                	mv	a0,s2
    5efa:	bf5ff0ef          	jal	5aee <_sbrk_r>
    5efe:	008a2703          	lw	a4,8(s4)
    5f02:	46bd                	li	a3,15
    5f04:	40e507b3          	sub	a5,a0,a4
    5f08:	f8f6dae3          	bge	a3,a5,5e9c <_malloc_trim_r+0x50>
    5f0c:	7fffa697          	auipc	a3,0x7fffa
    5f10:	6506a683          	lw	a3,1616(a3) # 8000055c <__malloc_sbrk_base>
    5f14:	8d15                	sub	a0,a0,a3
    5f16:	0017e793          	or	a5,a5,1
    5f1a:	7fffa697          	auipc	a3,0x7fffa
    5f1e:	70a6a323          	sw	a0,1798(a3) # 80000620 <__malloc_current_mallinfo>
    5f22:	c35c                	sw	a5,4(a4)
    5f24:	bfa5                	j	5e9c <_malloc_trim_r+0x50>

00005f26 <_free_r>:
    5f26:	10058d63          	beqz	a1,6040 <_free_r+0x11a>
    5f2a:	1141                	add	sp,sp,-16
    5f2c:	c422                	sw	s0,8(sp)
    5f2e:	c226                	sw	s1,4(sp)
    5f30:	842e                	mv	s0,a1
    5f32:	84aa                	mv	s1,a0
    5f34:	c606                	sw	ra,12(sp)
    5f36:	ad3ff0ef          	jal	5a08 <__malloc_lock>
    5f3a:	ffc42583          	lw	a1,-4(s0)
    5f3e:	ff840713          	add	a4,s0,-8
    5f42:	7fffa517          	auipc	a0,0x7fffa
    5f46:	0be50513          	add	a0,a0,190 # 80000000 <__malloc_av_>
    5f4a:	ffe5f793          	and	a5,a1,-2
    5f4e:	00f70633          	add	a2,a4,a5
    5f52:	4254                	lw	a3,4(a2)
    5f54:	00852803          	lw	a6,8(a0)
    5f58:	9af1                	and	a3,a3,-4
    5f5a:	12c80563          	beq	a6,a2,6084 <_free_r+0x15e>
    5f5e:	c254                	sw	a3,4(a2)
    5f60:	8985                	and	a1,a1,1
    5f62:	00d60833          	add	a6,a2,a3
    5f66:	e9bd                	bnez	a1,5fdc <_free_r+0xb6>
    5f68:	ff842303          	lw	t1,-8(s0)
    5f6c:	00482583          	lw	a1,4(a6)
    5f70:	7fffa897          	auipc	a7,0x7fffa
    5f74:	09888893          	add	a7,a7,152 # 80000008 <__malloc_av_+0x8>
    5f78:	40670733          	sub	a4,a4,t1
    5f7c:	00872803          	lw	a6,8(a4)
    5f80:	979a                	add	a5,a5,t1
    5f82:	8985                	and	a1,a1,1
    5f84:	0f180463          	beq	a6,a7,606c <_free_r+0x146>
    5f88:	00c72303          	lw	t1,12(a4)
    5f8c:	00682623          	sw	t1,12(a6)
    5f90:	01032423          	sw	a6,8(t1)
    5f94:	12058563          	beqz	a1,60be <_free_r+0x198>
    5f98:	0017e693          	or	a3,a5,1
    5f9c:	c354                	sw	a3,4(a4)
    5f9e:	c21c                	sw	a5,0(a2)
    5fa0:	1ff00693          	li	a3,511
    5fa4:	04f6e963          	bltu	a3,a5,5ff6 <_free_r+0xd0>
    5fa8:	ff87f693          	and	a3,a5,-8
    5fac:	06a1                	add	a3,a3,8
    5fae:	414c                	lw	a1,4(a0)
    5fb0:	96aa                	add	a3,a3,a0
    5fb2:	4290                	lw	a2,0(a3)
    5fb4:	0057d813          	srl	a6,a5,0x5
    5fb8:	4785                	li	a5,1
    5fba:	010797b3          	sll	a5,a5,a6
    5fbe:	8fcd                	or	a5,a5,a1
    5fc0:	ff868593          	add	a1,a3,-8
    5fc4:	c74c                	sw	a1,12(a4)
    5fc6:	c710                	sw	a2,8(a4)
    5fc8:	c15c                	sw	a5,4(a0)
    5fca:	c298                	sw	a4,0(a3)
    5fcc:	c658                	sw	a4,12(a2)
    5fce:	4422                	lw	s0,8(sp)
    5fd0:	40b2                	lw	ra,12(sp)
    5fd2:	8526                	mv	a0,s1
    5fd4:	4492                	lw	s1,4(sp)
    5fd6:	0141                	add	sp,sp,16
    5fd8:	a3bff06f          	j	5a12 <__malloc_unlock>
    5fdc:	00482583          	lw	a1,4(a6)
    5fe0:	8985                	and	a1,a1,1
    5fe2:	c1a5                	beqz	a1,6042 <_free_r+0x11c>
    5fe4:	0017e693          	or	a3,a5,1
    5fe8:	fed42e23          	sw	a3,-4(s0)
    5fec:	c21c                	sw	a5,0(a2)
    5fee:	1ff00693          	li	a3,511
    5ff2:	faf6fbe3          	bgeu	a3,a5,5fa8 <_free_r+0x82>
    5ff6:	0097d693          	srl	a3,a5,0x9
    5ffa:	4611                	li	a2,4
    5ffc:	0cd66363          	bltu	a2,a3,60c2 <_free_r+0x19c>
    6000:	0067d693          	srl	a3,a5,0x6
    6004:	03968593          	add	a1,a3,57
    6008:	03868613          	add	a2,a3,56
    600c:	058e                	sll	a1,a1,0x3
    600e:	95aa                	add	a1,a1,a0
    6010:	4194                	lw	a3,0(a1)
    6012:	15e1                	add	a1,a1,-8
    6014:	00d59663          	bne	a1,a3,6020 <_free_r+0xfa>
    6018:	a0f5                	j	6104 <_free_r+0x1de>
    601a:	4694                	lw	a3,8(a3)
    601c:	00d58663          	beq	a1,a3,6028 <_free_r+0x102>
    6020:	42d0                	lw	a2,4(a3)
    6022:	9a71                	and	a2,a2,-4
    6024:	fec7ebe3          	bltu	a5,a2,601a <_free_r+0xf4>
    6028:	46cc                	lw	a1,12(a3)
    602a:	c74c                	sw	a1,12(a4)
    602c:	c714                	sw	a3,8(a4)
    602e:	4422                	lw	s0,8(sp)
    6030:	40b2                	lw	ra,12(sp)
    6032:	c598                	sw	a4,8(a1)
    6034:	8526                	mv	a0,s1
    6036:	4492                	lw	s1,4(sp)
    6038:	c6d8                	sw	a4,12(a3)
    603a:	0141                	add	sp,sp,16
    603c:	9d7ff06f          	j	5a12 <__malloc_unlock>
    6040:	8082                	ret
    6042:	97b6                	add	a5,a5,a3
    6044:	7fffa897          	auipc	a7,0x7fffa
    6048:	fc488893          	add	a7,a7,-60 # 80000008 <__malloc_av_+0x8>
    604c:	4614                	lw	a3,8(a2)
    604e:	09168f63          	beq	a3,a7,60ec <_free_r+0x1c6>
    6052:	00c62803          	lw	a6,12(a2)
    6056:	0017e593          	or	a1,a5,1
    605a:	00f70633          	add	a2,a4,a5
    605e:	0106a623          	sw	a6,12(a3)
    6062:	00d82423          	sw	a3,8(a6)
    6066:	c34c                	sw	a1,4(a4)
    6068:	c21c                	sw	a5,0(a2)
    606a:	bf1d                	j	5fa0 <_free_r+0x7a>
    606c:	e1fd                	bnez	a1,6152 <_free_r+0x22c>
    606e:	460c                	lw	a1,8(a2)
    6070:	4650                	lw	a2,12(a2)
    6072:	96be                	add	a3,a3,a5
    6074:	0016e793          	or	a5,a3,1
    6078:	c5d0                	sw	a2,12(a1)
    607a:	c60c                	sw	a1,8(a2)
    607c:	c35c                	sw	a5,4(a4)
    607e:	9736                	add	a4,a4,a3
    6080:	c314                	sw	a3,0(a4)
    6082:	b7b1                	j	5fce <_free_r+0xa8>
    6084:	8985                	and	a1,a1,1
    6086:	96be                	add	a3,a3,a5
    6088:	e989                	bnez	a1,609a <_free_r+0x174>
    608a:	ff842583          	lw	a1,-8(s0)
    608e:	8f0d                	sub	a4,a4,a1
    6090:	475c                	lw	a5,12(a4)
    6092:	4710                	lw	a2,8(a4)
    6094:	96ae                	add	a3,a3,a1
    6096:	c65c                	sw	a5,12(a2)
    6098:	c790                	sw	a2,8(a5)
    609a:	0016e793          	or	a5,a3,1
    609e:	c35c                	sw	a5,4(a4)
    60a0:	c518                	sw	a4,8(a0)
    60a2:	7fffa797          	auipc	a5,0x7fffa
    60a6:	4be7a783          	lw	a5,1214(a5) # 80000560 <__malloc_trim_threshold>
    60aa:	f2f6e2e3          	bltu	a3,a5,5fce <_free_r+0xa8>
    60ae:	7fffa597          	auipc	a1,0x7fffa
    60b2:	4ea5a583          	lw	a1,1258(a1) # 80000598 <__malloc_top_pad>
    60b6:	8526                	mv	a0,s1
    60b8:	d95ff0ef          	jal	5e4c <_malloc_trim_r>
    60bc:	bf09                	j	5fce <_free_r+0xa8>
    60be:	97b6                	add	a5,a5,a3
    60c0:	b771                	j	604c <_free_r+0x126>
    60c2:	4651                	li	a2,20
    60c4:	00d67e63          	bgeu	a2,a3,60e0 <_free_r+0x1ba>
    60c8:	05400613          	li	a2,84
    60cc:	04d66663          	bltu	a2,a3,6118 <_free_r+0x1f2>
    60d0:	00c7d693          	srl	a3,a5,0xc
    60d4:	06f68593          	add	a1,a3,111
    60d8:	06e68613          	add	a2,a3,110
    60dc:	058e                	sll	a1,a1,0x3
    60de:	bf05                	j	600e <_free_r+0xe8>
    60e0:	05c68593          	add	a1,a3,92
    60e4:	05b68613          	add	a2,a3,91
    60e8:	058e                	sll	a1,a1,0x3
    60ea:	b715                	j	600e <_free_r+0xe8>
    60ec:	c958                	sw	a4,20(a0)
    60ee:	c918                	sw	a4,16(a0)
    60f0:	0017e693          	or	a3,a5,1
    60f4:	01172623          	sw	a7,12(a4)
    60f8:	01172423          	sw	a7,8(a4)
    60fc:	c354                	sw	a3,4(a4)
    60fe:	973e                	add	a4,a4,a5
    6100:	c31c                	sw	a5,0(a4)
    6102:	b5f1                	j	5fce <_free_r+0xa8>
    6104:	00452803          	lw	a6,4(a0)
    6108:	8609                	sra	a2,a2,0x2
    610a:	4785                	li	a5,1
    610c:	00c797b3          	sll	a5,a5,a2
    6110:	0107e7b3          	or	a5,a5,a6
    6114:	c15c                	sw	a5,4(a0)
    6116:	bf11                	j	602a <_free_r+0x104>
    6118:	15400613          	li	a2,340
    611c:	00d66a63          	bltu	a2,a3,6130 <_free_r+0x20a>
    6120:	00f7d693          	srl	a3,a5,0xf
    6124:	07868593          	add	a1,a3,120
    6128:	07768613          	add	a2,a3,119
    612c:	058e                	sll	a1,a1,0x3
    612e:	b5c5                	j	600e <_free_r+0xe8>
    6130:	55400613          	li	a2,1364
    6134:	00d66a63          	bltu	a2,a3,6148 <_free_r+0x222>
    6138:	0127d693          	srl	a3,a5,0x12
    613c:	07d68593          	add	a1,a3,125
    6140:	07c68613          	add	a2,a3,124
    6144:	058e                	sll	a1,a1,0x3
    6146:	b5e1                	j	600e <_free_r+0xe8>
    6148:	3f800593          	li	a1,1016
    614c:	07e00613          	li	a2,126
    6150:	bd7d                	j	600e <_free_r+0xe8>
    6152:	0017e693          	or	a3,a5,1
    6156:	c354                	sw	a3,4(a4)
    6158:	c21c                	sw	a5,0(a2)
    615a:	bd95                	j	5fce <_free_r+0xa8>

0000615c <stdio_exit_handler>:
    615c:	7fffa617          	auipc	a2,0x7fffa
    6160:	3cc60613          	add	a2,a2,972 # 80000528 <__sglue>
    6164:	00001597          	auipc	a1,0x1
    6168:	e9458593          	add	a1,a1,-364 # 6ff8 <_fclose_r>
    616c:	7fffa517          	auipc	a0,0x7fffa
    6170:	29c50513          	add	a0,a0,668 # 80000408 <_impure_data>
    6174:	a3ad                	j	66de <_fwalk_sglue>

00006176 <cleanup_stdio>:
    6176:	414c                	lw	a1,4(a0)
    6178:	1141                	add	sp,sp,-16
    617a:	c422                	sw	s0,8(sp)
    617c:	c606                	sw	ra,12(sp)
    617e:	7fffa797          	auipc	a5,0x7fffa
    6182:	4ca78793          	add	a5,a5,1226 # 80000648 <__sf>
    6186:	842a                	mv	s0,a0
    6188:	00f58463          	beq	a1,a5,6190 <cleanup_stdio+0x1a>
    618c:	66d000ef          	jal	6ff8 <_fclose_r>
    6190:	440c                	lw	a1,8(s0)
    6192:	7fffa797          	auipc	a5,0x7fffa
    6196:	51e78793          	add	a5,a5,1310 # 800006b0 <__sf+0x68>
    619a:	00f58563          	beq	a1,a5,61a4 <cleanup_stdio+0x2e>
    619e:	8522                	mv	a0,s0
    61a0:	659000ef          	jal	6ff8 <_fclose_r>
    61a4:	444c                	lw	a1,12(s0)
    61a6:	7fffa797          	auipc	a5,0x7fffa
    61aa:	57278793          	add	a5,a5,1394 # 80000718 <__sf+0xd0>
    61ae:	00f58863          	beq	a1,a5,61be <cleanup_stdio+0x48>
    61b2:	8522                	mv	a0,s0
    61b4:	4422                	lw	s0,8(sp)
    61b6:	40b2                	lw	ra,12(sp)
    61b8:	0141                	add	sp,sp,16
    61ba:	63f0006f          	j	6ff8 <_fclose_r>
    61be:	40b2                	lw	ra,12(sp)
    61c0:	4422                	lw	s0,8(sp)
    61c2:	0141                	add	sp,sp,16
    61c4:	8082                	ret

000061c6 <global_stdio_init.part.0>:
    61c6:	1101                	add	sp,sp,-32
    61c8:	00000797          	auipc	a5,0x0
    61cc:	f9478793          	add	a5,a5,-108 # 615c <stdio_exit_handler>
    61d0:	ce06                	sw	ra,28(sp)
    61d2:	cc22                	sw	s0,24(sp)
    61d4:	ca26                	sw	s1,20(sp)
    61d6:	7fffa417          	auipc	s0,0x7fffa
    61da:	47240413          	add	s0,s0,1138 # 80000648 <__sf>
    61de:	c84a                	sw	s2,16(sp)
    61e0:	c64e                	sw	s3,12(sp)
    61e2:	c452                	sw	s4,8(sp)
    61e4:	4621                	li	a2,8
    61e6:	4581                	li	a1,0
    61e8:	7fffa717          	auipc	a4,0x7fffa
    61ec:	3cf72023          	sw	a5,960(a4) # 800005a8 <__stdio_exit_handler>
    61f0:	7fffa517          	auipc	a0,0x7fffa
    61f4:	4b450513          	add	a0,a0,1204 # 800006a4 <__sf+0x5c>
    61f8:	4791                	li	a5,4
    61fa:	c45c                	sw	a5,12(s0)
    61fc:	00042023          	sw	zero,0(s0)
    6200:	00042223          	sw	zero,4(s0)
    6204:	00042423          	sw	zero,8(s0)
    6208:	06042223          	sw	zero,100(s0)
    620c:	00042823          	sw	zero,16(s0)
    6210:	00042a23          	sw	zero,20(s0)
    6214:	00042c23          	sw	zero,24(s0)
    6218:	9e3ff0ef          	jal	5bfa <memset>
    621c:	00000a17          	auipc	s4,0x0
    6220:	5cea0a13          	add	s4,s4,1486 # 67ea <__sread>
    6224:	00000997          	auipc	s3,0x0
    6228:	5fc98993          	add	s3,s3,1532 # 6820 <__swrite>
    622c:	00000917          	auipc	s2,0x0
    6230:	64490913          	add	s2,s2,1604 # 6870 <__sseek>
    6234:	00000497          	auipc	s1,0x0
    6238:	68448493          	add	s1,s1,1668 # 68b8 <__sclose>
    623c:	7fffa517          	auipc	a0,0x7fffa
    6240:	46450513          	add	a0,a0,1124 # 800006a0 <__sf+0x58>
    6244:	03442023          	sw	s4,32(s0)
    6248:	03342223          	sw	s3,36(s0)
    624c:	03242423          	sw	s2,40(s0)
    6250:	d444                	sw	s1,44(s0)
    6252:	cc40                	sw	s0,28(s0)
    6254:	8d3ff0ef          	jal	5b26 <__retarget_lock_init_recursive>
    6258:	67c1                	lui	a5,0x10
    625a:	07a5                	add	a5,a5,9 # 10009 <__neorv32_rom_size+0x9>
    625c:	4621                	li	a2,8
    625e:	4581                	li	a1,0
    6260:	7fffa517          	auipc	a0,0x7fffa
    6264:	4ac50513          	add	a0,a0,1196 # 8000070c <__sf+0xc4>
    6268:	d87c                	sw	a5,116(s0)
    626a:	06042423          	sw	zero,104(s0)
    626e:	06042623          	sw	zero,108(s0)
    6272:	06042823          	sw	zero,112(s0)
    6276:	0c042623          	sw	zero,204(s0)
    627a:	06042c23          	sw	zero,120(s0)
    627e:	06042e23          	sw	zero,124(s0)
    6282:	08042023          	sw	zero,128(s0)
    6286:	975ff0ef          	jal	5bfa <memset>
    628a:	7fffa797          	auipc	a5,0x7fffa
    628e:	42678793          	add	a5,a5,1062 # 800006b0 <__sf+0x68>
    6292:	7fffa517          	auipc	a0,0x7fffa
    6296:	47650513          	add	a0,a0,1142 # 80000708 <__sf+0xc0>
    629a:	08f42223          	sw	a5,132(s0)
    629e:	09442423          	sw	s4,136(s0)
    62a2:	09342623          	sw	s3,140(s0)
    62a6:	09242823          	sw	s2,144(s0)
    62aa:	08942a23          	sw	s1,148(s0)
    62ae:	879ff0ef          	jal	5b26 <__retarget_lock_init_recursive>
    62b2:	000207b7          	lui	a5,0x20
    62b6:	07c9                	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x10012>
    62b8:	4621                	li	a2,8
    62ba:	4581                	li	a1,0
    62bc:	7fffa517          	auipc	a0,0x7fffa
    62c0:	4b850513          	add	a0,a0,1208 # 80000774 <__sf+0x12c>
    62c4:	0cf42e23          	sw	a5,220(s0)
    62c8:	0c042823          	sw	zero,208(s0)
    62cc:	0c042a23          	sw	zero,212(s0)
    62d0:	0c042c23          	sw	zero,216(s0)
    62d4:	12042a23          	sw	zero,308(s0)
    62d8:	0e042023          	sw	zero,224(s0)
    62dc:	0e042223          	sw	zero,228(s0)
    62e0:	0e042423          	sw	zero,232(s0)
    62e4:	917ff0ef          	jal	5bfa <memset>
    62e8:	7fffa797          	auipc	a5,0x7fffa
    62ec:	43078793          	add	a5,a5,1072 # 80000718 <__sf+0xd0>
    62f0:	0f442823          	sw	s4,240(s0)
    62f4:	0f342a23          	sw	s3,244(s0)
    62f8:	0f242c23          	sw	s2,248(s0)
    62fc:	0e942e23          	sw	s1,252(s0)
    6300:	0ef42623          	sw	a5,236(s0)
    6304:	4462                	lw	s0,24(sp)
    6306:	40f2                	lw	ra,28(sp)
    6308:	44d2                	lw	s1,20(sp)
    630a:	4942                	lw	s2,16(sp)
    630c:	49b2                	lw	s3,12(sp)
    630e:	4a22                	lw	s4,8(sp)
    6310:	7fffa517          	auipc	a0,0x7fffa
    6314:	46050513          	add	a0,a0,1120 # 80000770 <__sf+0x128>
    6318:	6105                	add	sp,sp,32
    631a:	80dff06f          	j	5b26 <__retarget_lock_init_recursive>

0000631e <__sinit>:
    631e:	1141                	add	sp,sp,-16
    6320:	c422                	sw	s0,8(sp)
    6322:	842a                	mv	s0,a0
    6324:	7fffa517          	auipc	a0,0x7fffa
    6328:	28050513          	add	a0,a0,640 # 800005a4 <__lock___sfp_recursive_mutex>
    632c:	c606                	sw	ra,12(sp)
    632e:	ffcff0ef          	jal	5b2a <__retarget_lock_acquire_recursive>
    6332:	585c                	lw	a5,52(s0)
    6334:	eb99                	bnez	a5,634a <__sinit+0x2c>
    6336:	00000797          	auipc	a5,0x0
    633a:	e4078793          	add	a5,a5,-448 # 6176 <cleanup_stdio>
    633e:	d85c                	sw	a5,52(s0)
    6340:	7fffa797          	auipc	a5,0x7fffa
    6344:	2687a783          	lw	a5,616(a5) # 800005a8 <__stdio_exit_handler>
    6348:	cb91                	beqz	a5,635c <__sinit+0x3e>
    634a:	4422                	lw	s0,8(sp)
    634c:	40b2                	lw	ra,12(sp)
    634e:	7fffa517          	auipc	a0,0x7fffa
    6352:	25650513          	add	a0,a0,598 # 800005a4 <__lock___sfp_recursive_mutex>
    6356:	0141                	add	sp,sp,16
    6358:	fd4ff06f          	j	5b2c <__retarget_lock_release_recursive>
    635c:	35ad                	jal	61c6 <global_stdio_init.part.0>
    635e:	4422                	lw	s0,8(sp)
    6360:	40b2                	lw	ra,12(sp)
    6362:	7fffa517          	auipc	a0,0x7fffa
    6366:	24250513          	add	a0,a0,578 # 800005a4 <__lock___sfp_recursive_mutex>
    636a:	0141                	add	sp,sp,16
    636c:	fc0ff06f          	j	5b2c <__retarget_lock_release_recursive>

00006370 <__sfp_lock_acquire>:
    6370:	7fffa517          	auipc	a0,0x7fffa
    6374:	23450513          	add	a0,a0,564 # 800005a4 <__lock___sfp_recursive_mutex>
    6378:	fb2ff06f          	j	5b2a <__retarget_lock_acquire_recursive>

0000637c <__sfp_lock_release>:
    637c:	7fffa517          	auipc	a0,0x7fffa
    6380:	22850513          	add	a0,a0,552 # 800005a4 <__lock___sfp_recursive_mutex>
    6384:	fa8ff06f          	j	5b2c <__retarget_lock_release_recursive>

00006388 <__sfvwrite_r>:
    6388:	461c                	lw	a5,8(a2)
    638a:	1c078f63          	beqz	a5,6568 <__sfvwrite_r+0x1e0>
    638e:	00c59683          	lh	a3,12(a1)
    6392:	7179                	add	sp,sp,-48
    6394:	d422                	sw	s0,40(sp)
    6396:	cc52                	sw	s4,24(sp)
    6398:	c85a                	sw	s6,16(sp)
    639a:	d606                	sw	ra,44(sp)
    639c:	0086f793          	and	a5,a3,8
    63a0:	8b32                	mv	s6,a2
    63a2:	8a2a                	mv	s4,a0
    63a4:	842e                	mv	s0,a1
    63a6:	c7ad                	beqz	a5,6410 <__sfvwrite_r+0x88>
    63a8:	499c                	lw	a5,16(a1)
    63aa:	c3bd                	beqz	a5,6410 <__sfvwrite_r+0x88>
    63ac:	d226                	sw	s1,36(sp)
    63ae:	d04a                	sw	s2,32(sp)
    63b0:	ce4e                	sw	s3,28(sp)
    63b2:	ca56                	sw	s5,20(sp)
    63b4:	0026f793          	and	a5,a3,2
    63b8:	000b2483          	lw	s1,0(s6)
    63bc:	cbb5                	beqz	a5,6430 <__sfvwrite_r+0xa8>
    63be:	505c                	lw	a5,36(s0)
    63c0:	4c4c                	lw	a1,28(s0)
    63c2:	80000ab7          	lui	s5,0x80000
    63c6:	4981                	li	s3,0
    63c8:	4901                	li	s2,0
    63ca:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_rom_size+0x7ffefc00>
    63ce:	864e                	mv	a2,s3
    63d0:	8552                	mv	a0,s4
    63d2:	02090963          	beqz	s2,6404 <__sfvwrite_r+0x7c>
    63d6:	86ca                	mv	a3,s2
    63d8:	012af363          	bgeu	s5,s2,63de <__sfvwrite_r+0x56>
    63dc:	86d6                	mv	a3,s5
    63de:	9782                	jalr	a5
    63e0:	2ea05363          	blez	a0,66c6 <__sfvwrite_r+0x33e>
    63e4:	008b2783          	lw	a5,8(s6)
    63e8:	99aa                	add	s3,s3,a0
    63ea:	40a90933          	sub	s2,s2,a0
    63ee:	8f89                	sub	a5,a5,a0
    63f0:	00fb2423          	sw	a5,8(s6)
    63f4:	12078763          	beqz	a5,6522 <__sfvwrite_r+0x19a>
    63f8:	505c                	lw	a5,36(s0)
    63fa:	4c4c                	lw	a1,28(s0)
    63fc:	864e                	mv	a2,s3
    63fe:	8552                	mv	a0,s4
    6400:	fc091be3          	bnez	s2,63d6 <__sfvwrite_r+0x4e>
    6404:	0004a983          	lw	s3,0(s1)
    6408:	0044a903          	lw	s2,4(s1)
    640c:	04a1                	add	s1,s1,8
    640e:	b7c1                	j	63ce <__sfvwrite_r+0x46>
    6410:	85a2                	mv	a1,s0
    6412:	8552                	mv	a0,s4
    6414:	236d                	jal	69be <__swsetup_r>
    6416:	14051263          	bnez	a0,655a <__sfvwrite_r+0x1d2>
    641a:	00c41683          	lh	a3,12(s0)
    641e:	d226                	sw	s1,36(sp)
    6420:	d04a                	sw	s2,32(sp)
    6422:	ce4e                	sw	s3,28(sp)
    6424:	ca56                	sw	s5,20(sp)
    6426:	0026f793          	and	a5,a3,2
    642a:	000b2483          	lw	s1,0(s6)
    642e:	fbc1                	bnez	a5,63be <__sfvwrite_r+0x36>
    6430:	c65e                	sw	s7,12(sp)
    6432:	c462                	sw	s8,8(sp)
    6434:	0016f793          	and	a5,a3,1
    6438:	12079a63          	bnez	a5,656c <__sfvwrite_r+0x1e4>
    643c:	401c                	lw	a5,0(s0)
    643e:	4418                	lw	a4,8(s0)
    6440:	80000ab7          	lui	s5,0x80000
    6444:	c266                	sw	s9,4(sp)
    6446:	4b81                	li	s7,0
    6448:	4981                	li	s3,0
    644a:	1afd                	add	s5,s5,-1 # 7fffffff <__neorv32_rom_size+0x7ffeffff>
    644c:	853e                	mv	a0,a5
    644e:	8c3a                	mv	s8,a4
    6450:	0c098063          	beqz	s3,6510 <__sfvwrite_r+0x188>
    6454:	2006f613          	and	a2,a3,512
    6458:	1a060a63          	beqz	a2,660c <__sfvwrite_r+0x284>
    645c:	8cba                	mv	s9,a4
    645e:	20e9ec63          	bltu	s3,a4,6676 <__sfvwrite_r+0x2ee>
    6462:	4806f713          	and	a4,a3,1152
    6466:	cb25                	beqz	a4,64d6 <__sfvwrite_r+0x14e>
    6468:	4850                	lw	a2,20(s0)
    646a:	480c                	lw	a1,16(s0)
    646c:	00161713          	sll	a4,a2,0x1
    6470:	9732                	add	a4,a4,a2
    6472:	40b78933          	sub	s2,a5,a1
    6476:	01f75c13          	srl	s8,a4,0x1f
    647a:	9c3a                	add	s8,s8,a4
    647c:	00190793          	add	a5,s2,1
    6480:	401c5c13          	sra	s8,s8,0x1
    6484:	97ce                	add	a5,a5,s3
    6486:	8662                	mv	a2,s8
    6488:	00fc7463          	bgeu	s8,a5,6490 <__sfvwrite_r+0x108>
    648c:	8c3e                	mv	s8,a5
    648e:	863e                	mv	a2,a5
    6490:	4006f693          	and	a3,a3,1024
    6494:	20068163          	beqz	a3,6696 <__sfvwrite_r+0x30e>
    6498:	85b2                	mv	a1,a2
    649a:	8552                	mv	a0,s4
    649c:	faffe0ef          	jal	544a <_malloc_r>
    64a0:	8caa                	mv	s9,a0
    64a2:	22050563          	beqz	a0,66cc <__sfvwrite_r+0x344>
    64a6:	480c                	lw	a1,16(s0)
    64a8:	864a                	mv	a2,s2
    64aa:	ff8ff0ef          	jal	5ca2 <memcpy>
    64ae:	00c45783          	lhu	a5,12(s0)
    64b2:	b7f7f793          	and	a5,a5,-1153
    64b6:	0807e793          	or	a5,a5,128
    64ba:	00f41623          	sh	a5,12(s0)
    64be:	012c8533          	add	a0,s9,s2
    64c2:	412c07b3          	sub	a5,s8,s2
    64c6:	01942823          	sw	s9,16(s0)
    64ca:	01842a23          	sw	s8,20(s0)
    64ce:	c008                	sw	a0,0(s0)
    64d0:	8c4e                	mv	s8,s3
    64d2:	c41c                	sw	a5,8(s0)
    64d4:	8cce                	mv	s9,s3
    64d6:	8666                	mv	a2,s9
    64d8:	85de                	mv	a1,s7
    64da:	e54ff0ef          	jal	5b2e <memmove>
    64de:	4418                	lw	a4,8(s0)
    64e0:	401c                	lw	a5,0(s0)
    64e2:	894e                	mv	s2,s3
    64e4:	41870733          	sub	a4,a4,s8
    64e8:	97e6                	add	a5,a5,s9
    64ea:	c418                	sw	a4,8(s0)
    64ec:	c01c                	sw	a5,0(s0)
    64ee:	4981                	li	s3,0
    64f0:	008b2783          	lw	a5,8(s6)
    64f4:	9bca                	add	s7,s7,s2
    64f6:	412787b3          	sub	a5,a5,s2
    64fa:	00fb2423          	sw	a5,8(s6)
    64fe:	cf99                	beqz	a5,651c <__sfvwrite_r+0x194>
    6500:	401c                	lw	a5,0(s0)
    6502:	4418                	lw	a4,8(s0)
    6504:	00c41683          	lh	a3,12(s0)
    6508:	853e                	mv	a0,a5
    650a:	8c3a                	mv	s8,a4
    650c:	f40994e3          	bnez	s3,6454 <__sfvwrite_r+0xcc>
    6510:	0004ab83          	lw	s7,0(s1)
    6514:	0044a983          	lw	s3,4(s1)
    6518:	04a1                	add	s1,s1,8
    651a:	bf0d                	j	644c <__sfvwrite_r+0xc4>
    651c:	4bb2                	lw	s7,12(sp)
    651e:	4c22                	lw	s8,8(sp)
    6520:	4c92                	lw	s9,4(sp)
    6522:	50b2                	lw	ra,44(sp)
    6524:	5422                	lw	s0,40(sp)
    6526:	5492                	lw	s1,36(sp)
    6528:	5902                	lw	s2,32(sp)
    652a:	49f2                	lw	s3,28(sp)
    652c:	4ad2                	lw	s5,20(sp)
    652e:	4a62                	lw	s4,24(sp)
    6530:	4b42                	lw	s6,16(sp)
    6532:	4501                	li	a0,0
    6534:	6145                	add	sp,sp,48
    6536:	8082                	ret
    6538:	85a2                	mv	a1,s0
    653a:	8552                	mv	a0,s4
    653c:	537000ef          	jal	7272 <_fflush_r>
    6540:	c93d                	beqz	a0,65b6 <__sfvwrite_r+0x22e>
    6542:	00c41783          	lh	a5,12(s0)
    6546:	4bb2                	lw	s7,12(sp)
    6548:	4c22                	lw	s8,8(sp)
    654a:	5492                	lw	s1,36(sp)
    654c:	5902                	lw	s2,32(sp)
    654e:	49f2                	lw	s3,28(sp)
    6550:	4ad2                	lw	s5,20(sp)
    6552:	0407e793          	or	a5,a5,64
    6556:	00f41623          	sh	a5,12(s0)
    655a:	50b2                	lw	ra,44(sp)
    655c:	5422                	lw	s0,40(sp)
    655e:	4a62                	lw	s4,24(sp)
    6560:	4b42                	lw	s6,16(sp)
    6562:	557d                	li	a0,-1
    6564:	6145                	add	sp,sp,48
    6566:	8082                	ret
    6568:	4501                	li	a0,0
    656a:	8082                	ret
    656c:	4a81                	li	s5,0
    656e:	4501                	li	a0,0
    6570:	4c01                	li	s8,0
    6572:	4981                	li	s3,0
    6574:	04098e63          	beqz	s3,65d0 <__sfvwrite_r+0x248>
    6578:	c525                	beqz	a0,65e0 <__sfvwrite_r+0x258>
    657a:	87d6                	mv	a5,s5
    657c:	8bce                	mv	s7,s3
    657e:	0137f363          	bgeu	a5,s3,6584 <__sfvwrite_r+0x1fc>
    6582:	8bbe                	mv	s7,a5
    6584:	4008                	lw	a0,0(s0)
    6586:	481c                	lw	a5,16(s0)
    6588:	00842903          	lw	s2,8(s0)
    658c:	4854                	lw	a3,20(s0)
    658e:	00a7f563          	bgeu	a5,a0,6598 <__sfvwrite_r+0x210>
    6592:	9936                	add	s2,s2,a3
    6594:	05794f63          	blt	s2,s7,65f2 <__sfvwrite_r+0x26a>
    6598:	0edbc263          	blt	s7,a3,667c <__sfvwrite_r+0x2f4>
    659c:	505c                	lw	a5,36(s0)
    659e:	4c4c                	lw	a1,28(s0)
    65a0:	8662                	mv	a2,s8
    65a2:	8552                	mv	a0,s4
    65a4:	9782                	jalr	a5
    65a6:	892a                	mv	s2,a0
    65a8:	f8a05de3          	blez	a0,6542 <__sfvwrite_r+0x1ba>
    65ac:	412a8ab3          	sub	s5,s5,s2
    65b0:	4505                	li	a0,1
    65b2:	f80a83e3          	beqz	s5,6538 <__sfvwrite_r+0x1b0>
    65b6:	008b2783          	lw	a5,8(s6)
    65ba:	9c4a                	add	s8,s8,s2
    65bc:	412989b3          	sub	s3,s3,s2
    65c0:	412787b3          	sub	a5,a5,s2
    65c4:	00fb2423          	sw	a5,8(s6)
    65c8:	f7d5                	bnez	a5,6574 <__sfvwrite_r+0x1ec>
    65ca:	4bb2                	lw	s7,12(sp)
    65cc:	4c22                	lw	s8,8(sp)
    65ce:	bf91                	j	6522 <__sfvwrite_r+0x19a>
    65d0:	0044a983          	lw	s3,4(s1)
    65d4:	87a6                	mv	a5,s1
    65d6:	04a1                	add	s1,s1,8
    65d8:	fe098ce3          	beqz	s3,65d0 <__sfvwrite_r+0x248>
    65dc:	0007ac03          	lw	s8,0(a5)
    65e0:	864e                	mv	a2,s3
    65e2:	45a9                	li	a1,10
    65e4:	8562                	mv	a0,s8
    65e6:	295d                	jal	6a9c <memchr>
    65e8:	c979                	beqz	a0,66be <__sfvwrite_r+0x336>
    65ea:	0505                	add	a0,a0,1
    65ec:	41850ab3          	sub	s5,a0,s8
    65f0:	b769                	j	657a <__sfvwrite_r+0x1f2>
    65f2:	85e2                	mv	a1,s8
    65f4:	864a                	mv	a2,s2
    65f6:	d38ff0ef          	jal	5b2e <memmove>
    65fa:	401c                	lw	a5,0(s0)
    65fc:	85a2                	mv	a1,s0
    65fe:	8552                	mv	a0,s4
    6600:	97ca                	add	a5,a5,s2
    6602:	c01c                	sw	a5,0(s0)
    6604:	46f000ef          	jal	7272 <_fflush_r>
    6608:	d155                	beqz	a0,65ac <__sfvwrite_r+0x224>
    660a:	bf25                	j	6542 <__sfvwrite_r+0x1ba>
    660c:	4814                	lw	a3,16(s0)
    660e:	02f6e863          	bltu	a3,a5,663e <__sfvwrite_r+0x2b6>
    6612:	4850                	lw	a2,20(s0)
    6614:	02c9e563          	bltu	s3,a2,663e <__sfvwrite_r+0x2b6>
    6618:	87ce                	mv	a5,s3
    661a:	013af363          	bgeu	s5,s3,6620 <__sfvwrite_r+0x298>
    661e:	87d6                	mv	a5,s5
    6620:	02c7e6b3          	rem	a3,a5,a2
    6624:	5058                	lw	a4,36(s0)
    6626:	4c4c                	lw	a1,28(s0)
    6628:	865e                	mv	a2,s7
    662a:	8552                	mv	a0,s4
    662c:	40d786b3          	sub	a3,a5,a3
    6630:	9702                	jalr	a4
    6632:	892a                	mv	s2,a0
    6634:	02a05b63          	blez	a0,666a <__sfvwrite_r+0x2e2>
    6638:	412989b3          	sub	s3,s3,s2
    663c:	bd55                	j	64f0 <__sfvwrite_r+0x168>
    663e:	893a                	mv	s2,a4
    6640:	00e9f363          	bgeu	s3,a4,6646 <__sfvwrite_r+0x2be>
    6644:	894e                	mv	s2,s3
    6646:	853e                	mv	a0,a5
    6648:	864a                	mv	a2,s2
    664a:	85de                	mv	a1,s7
    664c:	ce2ff0ef          	jal	5b2e <memmove>
    6650:	4418                	lw	a4,8(s0)
    6652:	401c                	lw	a5,0(s0)
    6654:	41270733          	sub	a4,a4,s2
    6658:	97ca                	add	a5,a5,s2
    665a:	c418                	sw	a4,8(s0)
    665c:	c01c                	sw	a5,0(s0)
    665e:	ff69                	bnez	a4,6638 <__sfvwrite_r+0x2b0>
    6660:	85a2                	mv	a1,s0
    6662:	8552                	mv	a0,s4
    6664:	40f000ef          	jal	7272 <_fflush_r>
    6668:	d961                	beqz	a0,6638 <__sfvwrite_r+0x2b0>
    666a:	00c41783          	lh	a5,12(s0)
    666e:	4bb2                	lw	s7,12(sp)
    6670:	4c22                	lw	s8,8(sp)
    6672:	4c92                	lw	s9,4(sp)
    6674:	bdd9                	j	654a <__sfvwrite_r+0x1c2>
    6676:	8c4e                	mv	s8,s3
    6678:	8cce                	mv	s9,s3
    667a:	bdb1                	j	64d6 <__sfvwrite_r+0x14e>
    667c:	865e                	mv	a2,s7
    667e:	85e2                	mv	a1,s8
    6680:	caeff0ef          	jal	5b2e <memmove>
    6684:	4418                	lw	a4,8(s0)
    6686:	401c                	lw	a5,0(s0)
    6688:	895e                	mv	s2,s7
    668a:	41770733          	sub	a4,a4,s7
    668e:	97de                	add	a5,a5,s7
    6690:	c418                	sw	a4,8(s0)
    6692:	c01c                	sw	a5,0(s0)
    6694:	bf21                	j	65ac <__sfvwrite_r+0x224>
    6696:	8552                	mv	a0,s4
    6698:	2351                	jal	6c1c <_realloc_r>
    669a:	8caa                	mv	s9,a0
    669c:	e20511e3          	bnez	a0,64be <__sfvwrite_r+0x136>
    66a0:	480c                	lw	a1,16(s0)
    66a2:	8552                	mv	a0,s4
    66a4:	883ff0ef          	jal	5f26 <_free_r>
    66a8:	00c41783          	lh	a5,12(s0)
    66ac:	4731                	li	a4,12
    66ae:	4bb2                	lw	s7,12(sp)
    66b0:	4c22                	lw	s8,8(sp)
    66b2:	4c92                	lw	s9,4(sp)
    66b4:	00ea2023          	sw	a4,0(s4)
    66b8:	f7f7f793          	and	a5,a5,-129
    66bc:	b579                	j	654a <__sfvwrite_r+0x1c2>
    66be:	00198793          	add	a5,s3,1
    66c2:	8abe                	mv	s5,a5
    66c4:	bd65                	j	657c <__sfvwrite_r+0x1f4>
    66c6:	00c41783          	lh	a5,12(s0)
    66ca:	b541                	j	654a <__sfvwrite_r+0x1c2>
    66cc:	4731                	li	a4,12
    66ce:	00c41783          	lh	a5,12(s0)
    66d2:	4bb2                	lw	s7,12(sp)
    66d4:	4c22                	lw	s8,8(sp)
    66d6:	4c92                	lw	s9,4(sp)
    66d8:	00ea2023          	sw	a4,0(s4)
    66dc:	b5bd                	j	654a <__sfvwrite_r+0x1c2>

000066de <_fwalk_sglue>:
    66de:	7179                	add	sp,sp,-48
    66e0:	d04a                	sw	s2,32(sp)
    66e2:	ce4e                	sw	s3,28(sp)
    66e4:	cc52                	sw	s4,24(sp)
    66e6:	ca56                	sw	s5,20(sp)
    66e8:	c85a                	sw	s6,16(sp)
    66ea:	c65e                	sw	s7,12(sp)
    66ec:	d606                	sw	ra,44(sp)
    66ee:	d422                	sw	s0,40(sp)
    66f0:	d226                	sw	s1,36(sp)
    66f2:	8b2a                	mv	s6,a0
    66f4:	8bae                	mv	s7,a1
    66f6:	8ab2                	mv	s5,a2
    66f8:	4a01                	li	s4,0
    66fa:	4985                	li	s3,1
    66fc:	597d                	li	s2,-1
    66fe:	004aa483          	lw	s1,4(s5)
    6702:	008aa403          	lw	s0,8(s5)
    6706:	14fd                	add	s1,s1,-1
    6708:	0204c463          	bltz	s1,6730 <_fwalk_sglue+0x52>
    670c:	00c45783          	lhu	a5,12(s0)
    6710:	00f9fb63          	bgeu	s3,a5,6726 <_fwalk_sglue+0x48>
    6714:	00e41783          	lh	a5,14(s0)
    6718:	85a2                	mv	a1,s0
    671a:	855a                	mv	a0,s6
    671c:	01278563          	beq	a5,s2,6726 <_fwalk_sglue+0x48>
    6720:	9b82                	jalr	s7
    6722:	00aa6a33          	or	s4,s4,a0
    6726:	14fd                	add	s1,s1,-1
    6728:	06840413          	add	s0,s0,104
    672c:	ff2490e3          	bne	s1,s2,670c <_fwalk_sglue+0x2e>
    6730:	000aaa83          	lw	s5,0(s5)
    6734:	fc0a95e3          	bnez	s5,66fe <_fwalk_sglue+0x20>
    6738:	50b2                	lw	ra,44(sp)
    673a:	5422                	lw	s0,40(sp)
    673c:	5492                	lw	s1,36(sp)
    673e:	5902                	lw	s2,32(sp)
    6740:	49f2                	lw	s3,28(sp)
    6742:	4ad2                	lw	s5,20(sp)
    6744:	4b42                	lw	s6,16(sp)
    6746:	4bb2                	lw	s7,12(sp)
    6748:	8552                	mv	a0,s4
    674a:	4a62                	lw	s4,24(sp)
    674c:	6145                	add	sp,sp,48
    674e:	8082                	ret

00006750 <_putc_r>:
    6750:	1101                	add	sp,sp,-32
    6752:	cc22                	sw	s0,24(sp)
    6754:	ca4a                	sw	s2,20(sp)
    6756:	ce06                	sw	ra,28(sp)
    6758:	892a                	mv	s2,a0
    675a:	8432                	mv	s0,a2
    675c:	c119                	beqz	a0,6762 <_putc_r+0x12>
    675e:	595c                	lw	a5,52(a0)
    6760:	c3c1                	beqz	a5,67e0 <_putc_r+0x90>
    6762:	507c                	lw	a5,100(s0)
    6764:	8b85                	and	a5,a5,1
    6766:	e791                	bnez	a5,6772 <_putc_r+0x22>
    6768:	00c45783          	lhu	a5,12(s0)
    676c:	2007f793          	and	a5,a5,512
    6770:	cba9                	beqz	a5,67c2 <_putc_r+0x72>
    6772:	441c                	lw	a5,8(s0)
    6774:	17fd                	add	a5,a5,-1
    6776:	c41c                	sw	a5,8(s0)
    6778:	0007da63          	bgez	a5,678c <_putc_r+0x3c>
    677c:	4c18                	lw	a4,24(s0)
    677e:	02e7cd63          	blt	a5,a4,67b8 <_putc_r+0x68>
    6782:	0ff5f793          	zext.b	a5,a1
    6786:	4729                	li	a4,10
    6788:	02e78863          	beq	a5,a4,67b8 <_putc_r+0x68>
    678c:	401c                	lw	a5,0(s0)
    678e:	0ff5f913          	zext.b	s2,a1
    6792:	00178713          	add	a4,a5,1
    6796:	c018                	sw	a4,0(s0)
    6798:	00b78023          	sb	a1,0(a5)
    679c:	507c                	lw	a5,100(s0)
    679e:	8b85                	and	a5,a5,1
    67a0:	e791                	bnez	a5,67ac <_putc_r+0x5c>
    67a2:	00c45783          	lhu	a5,12(s0)
    67a6:	2007f793          	and	a5,a5,512
    67aa:	c395                	beqz	a5,67ce <_putc_r+0x7e>
    67ac:	40f2                	lw	ra,28(sp)
    67ae:	4462                	lw	s0,24(sp)
    67b0:	854a                	mv	a0,s2
    67b2:	4952                	lw	s2,20(sp)
    67b4:	6105                	add	sp,sp,32
    67b6:	8082                	ret
    67b8:	854a                	mv	a0,s2
    67ba:	8622                	mv	a2,s0
    67bc:	2209                	jal	68be <__swbuf_r>
    67be:	892a                	mv	s2,a0
    67c0:	bff1                	j	679c <_putc_r+0x4c>
    67c2:	4c28                	lw	a0,88(s0)
    67c4:	c62e                	sw	a1,12(sp)
    67c6:	b64ff0ef          	jal	5b2a <__retarget_lock_acquire_recursive>
    67ca:	45b2                	lw	a1,12(sp)
    67cc:	b75d                	j	6772 <_putc_r+0x22>
    67ce:	4c28                	lw	a0,88(s0)
    67d0:	b5cff0ef          	jal	5b2c <__retarget_lock_release_recursive>
    67d4:	40f2                	lw	ra,28(sp)
    67d6:	4462                	lw	s0,24(sp)
    67d8:	854a                	mv	a0,s2
    67da:	4952                	lw	s2,20(sp)
    67dc:	6105                	add	sp,sp,32
    67de:	8082                	ret
    67e0:	c62e                	sw	a1,12(sp)
    67e2:	b3dff0ef          	jal	631e <__sinit>
    67e6:	45b2                	lw	a1,12(sp)
    67e8:	bfad                	j	6762 <_putc_r+0x12>

000067ea <__sread>:
    67ea:	1141                	add	sp,sp,-16
    67ec:	c422                	sw	s0,8(sp)
    67ee:	842e                	mv	s0,a1
    67f0:	00e59583          	lh	a1,14(a1)
    67f4:	c606                	sw	ra,12(sp)
    67f6:	266d                	jal	6ba0 <_read_r>
    67f8:	00054963          	bltz	a0,680a <__sread+0x20>
    67fc:	483c                	lw	a5,80(s0)
    67fe:	40b2                	lw	ra,12(sp)
    6800:	97aa                	add	a5,a5,a0
    6802:	c83c                	sw	a5,80(s0)
    6804:	4422                	lw	s0,8(sp)
    6806:	0141                	add	sp,sp,16
    6808:	8082                	ret
    680a:	00c45783          	lhu	a5,12(s0)
    680e:	777d                	lui	a4,0xfffff
    6810:	177d                	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7fffb000>
    6812:	8ff9                	and	a5,a5,a4
    6814:	40b2                	lw	ra,12(sp)
    6816:	00f41623          	sh	a5,12(s0)
    681a:	4422                	lw	s0,8(sp)
    681c:	0141                	add	sp,sp,16
    681e:	8082                	ret

00006820 <__swrite>:
    6820:	00c59783          	lh	a5,12(a1)
    6824:	1101                	add	sp,sp,-32
    6826:	cc22                	sw	s0,24(sp)
    6828:	ca26                	sw	s1,20(sp)
    682a:	c84a                	sw	s2,16(sp)
    682c:	c64e                	sw	s3,12(sp)
    682e:	ce06                	sw	ra,28(sp)
    6830:	1007f713          	and	a4,a5,256
    6834:	842e                	mv	s0,a1
    6836:	84aa                	mv	s1,a0
    6838:	8932                	mv	s2,a2
    683a:	89b6                	mv	s3,a3
    683c:	e315                	bnez	a4,6860 <__swrite+0x40>
    683e:	777d                	lui	a4,0xfffff
    6840:	177d                	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7fffb000>
    6842:	8ff9                	and	a5,a5,a4
    6844:	00e41583          	lh	a1,14(s0)
    6848:	00f41623          	sh	a5,12(s0)
    684c:	4462                	lw	s0,24(sp)
    684e:	40f2                	lw	ra,28(sp)
    6850:	86ce                	mv	a3,s3
    6852:	864a                	mv	a2,s2
    6854:	49b2                	lw	s3,12(sp)
    6856:	4942                	lw	s2,16(sp)
    6858:	8526                	mv	a0,s1
    685a:	44d2                	lw	s1,20(sp)
    685c:	6105                	add	sp,sp,32
    685e:	a641                	j	6bde <_write_r>
    6860:	00e59583          	lh	a1,14(a1)
    6864:	4689                	li	a3,2
    6866:	4601                	li	a2,0
    6868:	2ced                	jal	6b62 <_lseek_r>
    686a:	00c41783          	lh	a5,12(s0)
    686e:	bfc1                	j	683e <__swrite+0x1e>

00006870 <__sseek>:
    6870:	1141                	add	sp,sp,-16
    6872:	c422                	sw	s0,8(sp)
    6874:	842e                	mv	s0,a1
    6876:	00e59583          	lh	a1,14(a1)
    687a:	c606                	sw	ra,12(sp)
    687c:	24dd                	jal	6b62 <_lseek_r>
    687e:	57fd                	li	a5,-1
    6880:	00f50f63          	beq	a0,a5,689e <__sseek+0x2e>
    6884:	00c45783          	lhu	a5,12(s0)
    6888:	6705                	lui	a4,0x1
    688a:	40b2                	lw	ra,12(sp)
    688c:	8fd9                	or	a5,a5,a4
    688e:	07c2                	sll	a5,a5,0x10
    6890:	87c1                	sra	a5,a5,0x10
    6892:	c828                	sw	a0,80(s0)
    6894:	00f41623          	sh	a5,12(s0)
    6898:	4422                	lw	s0,8(sp)
    689a:	0141                	add	sp,sp,16
    689c:	8082                	ret
    689e:	00c45783          	lhu	a5,12(s0)
    68a2:	777d                	lui	a4,0xfffff
    68a4:	177d                	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7fffb000>
    68a6:	8ff9                	and	a5,a5,a4
    68a8:	07c2                	sll	a5,a5,0x10
    68aa:	87c1                	sra	a5,a5,0x10
    68ac:	40b2                	lw	ra,12(sp)
    68ae:	00f41623          	sh	a5,12(s0)
    68b2:	4422                	lw	s0,8(sp)
    68b4:	0141                	add	sp,sp,16
    68b6:	8082                	ret

000068b8 <__sclose>:
    68b8:	00e59583          	lh	a1,14(a1)
    68bc:	a4bd                	j	6b2a <_close_r>

000068be <__swbuf_r>:
    68be:	1101                	add	sp,sp,-32
    68c0:	cc22                	sw	s0,24(sp)
    68c2:	ca26                	sw	s1,20(sp)
    68c4:	c84a                	sw	s2,16(sp)
    68c6:	ce06                	sw	ra,28(sp)
    68c8:	892a                	mv	s2,a0
    68ca:	84ae                	mv	s1,a1
    68cc:	8432                	mv	s0,a2
    68ce:	c119                	beqz	a0,68d4 <__swbuf_r+0x16>
    68d0:	595c                	lw	a5,52(a0)
    68d2:	c3fd                	beqz	a5,69b8 <__swbuf_r+0xfa>
    68d4:	4c1c                	lw	a5,24(s0)
    68d6:	00c41703          	lh	a4,12(s0)
    68da:	c41c                	sw	a5,8(s0)
    68dc:	00877793          	and	a5,a4,8
    68e0:	cbb1                	beqz	a5,6934 <__swbuf_r+0x76>
    68e2:	481c                	lw	a5,16(s0)
    68e4:	cba1                	beqz	a5,6934 <__swbuf_r+0x76>
    68e6:	c64e                	sw	s3,12(sp)
    68e8:	01271693          	sll	a3,a4,0x12
    68ec:	0ff4f993          	zext.b	s3,s1
    68f0:	0ff4f493          	zext.b	s1,s1
    68f4:	0606d063          	bgez	a3,6954 <__swbuf_r+0x96>
    68f8:	4018                	lw	a4,0(s0)
    68fa:	4854                	lw	a3,20(s0)
    68fc:	40f707b3          	sub	a5,a4,a5
    6900:	06d7d963          	bge	a5,a3,6972 <__swbuf_r+0xb4>
    6904:	4414                	lw	a3,8(s0)
    6906:	00170613          	add	a2,a4,1
    690a:	c010                	sw	a2,0(s0)
    690c:	16fd                	add	a3,a3,-1
    690e:	c414                	sw	a3,8(s0)
    6910:	01370023          	sb	s3,0(a4)
    6914:	4858                	lw	a4,20(s0)
    6916:	0785                	add	a5,a5,1
    6918:	06f70f63          	beq	a4,a5,6996 <__swbuf_r+0xd8>
    691c:	00c45783          	lhu	a5,12(s0)
    6920:	8b85                	and	a5,a5,1
    6922:	e3d1                	bnez	a5,69a6 <__swbuf_r+0xe8>
    6924:	49b2                	lw	s3,12(sp)
    6926:	40f2                	lw	ra,28(sp)
    6928:	4462                	lw	s0,24(sp)
    692a:	4942                	lw	s2,16(sp)
    692c:	8526                	mv	a0,s1
    692e:	44d2                	lw	s1,20(sp)
    6930:	6105                	add	sp,sp,32
    6932:	8082                	ret
    6934:	85a2                	mv	a1,s0
    6936:	854a                	mv	a0,s2
    6938:	2059                	jal	69be <__swsetup_r>
    693a:	e525                	bnez	a0,69a2 <__swbuf_r+0xe4>
    693c:	00c41703          	lh	a4,12(s0)
    6940:	c64e                	sw	s3,12(sp)
    6942:	481c                	lw	a5,16(s0)
    6944:	01271693          	sll	a3,a4,0x12
    6948:	0ff4f993          	zext.b	s3,s1
    694c:	0ff4f493          	zext.b	s1,s1
    6950:	fa06c4e3          	bltz	a3,68f8 <__swbuf_r+0x3a>
    6954:	5074                	lw	a3,100(s0)
    6956:	7679                	lui	a2,0xffffe
    6958:	6589                	lui	a1,0x2
    695a:	8f4d                	or	a4,a4,a1
    695c:	167d                	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7fffa000>
    695e:	8ef1                	and	a3,a3,a2
    6960:	00e41623          	sh	a4,12(s0)
    6964:	4018                	lw	a4,0(s0)
    6966:	d074                	sw	a3,100(s0)
    6968:	4854                	lw	a3,20(s0)
    696a:	40f707b3          	sub	a5,a4,a5
    696e:	f8d7cbe3          	blt	a5,a3,6904 <__swbuf_r+0x46>
    6972:	85a2                	mv	a1,s0
    6974:	854a                	mv	a0,s2
    6976:	0fd000ef          	jal	7272 <_fflush_r>
    697a:	e11d                	bnez	a0,69a0 <__swbuf_r+0xe2>
    697c:	4018                	lw	a4,0(s0)
    697e:	4414                	lw	a3,8(s0)
    6980:	4785                	li	a5,1
    6982:	00170613          	add	a2,a4,1
    6986:	16fd                	add	a3,a3,-1
    6988:	c010                	sw	a2,0(s0)
    698a:	c414                	sw	a3,8(s0)
    698c:	01370023          	sb	s3,0(a4)
    6990:	4858                	lw	a4,20(s0)
    6992:	f8f715e3          	bne	a4,a5,691c <__swbuf_r+0x5e>
    6996:	85a2                	mv	a1,s0
    6998:	854a                	mv	a0,s2
    699a:	0d9000ef          	jal	7272 <_fflush_r>
    699e:	d159                	beqz	a0,6924 <__swbuf_r+0x66>
    69a0:	49b2                	lw	s3,12(sp)
    69a2:	54fd                	li	s1,-1
    69a4:	b749                	j	6926 <__swbuf_r+0x68>
    69a6:	47a9                	li	a5,10
    69a8:	f6f49ee3          	bne	s1,a5,6924 <__swbuf_r+0x66>
    69ac:	85a2                	mv	a1,s0
    69ae:	854a                	mv	a0,s2
    69b0:	0c3000ef          	jal	7272 <_fflush_r>
    69b4:	d925                	beqz	a0,6924 <__swbuf_r+0x66>
    69b6:	b7ed                	j	69a0 <__swbuf_r+0xe2>
    69b8:	967ff0ef          	jal	631e <__sinit>
    69bc:	bf21                	j	68d4 <__swbuf_r+0x16>

000069be <__swsetup_r>:
    69be:	1141                	add	sp,sp,-16
    69c0:	c422                	sw	s0,8(sp)
    69c2:	c226                	sw	s1,4(sp)
    69c4:	c606                	sw	ra,12(sp)
    69c6:	7fffa797          	auipc	a5,0x7fffa
    69ca:	b9e7a783          	lw	a5,-1122(a5) # 80000564 <_impure_ptr>
    69ce:	84aa                	mv	s1,a0
    69d0:	842e                	mv	s0,a1
    69d2:	c399                	beqz	a5,69d8 <__swsetup_r+0x1a>
    69d4:	5bd8                	lw	a4,52(a5)
    69d6:	c75d                	beqz	a4,6a84 <__swsetup_r+0xc6>
    69d8:	00c41783          	lh	a5,12(s0)
    69dc:	0087f713          	and	a4,a5,8
    69e0:	c721                	beqz	a4,6a28 <__swsetup_r+0x6a>
    69e2:	4818                	lw	a4,16(s0)
    69e4:	cf31                	beqz	a4,6a40 <__swsetup_r+0x82>
    69e6:	0017f693          	and	a3,a5,1
    69ea:	ce91                	beqz	a3,6a06 <__swsetup_r+0x48>
    69ec:	4854                	lw	a3,20(s0)
    69ee:	00042423          	sw	zero,8(s0)
    69f2:	4501                	li	a0,0
    69f4:	40d006b3          	neg	a3,a3
    69f8:	cc14                	sw	a3,24(s0)
    69fa:	cf11                	beqz	a4,6a16 <__swsetup_r+0x58>
    69fc:	40b2                	lw	ra,12(sp)
    69fe:	4422                	lw	s0,8(sp)
    6a00:	4492                	lw	s1,4(sp)
    6a02:	0141                	add	sp,sp,16
    6a04:	8082                	ret
    6a06:	0027f693          	and	a3,a5,2
    6a0a:	4601                	li	a2,0
    6a0c:	e291                	bnez	a3,6a10 <__swsetup_r+0x52>
    6a0e:	4850                	lw	a2,20(s0)
    6a10:	c410                	sw	a2,8(s0)
    6a12:	4501                	li	a0,0
    6a14:	f765                	bnez	a4,69fc <__swsetup_r+0x3e>
    6a16:	0807f713          	and	a4,a5,128
    6a1a:	d36d                	beqz	a4,69fc <__swsetup_r+0x3e>
    6a1c:	0407e793          	or	a5,a5,64
    6a20:	00f41623          	sh	a5,12(s0)
    6a24:	557d                	li	a0,-1
    6a26:	bfd9                	j	69fc <__swsetup_r+0x3e>
    6a28:	0107f713          	and	a4,a5,16
    6a2c:	c325                	beqz	a4,6a8c <__swsetup_r+0xce>
    6a2e:	0047f713          	and	a4,a5,4
    6a32:	e70d                	bnez	a4,6a5c <__swsetup_r+0x9e>
    6a34:	4818                	lw	a4,16(s0)
    6a36:	0087e793          	or	a5,a5,8
    6a3a:	00f41623          	sh	a5,12(s0)
    6a3e:	f745                	bnez	a4,69e6 <__swsetup_r+0x28>
    6a40:	2807f693          	and	a3,a5,640
    6a44:	20000613          	li	a2,512
    6a48:	f8c68fe3          	beq	a3,a2,69e6 <__swsetup_r+0x28>
    6a4c:	85a2                	mv	a1,s0
    6a4e:	8526                	mv	a0,s1
    6a50:	0a5000ef          	jal	72f4 <__smakebuf_r>
    6a54:	00c41783          	lh	a5,12(s0)
    6a58:	4818                	lw	a4,16(s0)
    6a5a:	b771                	j	69e6 <__swsetup_r+0x28>
    6a5c:	580c                	lw	a1,48(s0)
    6a5e:	cd81                	beqz	a1,6a76 <__swsetup_r+0xb8>
    6a60:	04040713          	add	a4,s0,64
    6a64:	00e58763          	beq	a1,a4,6a72 <__swsetup_r+0xb4>
    6a68:	8526                	mv	a0,s1
    6a6a:	cbcff0ef          	jal	5f26 <_free_r>
    6a6e:	00c41783          	lh	a5,12(s0)
    6a72:	02042823          	sw	zero,48(s0)
    6a76:	4818                	lw	a4,16(s0)
    6a78:	fdb7f793          	and	a5,a5,-37
    6a7c:	00042223          	sw	zero,4(s0)
    6a80:	c018                	sw	a4,0(s0)
    6a82:	bf55                	j	6a36 <__swsetup_r+0x78>
    6a84:	853e                	mv	a0,a5
    6a86:	899ff0ef          	jal	631e <__sinit>
    6a8a:	b7b9                	j	69d8 <__swsetup_r+0x1a>
    6a8c:	4725                	li	a4,9
    6a8e:	c098                	sw	a4,0(s1)
    6a90:	0407e793          	or	a5,a5,64
    6a94:	00f41623          	sh	a5,12(s0)
    6a98:	557d                	li	a0,-1
    6a9a:	b78d                	j	69fc <__swsetup_r+0x3e>

00006a9c <memchr>:
    6a9c:	00357793          	and	a5,a0,3
    6aa0:	0ff5f693          	zext.b	a3,a1
    6aa4:	c395                	beqz	a5,6ac8 <memchr+0x2c>
    6aa6:	fff60793          	add	a5,a2,-1
    6aaa:	c605                	beqz	a2,6ad2 <memchr+0x36>
    6aac:	567d                	li	a2,-1
    6aae:	a801                	j	6abe <memchr+0x22>
    6ab0:	0505                	add	a0,a0,1
    6ab2:	00357713          	and	a4,a0,3
    6ab6:	cb11                	beqz	a4,6aca <memchr+0x2e>
    6ab8:	17fd                	add	a5,a5,-1
    6aba:	00c78c63          	beq	a5,a2,6ad2 <memchr+0x36>
    6abe:	00054703          	lbu	a4,0(a0)
    6ac2:	fed717e3          	bne	a4,a3,6ab0 <memchr+0x14>
    6ac6:	8082                	ret
    6ac8:	87b2                	mv	a5,a2
    6aca:	470d                	li	a4,3
    6acc:	00f76563          	bltu	a4,a5,6ad6 <memchr+0x3a>
    6ad0:	e3b9                	bnez	a5,6b16 <memchr+0x7a>
    6ad2:	4501                	li	a0,0
    6ad4:	8082                	ret
    6ad6:	0ff5f593          	zext.b	a1,a1
    6ada:	00859713          	sll	a4,a1,0x8
    6ade:	95ba                	add	a1,a1,a4
    6ae0:	01059713          	sll	a4,a1,0x10
    6ae4:	feff08b7          	lui	a7,0xfeff0
    6ae8:	80808837          	lui	a6,0x80808
    6aec:	95ba                	add	a1,a1,a4
    6aee:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7efebf00>
    6af2:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x804081>
    6af6:	430d                	li	t1,3
    6af8:	a029                	j	6b02 <memchr+0x66>
    6afa:	17f1                	add	a5,a5,-4
    6afc:	0511                	add	a0,a0,4
    6afe:	fcf379e3          	bgeu	t1,a5,6ad0 <memchr+0x34>
    6b02:	4118                	lw	a4,0(a0)
    6b04:	8f2d                	xor	a4,a4,a1
    6b06:	01170633          	add	a2,a4,a7
    6b0a:	fff74713          	not	a4,a4
    6b0e:	8f71                	and	a4,a4,a2
    6b10:	01077733          	and	a4,a4,a6
    6b14:	d37d                	beqz	a4,6afa <memchr+0x5e>
    6b16:	97aa                	add	a5,a5,a0
    6b18:	a021                	j	6b20 <memchr+0x84>
    6b1a:	0505                	add	a0,a0,1
    6b1c:	faa78be3          	beq	a5,a0,6ad2 <memchr+0x36>
    6b20:	00054703          	lbu	a4,0(a0)
    6b24:	fed71be3          	bne	a4,a3,6b1a <memchr+0x7e>
    6b28:	8082                	ret

00006b2a <_close_r>:
    6b2a:	1141                	add	sp,sp,-16
    6b2c:	c422                	sw	s0,8(sp)
    6b2e:	842a                	mv	s0,a0
    6b30:	852e                	mv	a0,a1
    6b32:	7fffa797          	auipc	a5,0x7fffa
    6b36:	a607a523          	sw	zero,-1430(a5) # 8000059c <errno>
    6b3a:	c606                	sw	ra,12(sp)
    6b3c:	b77fd0ef          	jal	46b2 <_close>
    6b40:	57fd                	li	a5,-1
    6b42:	00f50663          	beq	a0,a5,6b4e <_close_r+0x24>
    6b46:	40b2                	lw	ra,12(sp)
    6b48:	4422                	lw	s0,8(sp)
    6b4a:	0141                	add	sp,sp,16
    6b4c:	8082                	ret
    6b4e:	7fffa797          	auipc	a5,0x7fffa
    6b52:	a4e7a783          	lw	a5,-1458(a5) # 8000059c <errno>
    6b56:	dbe5                	beqz	a5,6b46 <_close_r+0x1c>
    6b58:	40b2                	lw	ra,12(sp)
    6b5a:	c01c                	sw	a5,0(s0)
    6b5c:	4422                	lw	s0,8(sp)
    6b5e:	0141                	add	sp,sp,16
    6b60:	8082                	ret

00006b62 <_lseek_r>:
    6b62:	1141                	add	sp,sp,-16
    6b64:	872e                	mv	a4,a1
    6b66:	c422                	sw	s0,8(sp)
    6b68:	85b2                	mv	a1,a2
    6b6a:	842a                	mv	s0,a0
    6b6c:	8636                	mv	a2,a3
    6b6e:	853a                	mv	a0,a4
    6b70:	7fffa797          	auipc	a5,0x7fffa
    6b74:	a207a623          	sw	zero,-1492(a5) # 8000059c <errno>
    6b78:	c606                	sw	ra,12(sp)
    6b7a:	b49fd0ef          	jal	46c2 <_lseek>
    6b7e:	57fd                	li	a5,-1
    6b80:	00f50663          	beq	a0,a5,6b8c <_lseek_r+0x2a>
    6b84:	40b2                	lw	ra,12(sp)
    6b86:	4422                	lw	s0,8(sp)
    6b88:	0141                	add	sp,sp,16
    6b8a:	8082                	ret
    6b8c:	7fffa797          	auipc	a5,0x7fffa
    6b90:	a107a783          	lw	a5,-1520(a5) # 8000059c <errno>
    6b94:	dbe5                	beqz	a5,6b84 <_lseek_r+0x22>
    6b96:	40b2                	lw	ra,12(sp)
    6b98:	c01c                	sw	a5,0(s0)
    6b9a:	4422                	lw	s0,8(sp)
    6b9c:	0141                	add	sp,sp,16
    6b9e:	8082                	ret

00006ba0 <_read_r>:
    6ba0:	1141                	add	sp,sp,-16
    6ba2:	872e                	mv	a4,a1
    6ba4:	c422                	sw	s0,8(sp)
    6ba6:	85b2                	mv	a1,a2
    6ba8:	842a                	mv	s0,a0
    6baa:	8636                	mv	a2,a3
    6bac:	853a                	mv	a0,a4
    6bae:	7fffa797          	auipc	a5,0x7fffa
    6bb2:	9e07a723          	sw	zero,-1554(a5) # 8000059c <errno>
    6bb6:	c606                	sw	ra,12(sp)
    6bb8:	b0ffd0ef          	jal	46c6 <_read>
    6bbc:	57fd                	li	a5,-1
    6bbe:	00f50663          	beq	a0,a5,6bca <_read_r+0x2a>
    6bc2:	40b2                	lw	ra,12(sp)
    6bc4:	4422                	lw	s0,8(sp)
    6bc6:	0141                	add	sp,sp,16
    6bc8:	8082                	ret
    6bca:	7fffa797          	auipc	a5,0x7fffa
    6bce:	9d27a783          	lw	a5,-1582(a5) # 8000059c <errno>
    6bd2:	dbe5                	beqz	a5,6bc2 <_read_r+0x22>
    6bd4:	40b2                	lw	ra,12(sp)
    6bd6:	c01c                	sw	a5,0(s0)
    6bd8:	4422                	lw	s0,8(sp)
    6bda:	0141                	add	sp,sp,16
    6bdc:	8082                	ret

00006bde <_write_r>:
    6bde:	1141                	add	sp,sp,-16
    6be0:	872e                	mv	a4,a1
    6be2:	c422                	sw	s0,8(sp)
    6be4:	85b2                	mv	a1,a2
    6be6:	842a                	mv	s0,a0
    6be8:	8636                	mv	a2,a3
    6bea:	853a                	mv	a0,a4
    6bec:	7fffa797          	auipc	a5,0x7fffa
    6bf0:	9a07a823          	sw	zero,-1616(a5) # 8000059c <errno>
    6bf4:	c606                	sw	ra,12(sp)
    6bf6:	b6bfd0ef          	jal	4760 <_write>
    6bfa:	57fd                	li	a5,-1
    6bfc:	00f50663          	beq	a0,a5,6c08 <_write_r+0x2a>
    6c00:	40b2                	lw	ra,12(sp)
    6c02:	4422                	lw	s0,8(sp)
    6c04:	0141                	add	sp,sp,16
    6c06:	8082                	ret
    6c08:	7fffa797          	auipc	a5,0x7fffa
    6c0c:	9947a783          	lw	a5,-1644(a5) # 8000059c <errno>
    6c10:	dbe5                	beqz	a5,6c00 <_write_r+0x22>
    6c12:	40b2                	lw	ra,12(sp)
    6c14:	c01c                	sw	a5,0(s0)
    6c16:	4422                	lw	s0,8(sp)
    6c18:	0141                	add	sp,sp,16
    6c1a:	8082                	ret

00006c1c <_realloc_r>:
    6c1c:	7179                	add	sp,sp,-48
    6c1e:	d226                	sw	s1,36(sp)
    6c20:	d606                	sw	ra,44(sp)
    6c22:	84b2                	mv	s1,a2
    6c24:	14058e63          	beqz	a1,6d80 <_realloc_r+0x164>
    6c28:	d422                	sw	s0,40(sp)
    6c2a:	d04a                	sw	s2,32(sp)
    6c2c:	842e                	mv	s0,a1
    6c2e:	ce4e                	sw	s3,28(sp)
    6c30:	ca56                	sw	s5,20(sp)
    6c32:	cc52                	sw	s4,24(sp)
    6c34:	892a                	mv	s2,a0
    6c36:	dd3fe0ef          	jal	5a08 <__malloc_lock>
    6c3a:	ffc42703          	lw	a4,-4(s0)
    6c3e:	00b48793          	add	a5,s1,11
    6c42:	46d9                	li	a3,22
    6c44:	ff840a93          	add	s5,s0,-8
    6c48:	ffc77993          	and	s3,a4,-4
    6c4c:	0cf6f063          	bgeu	a3,a5,6d0c <_realloc_r+0xf0>
    6c50:	ff87fa13          	and	s4,a5,-8
    6c54:	0a07cf63          	bltz	a5,6d12 <_realloc_r+0xf6>
    6c58:	0a9a6d63          	bltu	s4,s1,6d12 <_realloc_r+0xf6>
    6c5c:	0d49d663          	bge	s3,s4,6d28 <_realloc_r+0x10c>
    6c60:	c462                	sw	s8,8(sp)
    6c62:	7fff9c17          	auipc	s8,0x7fff9
    6c66:	39ec0c13          	add	s8,s8,926 # 80000000 <__malloc_av_>
    6c6a:	008c2603          	lw	a2,8(s8)
    6c6e:	013a86b3          	add	a3,s5,s3
    6c72:	42dc                	lw	a5,4(a3)
    6c74:	12d60e63          	beq	a2,a3,6db0 <_realloc_r+0x194>
    6c78:	ffe7f613          	and	a2,a5,-2
    6c7c:	9636                	add	a2,a2,a3
    6c7e:	4250                	lw	a2,4(a2)
    6c80:	8a05                	and	a2,a2,1
    6c82:	e27d                	bnez	a2,6d68 <_realloc_r+0x14c>
    6c84:	9bf1                	and	a5,a5,-4
    6c86:	00f98633          	add	a2,s3,a5
    6c8a:	09465963          	bge	a2,s4,6d1c <_realloc_r+0x100>
    6c8e:	8b05                	and	a4,a4,1
    6c90:	e70d                	bnez	a4,6cba <_realloc_r+0x9e>
    6c92:	c65e                	sw	s7,12(sp)
    6c94:	ff842b83          	lw	s7,-8(s0)
    6c98:	c85a                	sw	s6,16(sp)
    6c9a:	417a8bb3          	sub	s7,s5,s7
    6c9e:	004ba703          	lw	a4,4(s7)
    6ca2:	9b71                	and	a4,a4,-4
    6ca4:	97ba                	add	a5,a5,a4
    6ca6:	01378b33          	add	s6,a5,s3
    6caa:	234b5f63          	bge	s6,s4,6ee8 <_realloc_r+0x2cc>
    6cae:	00e98b33          	add	s6,s3,a4
    6cb2:	1d4b5463          	bge	s6,s4,6e7a <_realloc_r+0x25e>
    6cb6:	4b42                	lw	s6,16(sp)
    6cb8:	4bb2                	lw	s7,12(sp)
    6cba:	85a6                	mv	a1,s1
    6cbc:	854a                	mv	a0,s2
    6cbe:	f8cfe0ef          	jal	544a <_malloc_r>
    6cc2:	84aa                	mv	s1,a0
    6cc4:	2e050063          	beqz	a0,6fa4 <_realloc_r+0x388>
    6cc8:	ffc42783          	lw	a5,-4(s0)
    6ccc:	ff850713          	add	a4,a0,-8
    6cd0:	9bf9                	and	a5,a5,-2
    6cd2:	97d6                	add	a5,a5,s5
    6cd4:	18e78d63          	beq	a5,a4,6e6e <_realloc_r+0x252>
    6cd8:	ffc98613          	add	a2,s3,-4
    6cdc:	02400793          	li	a5,36
    6ce0:	20c7e063          	bltu	a5,a2,6ee0 <_realloc_r+0x2c4>
    6ce4:	474d                	li	a4,19
    6ce6:	16c76863          	bltu	a4,a2,6e56 <_realloc_r+0x23a>
    6cea:	87aa                	mv	a5,a0
    6cec:	8722                	mv	a4,s0
    6cee:	4314                	lw	a3,0(a4)
    6cf0:	c394                	sw	a3,0(a5)
    6cf2:	4354                	lw	a3,4(a4)
    6cf4:	c3d4                	sw	a3,4(a5)
    6cf6:	4718                	lw	a4,8(a4)
    6cf8:	c798                	sw	a4,8(a5)
    6cfa:	85a2                	mv	a1,s0
    6cfc:	854a                	mv	a0,s2
    6cfe:	a28ff0ef          	jal	5f26 <_free_r>
    6d02:	854a                	mv	a0,s2
    6d04:	d0ffe0ef          	jal	5a12 <__malloc_unlock>
    6d08:	4c22                	lw	s8,8(sp)
    6d0a:	a0a9                	j	6d54 <_realloc_r+0x138>
    6d0c:	4a41                	li	s4,16
    6d0e:	f49a77e3          	bgeu	s4,s1,6c5c <_realloc_r+0x40>
    6d12:	47b1                	li	a5,12
    6d14:	00f92023          	sw	a5,0(s2)
    6d18:	4481                	li	s1,0
    6d1a:	a82d                	j	6d54 <_realloc_r+0x138>
    6d1c:	46dc                	lw	a5,12(a3)
    6d1e:	4698                	lw	a4,8(a3)
    6d20:	4c22                	lw	s8,8(sp)
    6d22:	89b2                	mv	s3,a2
    6d24:	c75c                	sw	a5,12(a4)
    6d26:	c798                	sw	a4,8(a5)
    6d28:	004aa783          	lw	a5,4(s5)
    6d2c:	414986b3          	sub	a3,s3,s4
    6d30:	463d                	li	a2,15
    6d32:	8b85                	and	a5,a5,1
    6d34:	013a8733          	add	a4,s5,s3
    6d38:	04d66a63          	bltu	a2,a3,6d8c <_realloc_r+0x170>
    6d3c:	0137e7b3          	or	a5,a5,s3
    6d40:	00faa223          	sw	a5,4(s5)
    6d44:	435c                	lw	a5,4(a4)
    6d46:	0017e793          	or	a5,a5,1
    6d4a:	c35c                	sw	a5,4(a4)
    6d4c:	854a                	mv	a0,s2
    6d4e:	cc5fe0ef          	jal	5a12 <__malloc_unlock>
    6d52:	84a2                	mv	s1,s0
    6d54:	5422                	lw	s0,40(sp)
    6d56:	50b2                	lw	ra,44(sp)
    6d58:	5902                	lw	s2,32(sp)
    6d5a:	49f2                	lw	s3,28(sp)
    6d5c:	4a62                	lw	s4,24(sp)
    6d5e:	4ad2                	lw	s5,20(sp)
    6d60:	8526                	mv	a0,s1
    6d62:	5492                	lw	s1,36(sp)
    6d64:	6145                	add	sp,sp,48
    6d66:	8082                	ret
    6d68:	8b05                	and	a4,a4,1
    6d6a:	fb21                	bnez	a4,6cba <_realloc_r+0x9e>
    6d6c:	c65e                	sw	s7,12(sp)
    6d6e:	ff842b83          	lw	s7,-8(s0)
    6d72:	c85a                	sw	s6,16(sp)
    6d74:	417a8bb3          	sub	s7,s5,s7
    6d78:	004ba703          	lw	a4,4(s7)
    6d7c:	9b71                	and	a4,a4,-4
    6d7e:	bf05                	j	6cae <_realloc_r+0x92>
    6d80:	50b2                	lw	ra,44(sp)
    6d82:	5492                	lw	s1,36(sp)
    6d84:	85b2                	mv	a1,a2
    6d86:	6145                	add	sp,sp,48
    6d88:	ec2fe06f          	j	544a <_malloc_r>
    6d8c:	0147e7b3          	or	a5,a5,s4
    6d90:	00faa223          	sw	a5,4(s5)
    6d94:	014a85b3          	add	a1,s5,s4
    6d98:	0016e693          	or	a3,a3,1
    6d9c:	c1d4                	sw	a3,4(a1)
    6d9e:	435c                	lw	a5,4(a4)
    6da0:	05a1                	add	a1,a1,8 # 2008 <__neorv32_heap_size+0x8>
    6da2:	854a                	mv	a0,s2
    6da4:	0017e793          	or	a5,a5,1
    6da8:	c35c                	sw	a5,4(a4)
    6daa:	97cff0ef          	jal	5f26 <_free_r>
    6dae:	bf79                	j	6d4c <_realloc_r+0x130>
    6db0:	9bf1                	and	a5,a5,-4
    6db2:	013786b3          	add	a3,a5,s3
    6db6:	010a0613          	add	a2,s4,16
    6dba:	1ac6db63          	bge	a3,a2,6f70 <_realloc_r+0x354>
    6dbe:	8b05                	and	a4,a4,1
    6dc0:	ee071de3          	bnez	a4,6cba <_realloc_r+0x9e>
    6dc4:	c65e                	sw	s7,12(sp)
    6dc6:	ff842b83          	lw	s7,-8(s0)
    6dca:	c85a                	sw	s6,16(sp)
    6dcc:	417a8bb3          	sub	s7,s5,s7
    6dd0:	004ba703          	lw	a4,4(s7)
    6dd4:	9b71                	and	a4,a4,-4
    6dd6:	97ba                	add	a5,a5,a4
    6dd8:	01378b33          	add	s6,a5,s3
    6ddc:	eccb49e3          	blt	s6,a2,6cae <_realloc_r+0x92>
    6de0:	00cba783          	lw	a5,12(s7)
    6de4:	008ba703          	lw	a4,8(s7)
    6de8:	ffc98613          	add	a2,s3,-4
    6dec:	02400693          	li	a3,36
    6df0:	c75c                	sw	a5,12(a4)
    6df2:	c798                	sw	a4,8(a5)
    6df4:	008b8493          	add	s1,s7,8
    6df8:	1cc6e563          	bltu	a3,a2,6fc2 <_realloc_r+0x3a6>
    6dfc:	474d                	li	a4,19
    6dfe:	87a6                	mv	a5,s1
    6e00:	00c77e63          	bgeu	a4,a2,6e1c <_realloc_r+0x200>
    6e04:	4018                	lw	a4,0(s0)
    6e06:	47ed                	li	a5,27
    6e08:	00eba423          	sw	a4,8(s7)
    6e0c:	4058                	lw	a4,4(s0)
    6e0e:	00eba623          	sw	a4,12(s7)
    6e12:	1ac7ed63          	bltu	a5,a2,6fcc <_realloc_r+0x3b0>
    6e16:	0421                	add	s0,s0,8
    6e18:	010b8793          	add	a5,s7,16
    6e1c:	4018                	lw	a4,0(s0)
    6e1e:	c398                	sw	a4,0(a5)
    6e20:	4058                	lw	a4,4(s0)
    6e22:	c3d8                	sw	a4,4(a5)
    6e24:	4418                	lw	a4,8(s0)
    6e26:	c798                	sw	a4,8(a5)
    6e28:	014b8733          	add	a4,s7,s4
    6e2c:	414b07b3          	sub	a5,s6,s4
    6e30:	00ec2423          	sw	a4,8(s8)
    6e34:	0017e793          	or	a5,a5,1
    6e38:	c35c                	sw	a5,4(a4)
    6e3a:	004ba783          	lw	a5,4(s7)
    6e3e:	854a                	mv	a0,s2
    6e40:	8b85                	and	a5,a5,1
    6e42:	0147e7b3          	or	a5,a5,s4
    6e46:	00fba223          	sw	a5,4(s7)
    6e4a:	bc9fe0ef          	jal	5a12 <__malloc_unlock>
    6e4e:	4b42                	lw	s6,16(sp)
    6e50:	4bb2                	lw	s7,12(sp)
    6e52:	4c22                	lw	s8,8(sp)
    6e54:	b701                	j	6d54 <_realloc_r+0x138>
    6e56:	4014                	lw	a3,0(s0)
    6e58:	476d                	li	a4,27
    6e5a:	c114                	sw	a3,0(a0)
    6e5c:	4054                	lw	a3,4(s0)
    6e5e:	c154                	sw	a3,4(a0)
    6e60:	0ec76d63          	bltu	a4,a2,6f5a <_realloc_r+0x33e>
    6e64:	00840713          	add	a4,s0,8
    6e68:	00850793          	add	a5,a0,8
    6e6c:	b549                	j	6cee <_realloc_r+0xd2>
    6e6e:	ffc52783          	lw	a5,-4(a0)
    6e72:	4c22                	lw	s8,8(sp)
    6e74:	9bf1                	and	a5,a5,-4
    6e76:	99be                	add	s3,s3,a5
    6e78:	bd45                	j	6d28 <_realloc_r+0x10c>
    6e7a:	00cba783          	lw	a5,12(s7)
    6e7e:	008ba703          	lw	a4,8(s7)
    6e82:	ffc98613          	add	a2,s3,-4
    6e86:	02400693          	li	a3,36
    6e8a:	c75c                	sw	a5,12(a4)
    6e8c:	c798                	sw	a4,8(a5)
    6e8e:	008b8493          	add	s1,s7,8
    6e92:	0ac6ef63          	bltu	a3,a2,6f50 <_realloc_r+0x334>
    6e96:	474d                	li	a4,19
    6e98:	87a6                	mv	a5,s1
    6e9a:	02c77663          	bgeu	a4,a2,6ec6 <_realloc_r+0x2aa>
    6e9e:	4018                	lw	a4,0(s0)
    6ea0:	47ed                	li	a5,27
    6ea2:	00eba423          	sw	a4,8(s7)
    6ea6:	4058                	lw	a4,4(s0)
    6ea8:	00eba623          	sw	a4,12(s7)
    6eac:	0ec7f863          	bgeu	a5,a2,6f9c <_realloc_r+0x380>
    6eb0:	441c                	lw	a5,8(s0)
    6eb2:	00fba823          	sw	a5,16(s7)
    6eb6:	445c                	lw	a5,12(s0)
    6eb8:	00fbaa23          	sw	a5,20(s7)
    6ebc:	06d60f63          	beq	a2,a3,6f3a <_realloc_r+0x31e>
    6ec0:	0441                	add	s0,s0,16
    6ec2:	018b8793          	add	a5,s7,24
    6ec6:	4018                	lw	a4,0(s0)
    6ec8:	c398                	sw	a4,0(a5)
    6eca:	4058                	lw	a4,4(s0)
    6ecc:	c3d8                	sw	a4,4(a5)
    6ece:	4418                	lw	a4,8(s0)
    6ed0:	c798                	sw	a4,8(a5)
    6ed2:	89da                	mv	s3,s6
    6ed4:	8ade                	mv	s5,s7
    6ed6:	4b42                	lw	s6,16(sp)
    6ed8:	4bb2                	lw	s7,12(sp)
    6eda:	4c22                	lw	s8,8(sp)
    6edc:	8426                	mv	s0,s1
    6ede:	b5a9                	j	6d28 <_realloc_r+0x10c>
    6ee0:	85a2                	mv	a1,s0
    6ee2:	c4dfe0ef          	jal	5b2e <memmove>
    6ee6:	bd11                	j	6cfa <_realloc_r+0xde>
    6ee8:	46dc                	lw	a5,12(a3)
    6eea:	4698                	lw	a4,8(a3)
    6eec:	ffc98613          	add	a2,s3,-4
    6ef0:	02400693          	li	a3,36
    6ef4:	c75c                	sw	a5,12(a4)
    6ef6:	c798                	sw	a4,8(a5)
    6ef8:	008ba703          	lw	a4,8(s7)
    6efc:	00cba783          	lw	a5,12(s7)
    6f00:	008b8493          	add	s1,s7,8
    6f04:	c75c                	sw	a5,12(a4)
    6f06:	c798                	sw	a4,8(a5)
    6f08:	04c6e463          	bltu	a3,a2,6f50 <_realloc_r+0x334>
    6f0c:	474d                	li	a4,19
    6f0e:	87a6                	mv	a5,s1
    6f10:	fac77be3          	bgeu	a4,a2,6ec6 <_realloc_r+0x2aa>
    6f14:	4018                	lw	a4,0(s0)
    6f16:	47ed                	li	a5,27
    6f18:	00eba423          	sw	a4,8(s7)
    6f1c:	4058                	lw	a4,4(s0)
    6f1e:	00eba623          	sw	a4,12(s7)
    6f22:	06c7fd63          	bgeu	a5,a2,6f9c <_realloc_r+0x380>
    6f26:	4418                	lw	a4,8(s0)
    6f28:	02400793          	li	a5,36
    6f2c:	00eba823          	sw	a4,16(s7)
    6f30:	4458                	lw	a4,12(s0)
    6f32:	00ebaa23          	sw	a4,20(s7)
    6f36:	f8f615e3          	bne	a2,a5,6ec0 <_realloc_r+0x2a4>
    6f3a:	4818                	lw	a4,16(s0)
    6f3c:	020b8793          	add	a5,s7,32
    6f40:	0461                	add	s0,s0,24
    6f42:	00ebac23          	sw	a4,24(s7)
    6f46:	ffc42703          	lw	a4,-4(s0)
    6f4a:	00ebae23          	sw	a4,28(s7)
    6f4e:	bfa5                	j	6ec6 <_realloc_r+0x2aa>
    6f50:	85a2                	mv	a1,s0
    6f52:	8526                	mv	a0,s1
    6f54:	bdbfe0ef          	jal	5b2e <memmove>
    6f58:	bfad                	j	6ed2 <_realloc_r+0x2b6>
    6f5a:	4418                	lw	a4,8(s0)
    6f5c:	c518                	sw	a4,8(a0)
    6f5e:	4458                	lw	a4,12(s0)
    6f60:	c558                	sw	a4,12(a0)
    6f62:	04f60763          	beq	a2,a5,6fb0 <_realloc_r+0x394>
    6f66:	01040713          	add	a4,s0,16
    6f6a:	01050793          	add	a5,a0,16
    6f6e:	b341                	j	6cee <_realloc_r+0xd2>
    6f70:	9ad2                	add	s5,s5,s4
    6f72:	414687b3          	sub	a5,a3,s4
    6f76:	015c2423          	sw	s5,8(s8)
    6f7a:	0017e793          	or	a5,a5,1
    6f7e:	00faa223          	sw	a5,4(s5)
    6f82:	ffc42783          	lw	a5,-4(s0)
    6f86:	854a                	mv	a0,s2
    6f88:	84a2                	mv	s1,s0
    6f8a:	8b85                	and	a5,a5,1
    6f8c:	0147e7b3          	or	a5,a5,s4
    6f90:	fef42e23          	sw	a5,-4(s0)
    6f94:	a7ffe0ef          	jal	5a12 <__malloc_unlock>
    6f98:	4c22                	lw	s8,8(sp)
    6f9a:	bb6d                	j	6d54 <_realloc_r+0x138>
    6f9c:	0421                	add	s0,s0,8
    6f9e:	010b8793          	add	a5,s7,16
    6fa2:	b715                	j	6ec6 <_realloc_r+0x2aa>
    6fa4:	854a                	mv	a0,s2
    6fa6:	a6dfe0ef          	jal	5a12 <__malloc_unlock>
    6faa:	4481                	li	s1,0
    6fac:	4c22                	lw	s8,8(sp)
    6fae:	b35d                	j	6d54 <_realloc_r+0x138>
    6fb0:	4814                	lw	a3,16(s0)
    6fb2:	01840713          	add	a4,s0,24
    6fb6:	01850793          	add	a5,a0,24
    6fba:	c914                	sw	a3,16(a0)
    6fbc:	4854                	lw	a3,20(s0)
    6fbe:	c954                	sw	a3,20(a0)
    6fc0:	b33d                	j	6cee <_realloc_r+0xd2>
    6fc2:	85a2                	mv	a1,s0
    6fc4:	8526                	mv	a0,s1
    6fc6:	b69fe0ef          	jal	5b2e <memmove>
    6fca:	bdb9                	j	6e28 <_realloc_r+0x20c>
    6fcc:	441c                	lw	a5,8(s0)
    6fce:	00fba823          	sw	a5,16(s7)
    6fd2:	445c                	lw	a5,12(s0)
    6fd4:	00fbaa23          	sw	a5,20(s7)
    6fd8:	00d60663          	beq	a2,a3,6fe4 <_realloc_r+0x3c8>
    6fdc:	0441                	add	s0,s0,16
    6fde:	018b8793          	add	a5,s7,24
    6fe2:	bd2d                	j	6e1c <_realloc_r+0x200>
    6fe4:	4818                	lw	a4,16(s0)
    6fe6:	020b8793          	add	a5,s7,32
    6fea:	00ebac23          	sw	a4,24(s7)
    6fee:	4858                	lw	a4,20(s0)
    6ff0:	0461                	add	s0,s0,24
    6ff2:	00ebae23          	sw	a4,28(s7)
    6ff6:	b51d                	j	6e1c <_realloc_r+0x200>

00006ff8 <_fclose_r>:
    6ff8:	1141                	add	sp,sp,-16
    6ffa:	c606                	sw	ra,12(sp)
    6ffc:	c04a                	sw	s2,0(sp)
    6ffe:	c9c1                	beqz	a1,708e <_fclose_r+0x96>
    7000:	c422                	sw	s0,8(sp)
    7002:	c226                	sw	s1,4(sp)
    7004:	842e                	mv	s0,a1
    7006:	84aa                	mv	s1,a0
    7008:	c119                	beqz	a0,700e <_fclose_r+0x16>
    700a:	595c                	lw	a5,52(a0)
    700c:	c3d5                	beqz	a5,70b0 <_fclose_r+0xb8>
    700e:	507c                	lw	a5,100(s0)
    7010:	00c41703          	lh	a4,12(s0)
    7014:	8b85                	and	a5,a5,1
    7016:	ebad                	bnez	a5,7088 <_fclose_r+0x90>
    7018:	20077713          	and	a4,a4,512
    701c:	cf49                	beqz	a4,70b6 <_fclose_r+0xbe>
    701e:	85a2                	mv	a1,s0
    7020:	8526                	mv	a0,s1
    7022:	2875                	jal	70de <__sflush_r>
    7024:	545c                	lw	a5,44(s0)
    7026:	892a                	mv	s2,a0
    7028:	c791                	beqz	a5,7034 <_fclose_r+0x3c>
    702a:	4c4c                	lw	a1,28(s0)
    702c:	8526                	mv	a0,s1
    702e:	9782                	jalr	a5
    7030:	06054563          	bltz	a0,709a <_fclose_r+0xa2>
    7034:	00c45783          	lhu	a5,12(s0)
    7038:	0807f793          	and	a5,a5,128
    703c:	e7ad                	bnez	a5,70a6 <_fclose_r+0xae>
    703e:	580c                	lw	a1,48(s0)
    7040:	c991                	beqz	a1,7054 <_fclose_r+0x5c>
    7042:	04040793          	add	a5,s0,64
    7046:	00f58563          	beq	a1,a5,7050 <_fclose_r+0x58>
    704a:	8526                	mv	a0,s1
    704c:	edbfe0ef          	jal	5f26 <_free_r>
    7050:	02042823          	sw	zero,48(s0)
    7054:	406c                	lw	a1,68(s0)
    7056:	c591                	beqz	a1,7062 <_fclose_r+0x6a>
    7058:	8526                	mv	a0,s1
    705a:	ecdfe0ef          	jal	5f26 <_free_r>
    705e:	04042223          	sw	zero,68(s0)
    7062:	b0eff0ef          	jal	6370 <__sfp_lock_acquire>
    7066:	507c                	lw	a5,100(s0)
    7068:	00041623          	sh	zero,12(s0)
    706c:	8b85                	and	a5,a5,1
    706e:	c7a5                	beqz	a5,70d6 <_fclose_r+0xde>
    7070:	4c28                	lw	a0,88(s0)
    7072:	ab7fe0ef          	jal	5b28 <__retarget_lock_close_recursive>
    7076:	b06ff0ef          	jal	637c <__sfp_lock_release>
    707a:	40b2                	lw	ra,12(sp)
    707c:	4422                	lw	s0,8(sp)
    707e:	4492                	lw	s1,4(sp)
    7080:	854a                	mv	a0,s2
    7082:	4902                	lw	s2,0(sp)
    7084:	0141                	add	sp,sp,16
    7086:	8082                	ret
    7088:	fb59                	bnez	a4,701e <_fclose_r+0x26>
    708a:	4422                	lw	s0,8(sp)
    708c:	4492                	lw	s1,4(sp)
    708e:	4901                	li	s2,0
    7090:	40b2                	lw	ra,12(sp)
    7092:	854a                	mv	a0,s2
    7094:	4902                	lw	s2,0(sp)
    7096:	0141                	add	sp,sp,16
    7098:	8082                	ret
    709a:	00c45783          	lhu	a5,12(s0)
    709e:	597d                	li	s2,-1
    70a0:	0807f793          	and	a5,a5,128
    70a4:	dfc9                	beqz	a5,703e <_fclose_r+0x46>
    70a6:	480c                	lw	a1,16(s0)
    70a8:	8526                	mv	a0,s1
    70aa:	e7dfe0ef          	jal	5f26 <_free_r>
    70ae:	bf41                	j	703e <_fclose_r+0x46>
    70b0:	a6eff0ef          	jal	631e <__sinit>
    70b4:	bfa9                	j	700e <_fclose_r+0x16>
    70b6:	4c28                	lw	a0,88(s0)
    70b8:	a73fe0ef          	jal	5b2a <__retarget_lock_acquire_recursive>
    70bc:	00c41783          	lh	a5,12(s0)
    70c0:	ffb9                	bnez	a5,701e <_fclose_r+0x26>
    70c2:	507c                	lw	a5,100(s0)
    70c4:	8b85                	and	a5,a5,1
    70c6:	f3f1                	bnez	a5,708a <_fclose_r+0x92>
    70c8:	4c28                	lw	a0,88(s0)
    70ca:	4901                	li	s2,0
    70cc:	a61fe0ef          	jal	5b2c <__retarget_lock_release_recursive>
    70d0:	4422                	lw	s0,8(sp)
    70d2:	4492                	lw	s1,4(sp)
    70d4:	bf75                	j	7090 <_fclose_r+0x98>
    70d6:	4c28                	lw	a0,88(s0)
    70d8:	a55fe0ef          	jal	5b2c <__retarget_lock_release_recursive>
    70dc:	bf51                	j	7070 <_fclose_r+0x78>

000070de <__sflush_r>:
    70de:	00c59703          	lh	a4,12(a1)
    70e2:	1101                	add	sp,sp,-32
    70e4:	cc22                	sw	s0,24(sp)
    70e6:	c64e                	sw	s3,12(sp)
    70e8:	ce06                	sw	ra,28(sp)
    70ea:	00877793          	and	a5,a4,8
    70ee:	842e                	mv	s0,a1
    70f0:	89aa                	mv	s3,a0
    70f2:	e7e1                	bnez	a5,71ba <__sflush_r+0xdc>
    70f4:	6785                	lui	a5,0x1
    70f6:	80078793          	add	a5,a5,-2048 # 800 <core_list_init+0x1c4>
    70fa:	41d4                	lw	a3,4(a1)
    70fc:	8fd9                	or	a5,a5,a4
    70fe:	00f59623          	sh	a5,12(a1)
    7102:	10d05563          	blez	a3,720c <__sflush_r+0x12e>
    7106:	02842803          	lw	a6,40(s0)
    710a:	0a080263          	beqz	a6,71ae <__sflush_r+0xd0>
    710e:	ca26                	sw	s1,20(sp)
    7110:	01371693          	sll	a3,a4,0x13
    7114:	0009a483          	lw	s1,0(s3)
    7118:	0009a023          	sw	zero,0(s3)
    711c:	4c4c                	lw	a1,28(s0)
    711e:	0e06ce63          	bltz	a3,721a <__sflush_r+0x13c>
    7122:	4601                	li	a2,0
    7124:	4685                	li	a3,1
    7126:	854e                	mv	a0,s3
    7128:	9802                	jalr	a6
    712a:	57fd                	li	a5,-1
    712c:	862a                	mv	a2,a0
    712e:	10f50f63          	beq	a0,a5,724c <__sflush_r+0x16e>
    7132:	00c41783          	lh	a5,12(s0)
    7136:	02842803          	lw	a6,40(s0)
    713a:	4c4c                	lw	a1,28(s0)
    713c:	8b91                	and	a5,a5,4
    713e:	c799                	beqz	a5,714c <__sflush_r+0x6e>
    7140:	4058                	lw	a4,4(s0)
    7142:	581c                	lw	a5,48(s0)
    7144:	8e19                	sub	a2,a2,a4
    7146:	c399                	beqz	a5,714c <__sflush_r+0x6e>
    7148:	5c5c                	lw	a5,60(s0)
    714a:	8e1d                	sub	a2,a2,a5
    714c:	4681                	li	a3,0
    714e:	854e                	mv	a0,s3
    7150:	9802                	jalr	a6
    7152:	57fd                	li	a5,-1
    7154:	0cf51563          	bne	a0,a5,721e <__sflush_r+0x140>
    7158:	0009a683          	lw	a3,0(s3)
    715c:	47f5                	li	a5,29
    715e:	00c41703          	lh	a4,12(s0)
    7162:	10d7e163          	bltu	a5,a3,7264 <__sflush_r+0x186>
    7166:	204007b7          	lui	a5,0x20400
    716a:	0785                	add	a5,a5,1 # 20400001 <__neorv32_rom_size+0x203f0001>
    716c:	00d7d7b3          	srl	a5,a5,a3
    7170:	8b85                	and	a5,a5,1
    7172:	cbed                	beqz	a5,7264 <__sflush_r+0x186>
    7174:	4810                	lw	a2,16(s0)
    7176:	77fd                	lui	a5,0xfffff
    7178:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7fffb800>
    717c:	8ff9                	and	a5,a5,a4
    717e:	00f41623          	sh	a5,12(s0)
    7182:	00042223          	sw	zero,4(s0)
    7186:	c010                	sw	a2,0(s0)
    7188:	01371793          	sll	a5,a4,0x13
    718c:	0007d363          	bgez	a5,7192 <__sflush_r+0xb4>
    7190:	c6dd                	beqz	a3,723e <__sflush_r+0x160>
    7192:	580c                	lw	a1,48(s0)
    7194:	0099a023          	sw	s1,0(s3)
    7198:	c9c5                	beqz	a1,7248 <__sflush_r+0x16a>
    719a:	04040793          	add	a5,s0,64
    719e:	00f58563          	beq	a1,a5,71a8 <__sflush_r+0xca>
    71a2:	854e                	mv	a0,s3
    71a4:	d83fe0ef          	jal	5f26 <_free_r>
    71a8:	44d2                	lw	s1,20(sp)
    71aa:	02042823          	sw	zero,48(s0)
    71ae:	4501                	li	a0,0
    71b0:	40f2                	lw	ra,28(sp)
    71b2:	4462                	lw	s0,24(sp)
    71b4:	49b2                	lw	s3,12(sp)
    71b6:	6105                	add	sp,sp,32
    71b8:	8082                	ret
    71ba:	c84a                	sw	s2,16(sp)
    71bc:	0105a903          	lw	s2,16(a1)
    71c0:	04090b63          	beqz	s2,7216 <__sflush_r+0x138>
    71c4:	ca26                	sw	s1,20(sp)
    71c6:	4184                	lw	s1,0(a1)
    71c8:	8b0d                	and	a4,a4,3
    71ca:	0125a023          	sw	s2,0(a1)
    71ce:	412484b3          	sub	s1,s1,s2
    71d2:	4781                	li	a5,0
    71d4:	e311                	bnez	a4,71d8 <__sflush_r+0xfa>
    71d6:	49dc                	lw	a5,20(a1)
    71d8:	c41c                	sw	a5,8(s0)
    71da:	00904663          	bgtz	s1,71e6 <__sflush_r+0x108>
    71de:	a81d                	j	7214 <__sflush_r+0x136>
    71e0:	992a                	add	s2,s2,a0
    71e2:	02905963          	blez	s1,7214 <__sflush_r+0x136>
    71e6:	505c                	lw	a5,36(s0)
    71e8:	4c4c                	lw	a1,28(s0)
    71ea:	86a6                	mv	a3,s1
    71ec:	864a                	mv	a2,s2
    71ee:	854e                	mv	a0,s3
    71f0:	9782                	jalr	a5
    71f2:	8c89                	sub	s1,s1,a0
    71f4:	fea046e3          	bgtz	a0,71e0 <__sflush_r+0x102>
    71f8:	00c41703          	lh	a4,12(s0)
    71fc:	4942                	lw	s2,16(sp)
    71fe:	04076713          	or	a4,a4,64
    7202:	44d2                	lw	s1,20(sp)
    7204:	00e41623          	sh	a4,12(s0)
    7208:	557d                	li	a0,-1
    720a:	b75d                	j	71b0 <__sflush_r+0xd2>
    720c:	5dd4                	lw	a3,60(a1)
    720e:	eed04ce3          	bgtz	a3,7106 <__sflush_r+0x28>
    7212:	bf71                	j	71ae <__sflush_r+0xd0>
    7214:	44d2                	lw	s1,20(sp)
    7216:	4942                	lw	s2,16(sp)
    7218:	bf59                	j	71ae <__sflush_r+0xd0>
    721a:	4830                	lw	a2,80(s0)
    721c:	b705                	j	713c <__sflush_r+0x5e>
    721e:	00c41703          	lh	a4,12(s0)
    7222:	4814                	lw	a3,16(s0)
    7224:	77fd                	lui	a5,0xfffff
    7226:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7fffb800>
    722a:	8ff9                	and	a5,a5,a4
    722c:	00f41623          	sh	a5,12(s0)
    7230:	00042223          	sw	zero,4(s0)
    7234:	c014                	sw	a3,0(s0)
    7236:	01371793          	sll	a5,a4,0x13
    723a:	f407dce3          	bgez	a5,7192 <__sflush_r+0xb4>
    723e:	580c                	lw	a1,48(s0)
    7240:	c828                	sw	a0,80(s0)
    7242:	0099a023          	sw	s1,0(s3)
    7246:	f9b1                	bnez	a1,719a <__sflush_r+0xbc>
    7248:	44d2                	lw	s1,20(sp)
    724a:	b795                	j	71ae <__sflush_r+0xd0>
    724c:	0009a783          	lw	a5,0(s3)
    7250:	ee0781e3          	beqz	a5,7132 <__sflush_r+0x54>
    7254:	4775                	li	a4,29
    7256:	00e78a63          	beq	a5,a4,726a <__sflush_r+0x18c>
    725a:	4759                	li	a4,22
    725c:	00e78763          	beq	a5,a4,726a <__sflush_r+0x18c>
    7260:	00c41703          	lh	a4,12(s0)
    7264:	04076713          	or	a4,a4,64
    7268:	bf69                	j	7202 <__sflush_r+0x124>
    726a:	0099a023          	sw	s1,0(s3)
    726e:	44d2                	lw	s1,20(sp)
    7270:	bf3d                	j	71ae <__sflush_r+0xd0>

00007272 <_fflush_r>:
    7272:	1141                	add	sp,sp,-16
    7274:	c422                	sw	s0,8(sp)
    7276:	c226                	sw	s1,4(sp)
    7278:	c606                	sw	ra,12(sp)
    727a:	c04a                	sw	s2,0(sp)
    727c:	84aa                	mv	s1,a0
    727e:	842e                	mv	s0,a1
    7280:	c119                	beqz	a0,7286 <_fflush_r+0x14>
    7282:	595c                	lw	a5,52(a0)
    7284:	c7ad                	beqz	a5,72ee <_fflush_r+0x7c>
    7286:	00c41783          	lh	a5,12(s0)
    728a:	4901                	li	s2,0
    728c:	c785                	beqz	a5,72b4 <_fflush_r+0x42>
    728e:	5078                	lw	a4,100(s0)
    7290:	8b05                	and	a4,a4,1
    7292:	e701                	bnez	a4,729a <_fflush_r+0x28>
    7294:	2007f793          	and	a5,a5,512
    7298:	c78d                	beqz	a5,72c2 <_fflush_r+0x50>
    729a:	85a2                	mv	a1,s0
    729c:	8526                	mv	a0,s1
    729e:	e41ff0ef          	jal	70de <__sflush_r>
    72a2:	507c                	lw	a5,100(s0)
    72a4:	892a                	mv	s2,a0
    72a6:	8b85                	and	a5,a5,1
    72a8:	e791                	bnez	a5,72b4 <_fflush_r+0x42>
    72aa:	00c45783          	lhu	a5,12(s0)
    72ae:	2007f793          	and	a5,a5,512
    72b2:	c785                	beqz	a5,72da <_fflush_r+0x68>
    72b4:	40b2                	lw	ra,12(sp)
    72b6:	4422                	lw	s0,8(sp)
    72b8:	4492                	lw	s1,4(sp)
    72ba:	854a                	mv	a0,s2
    72bc:	4902                	lw	s2,0(sp)
    72be:	0141                	add	sp,sp,16
    72c0:	8082                	ret
    72c2:	4c28                	lw	a0,88(s0)
    72c4:	867fe0ef          	jal	5b2a <__retarget_lock_acquire_recursive>
    72c8:	85a2                	mv	a1,s0
    72ca:	8526                	mv	a0,s1
    72cc:	e13ff0ef          	jal	70de <__sflush_r>
    72d0:	507c                	lw	a5,100(s0)
    72d2:	892a                	mv	s2,a0
    72d4:	8b85                	and	a5,a5,1
    72d6:	fff9                	bnez	a5,72b4 <_fflush_r+0x42>
    72d8:	bfc9                	j	72aa <_fflush_r+0x38>
    72da:	4c28                	lw	a0,88(s0)
    72dc:	851fe0ef          	jal	5b2c <__retarget_lock_release_recursive>
    72e0:	40b2                	lw	ra,12(sp)
    72e2:	4422                	lw	s0,8(sp)
    72e4:	4492                	lw	s1,4(sp)
    72e6:	854a                	mv	a0,s2
    72e8:	4902                	lw	s2,0(sp)
    72ea:	0141                	add	sp,sp,16
    72ec:	8082                	ret
    72ee:	830ff0ef          	jal	631e <__sinit>
    72f2:	bf51                	j	7286 <_fflush_r+0x14>

000072f4 <__smakebuf_r>:
    72f4:	00c59783          	lh	a5,12(a1)
    72f8:	7119                	add	sp,sp,-128
    72fa:	dca2                	sw	s0,120(sp)
    72fc:	de86                	sw	ra,124(sp)
    72fe:	0027f713          	and	a4,a5,2
    7302:	842e                	mv	s0,a1
    7304:	cb19                	beqz	a4,731a <__smakebuf_r+0x26>
    7306:	04358793          	add	a5,a1,67
    730a:	c19c                	sw	a5,0(a1)
    730c:	c99c                	sw	a5,16(a1)
    730e:	4785                	li	a5,1
    7310:	c9dc                	sw	a5,20(a1)
    7312:	50f6                	lw	ra,124(sp)
    7314:	5466                	lw	s0,120(sp)
    7316:	6109                	add	sp,sp,128
    7318:	8082                	ret
    731a:	00e59583          	lh	a1,14(a1)
    731e:	daa6                	sw	s1,116(sp)
    7320:	d8ca                	sw	s2,112(sp)
    7322:	d6ce                	sw	s3,108(sp)
    7324:	d4d2                	sw	s4,104(sp)
    7326:	84aa                	mv	s1,a0
    7328:	0605c263          	bltz	a1,738c <__smakebuf_r+0x98>
    732c:	0030                	add	a2,sp,8
    732e:	28c9                	jal	7400 <_fstat_r>
    7330:	04054c63          	bltz	a0,7388 <__smakebuf_r+0x94>
    7334:	47b2                	lw	a5,12(sp)
    7336:	693d                	lui	s2,0xf
    7338:	6985                	lui	s3,0x1
    733a:	00f97933          	and	s2,s2,a5
    733e:	77f9                	lui	a5,0xffffe
    7340:	993e                	add	s2,s2,a5
    7342:	00193913          	seqz	s2,s2
    7346:	40000a13          	li	s4,1024
    734a:	80098993          	add	s3,s3,-2048 # 800 <core_list_init+0x1c4>
    734e:	85d2                	mv	a1,s4
    7350:	8526                	mv	a0,s1
    7352:	8f8fe0ef          	jal	544a <_malloc_r>
    7356:	00c41783          	lh	a5,12(s0)
    735a:	c539                	beqz	a0,73a8 <__smakebuf_r+0xb4>
    735c:	0807e793          	or	a5,a5,128
    7360:	c008                	sw	a0,0(s0)
    7362:	c808                	sw	a0,16(s0)
    7364:	00f41623          	sh	a5,12(s0)
    7368:	01442a23          	sw	s4,20(s0)
    736c:	06091563          	bnez	s2,73d6 <__smakebuf_r+0xe2>
    7370:	0137e7b3          	or	a5,a5,s3
    7374:	50f6                	lw	ra,124(sp)
    7376:	00f41623          	sh	a5,12(s0)
    737a:	5466                	lw	s0,120(sp)
    737c:	54d6                	lw	s1,116(sp)
    737e:	5946                	lw	s2,112(sp)
    7380:	59b6                	lw	s3,108(sp)
    7382:	5a26                	lw	s4,104(sp)
    7384:	6109                	add	sp,sp,128
    7386:	8082                	ret
    7388:	00c41783          	lh	a5,12(s0)
    738c:	0807f793          	and	a5,a5,128
    7390:	4901                	li	s2,0
    7392:	cf95                	beqz	a5,73ce <__smakebuf_r+0xda>
    7394:	04000a13          	li	s4,64
    7398:	85d2                	mv	a1,s4
    739a:	8526                	mv	a0,s1
    739c:	8aefe0ef          	jal	544a <_malloc_r>
    73a0:	00c41783          	lh	a5,12(s0)
    73a4:	4981                	li	s3,0
    73a6:	f95d                	bnez	a0,735c <__smakebuf_r+0x68>
    73a8:	2007f713          	and	a4,a5,512
    73ac:	ef0d                	bnez	a4,73e6 <__smakebuf_r+0xf2>
    73ae:	9bf1                	and	a5,a5,-4
    73b0:	0027e793          	or	a5,a5,2
    73b4:	04340713          	add	a4,s0,67
    73b8:	00f41623          	sh	a5,12(s0)
    73bc:	4785                	li	a5,1
    73be:	54d6                	lw	s1,116(sp)
    73c0:	5946                	lw	s2,112(sp)
    73c2:	59b6                	lw	s3,108(sp)
    73c4:	5a26                	lw	s4,104(sp)
    73c6:	c018                	sw	a4,0(s0)
    73c8:	c818                	sw	a4,16(s0)
    73ca:	c85c                	sw	a5,20(s0)
    73cc:	b799                	j	7312 <__smakebuf_r+0x1e>
    73ce:	40000a13          	li	s4,1024
    73d2:	4981                	li	s3,0
    73d4:	bfad                	j	734e <__smakebuf_r+0x5a>
    73d6:	00e41583          	lh	a1,14(s0)
    73da:	8526                	mv	a0,s1
    73dc:	2085                	jal	743c <_isatty_r>
    73de:	e909                	bnez	a0,73f0 <__smakebuf_r+0xfc>
    73e0:	00c41783          	lh	a5,12(s0)
    73e4:	b771                	j	7370 <__smakebuf_r+0x7c>
    73e6:	54d6                	lw	s1,116(sp)
    73e8:	5946                	lw	s2,112(sp)
    73ea:	59b6                	lw	s3,108(sp)
    73ec:	5a26                	lw	s4,104(sp)
    73ee:	b715                	j	7312 <__smakebuf_r+0x1e>
    73f0:	00c45783          	lhu	a5,12(s0)
    73f4:	9bf1                	and	a5,a5,-4
    73f6:	0017e793          	or	a5,a5,1
    73fa:	07c2                	sll	a5,a5,0x10
    73fc:	87c1                	sra	a5,a5,0x10
    73fe:	bf8d                	j	7370 <__smakebuf_r+0x7c>

00007400 <_fstat_r>:
    7400:	1141                	add	sp,sp,-16
    7402:	872e                	mv	a4,a1
    7404:	c422                	sw	s0,8(sp)
    7406:	85b2                	mv	a1,a2
    7408:	842a                	mv	s0,a0
    740a:	853a                	mv	a0,a4
    740c:	7fff9797          	auipc	a5,0x7fff9
    7410:	1807a823          	sw	zero,400(a5) # 8000059c <errno>
    7414:	c606                	sw	ra,12(sp)
    7416:	aa0fd0ef          	jal	46b6 <_fstat>
    741a:	57fd                	li	a5,-1
    741c:	00f50663          	beq	a0,a5,7428 <_fstat_r+0x28>
    7420:	40b2                	lw	ra,12(sp)
    7422:	4422                	lw	s0,8(sp)
    7424:	0141                	add	sp,sp,16
    7426:	8082                	ret
    7428:	7fff9797          	auipc	a5,0x7fff9
    742c:	1747a783          	lw	a5,372(a5) # 8000059c <errno>
    7430:	dbe5                	beqz	a5,7420 <_fstat_r+0x20>
    7432:	40b2                	lw	ra,12(sp)
    7434:	c01c                	sw	a5,0(s0)
    7436:	4422                	lw	s0,8(sp)
    7438:	0141                	add	sp,sp,16
    743a:	8082                	ret

0000743c <_isatty_r>:
    743c:	1141                	add	sp,sp,-16
    743e:	c422                	sw	s0,8(sp)
    7440:	842a                	mv	s0,a0
    7442:	852e                	mv	a0,a1
    7444:	7fff9797          	auipc	a5,0x7fff9
    7448:	1407ac23          	sw	zero,344(a5) # 8000059c <errno>
    744c:	c606                	sw	ra,12(sp)
    744e:	a70fd0ef          	jal	46be <_isatty>
    7452:	57fd                	li	a5,-1
    7454:	00f50663          	beq	a0,a5,7460 <_isatty_r+0x24>
    7458:	40b2                	lw	ra,12(sp)
    745a:	4422                	lw	s0,8(sp)
    745c:	0141                	add	sp,sp,16
    745e:	8082                	ret
    7460:	7fff9797          	auipc	a5,0x7fff9
    7464:	13c7a783          	lw	a5,316(a5) # 8000059c <errno>
    7468:	dbe5                	beqz	a5,7458 <_isatty_r+0x1c>
    746a:	40b2                	lw	ra,12(sp)
    746c:	c01c                	sw	a5,0(s0)
    746e:	4422                	lw	s0,8(sp)
    7470:	0141                	add	sp,sp,16
    7472:	8082                	ret

00007474 <__udivdi3>:
    7474:	8832                	mv	a6,a2
    7476:	88aa                	mv	a7,a0
    7478:	872e                	mv	a4,a1
    747a:	ead5                	bnez	a3,752e <__udivdi3+0xba>
    747c:	0ec5ff63          	bgeu	a1,a2,757a <__udivdi3+0x106>
    7480:	67c1                	lui	a5,0x10
    7482:	18f66c63          	bltu	a2,a5,761a <__udivdi3+0x1a6>
    7486:	010007b7          	lui	a5,0x1000
    748a:	46e1                	li	a3,24
    748c:	00f67363          	bgeu	a2,a5,7492 <__udivdi3+0x1e>
    7490:	46c1                	li	a3,16
    7492:	00d65333          	srl	t1,a2,a3
    7496:	00003797          	auipc	a5,0x3
    749a:	0a278793          	add	a5,a5,162 # a538 <__clz_tab>
    749e:	979a                	add	a5,a5,t1
    74a0:	0007c783          	lbu	a5,0(a5)
    74a4:	02000313          	li	t1,32
    74a8:	97b6                	add	a5,a5,a3
    74aa:	40f306b3          	sub	a3,t1,a5
    74ae:	00f30b63          	beq	t1,a5,74c4 <__udivdi3+0x50>
    74b2:	00d59733          	sll	a4,a1,a3
    74b6:	00f557b3          	srl	a5,a0,a5
    74ba:	00d61833          	sll	a6,a2,a3
    74be:	8f5d                	or	a4,a4,a5
    74c0:	00d518b3          	sll	a7,a0,a3
    74c4:	01085613          	srl	a2,a6,0x10
    74c8:	02c75533          	divu	a0,a4,a2
    74cc:	01081693          	sll	a3,a6,0x10
    74d0:	82c1                	srl	a3,a3,0x10
    74d2:	0108d793          	srl	a5,a7,0x10
    74d6:	02c77733          	remu	a4,a4,a2
    74da:	02a685b3          	mul	a1,a3,a0
    74de:	0742                	sll	a4,a4,0x10
    74e0:	8fd9                	or	a5,a5,a4
    74e2:	00b7fa63          	bgeu	a5,a1,74f6 <__udivdi3+0x82>
    74e6:	97c2                	add	a5,a5,a6
    74e8:	fff50713          	add	a4,a0,-1
    74ec:	0107e463          	bltu	a5,a6,74f4 <__udivdi3+0x80>
    74f0:	30b7ef63          	bltu	a5,a1,780e <__udivdi3+0x39a>
    74f4:	853a                	mv	a0,a4
    74f6:	8f8d                	sub	a5,a5,a1
    74f8:	02c7d733          	divu	a4,a5,a2
    74fc:	08c2                	sll	a7,a7,0x10
    74fe:	0108d893          	srl	a7,a7,0x10
    7502:	02c7f7b3          	remu	a5,a5,a2
    7506:	02e686b3          	mul	a3,a3,a4
    750a:	07c2                	sll	a5,a5,0x10
    750c:	00f8e8b3          	or	a7,a7,a5
    7510:	00d8fb63          	bgeu	a7,a3,7526 <__udivdi3+0xb2>
    7514:	98c2                	add	a7,a7,a6
    7516:	fff70793          	add	a5,a4,-1
    751a:	0108e563          	bltu	a7,a6,7524 <__udivdi3+0xb0>
    751e:	1779                	add	a4,a4,-2
    7520:	00d8e363          	bltu	a7,a3,7526 <__udivdi3+0xb2>
    7524:	873e                	mv	a4,a5
    7526:	0542                	sll	a0,a0,0x10
    7528:	8d59                	or	a0,a0,a4
    752a:	4581                	li	a1,0
    752c:	8082                	ret
    752e:	00d5f563          	bgeu	a1,a3,7538 <__udivdi3+0xc4>
    7532:	4581                	li	a1,0
    7534:	4501                	li	a0,0
    7536:	8082                	ret
    7538:	67c1                	lui	a5,0x10
    753a:	18f6e863          	bltu	a3,a5,76ca <__udivdi3+0x256>
    753e:	01000737          	lui	a4,0x1000
    7542:	47e1                	li	a5,24
    7544:	00e6f363          	bgeu	a3,a4,754a <__udivdi3+0xd6>
    7548:	47c1                	li	a5,16
    754a:	00f6d833          	srl	a6,a3,a5
    754e:	00003717          	auipc	a4,0x3
    7552:	fea70713          	add	a4,a4,-22 # a538 <__clz_tab>
    7556:	9742                	add	a4,a4,a6
    7558:	00074703          	lbu	a4,0(a4)
    755c:	02000893          	li	a7,32
    7560:	973e                	add	a4,a4,a5
    7562:	40e88833          	sub	a6,a7,a4
    7566:	18e89763          	bne	a7,a4,76f4 <__udivdi3+0x280>
    756a:	28b6e463          	bltu	a3,a1,77f2 <__udivdi3+0x37e>
    756e:	00c53533          	sltu	a0,a0,a2
    7572:	00153513          	seqz	a0,a0
    7576:	4581                	li	a1,0
    7578:	8082                	ret
    757a:	c655                	beqz	a2,7626 <__udivdi3+0x1b2>
    757c:	67c1                	lui	a5,0x10
    757e:	26f67263          	bgeu	a2,a5,77e2 <__udivdi3+0x36e>
    7582:	10063713          	sltiu	a4,a2,256
    7586:	00173713          	seqz	a4,a4
    758a:	070e                	sll	a4,a4,0x3
    758c:	00e656b3          	srl	a3,a2,a4
    7590:	00003797          	auipc	a5,0x3
    7594:	fa878793          	add	a5,a5,-88 # a538 <__clz_tab>
    7598:	97b6                	add	a5,a5,a3
    759a:	0007c783          	lbu	a5,0(a5)
    759e:	02000693          	li	a3,32
    75a2:	97ba                	add	a5,a5,a4
    75a4:	40f68eb3          	sub	t4,a3,a5
    75a8:	08f69f63          	bne	a3,a5,7646 <__udivdi3+0x1d2>
    75ac:	40c587b3          	sub	a5,a1,a2
    75b0:	01065693          	srl	a3,a2,0x10
    75b4:	0642                	sll	a2,a2,0x10
    75b6:	8241                	srl	a2,a2,0x10
    75b8:	4585                	li	a1,1
    75ba:	02d7d533          	divu	a0,a5,a3
    75be:	0108d713          	srl	a4,a7,0x10
    75c2:	02d7f7b3          	remu	a5,a5,a3
    75c6:	02c50333          	mul	t1,a0,a2
    75ca:	07c2                	sll	a5,a5,0x10
    75cc:	8fd9                	or	a5,a5,a4
    75ce:	0067fa63          	bgeu	a5,t1,75e2 <__udivdi3+0x16e>
    75d2:	97c2                	add	a5,a5,a6
    75d4:	fff50713          	add	a4,a0,-1
    75d8:	0107e463          	bltu	a5,a6,75e0 <__udivdi3+0x16c>
    75dc:	2267e663          	bltu	a5,t1,7808 <__udivdi3+0x394>
    75e0:	853a                	mv	a0,a4
    75e2:	406787b3          	sub	a5,a5,t1
    75e6:	02d7d733          	divu	a4,a5,a3
    75ea:	08c2                	sll	a7,a7,0x10
    75ec:	0108d893          	srl	a7,a7,0x10
    75f0:	02d7f7b3          	remu	a5,a5,a3
    75f4:	02c70633          	mul	a2,a4,a2
    75f8:	07c2                	sll	a5,a5,0x10
    75fa:	00f8e8b3          	or	a7,a7,a5
    75fe:	00c8fb63          	bgeu	a7,a2,7614 <__udivdi3+0x1a0>
    7602:	98c2                	add	a7,a7,a6
    7604:	fff70793          	add	a5,a4,-1
    7608:	0108e563          	bltu	a7,a6,7612 <__udivdi3+0x19e>
    760c:	1779                	add	a4,a4,-2
    760e:	00c8e363          	bltu	a7,a2,7614 <__udivdi3+0x1a0>
    7612:	873e                	mv	a4,a5
    7614:	0542                	sll	a0,a0,0x10
    7616:	8d59                	or	a0,a0,a4
    7618:	8082                	ret
    761a:	10063693          	sltiu	a3,a2,256
    761e:	0016b693          	seqz	a3,a3
    7622:	068e                	sll	a3,a3,0x3
    7624:	b5bd                	j	7492 <__udivdi3+0x1e>
    7626:	4681                	li	a3,0
    7628:	00003797          	auipc	a5,0x3
    762c:	f1078793          	add	a5,a5,-240 # a538 <__clz_tab>
    7630:	97b6                	add	a5,a5,a3
    7632:	0007c783          	lbu	a5,0(a5)
    7636:	4701                	li	a4,0
    7638:	02000693          	li	a3,32
    763c:	97ba                	add	a5,a5,a4
    763e:	40f68eb3          	sub	t4,a3,a5
    7642:	f6f685e3          	beq	a3,a5,75ac <__udivdi3+0x138>
    7646:	01d61833          	sll	a6,a2,t4
    764a:	00f5d333          	srl	t1,a1,a5
    764e:	01085693          	srl	a3,a6,0x10
    7652:	02d35e33          	divu	t3,t1,a3
    7656:	01081613          	sll	a2,a6,0x10
    765a:	01d595b3          	sll	a1,a1,t4
    765e:	8241                	srl	a2,a2,0x10
    7660:	00f557b3          	srl	a5,a0,a5
    7664:	8fcd                	or	a5,a5,a1
    7666:	0107d713          	srl	a4,a5,0x10
    766a:	01d518b3          	sll	a7,a0,t4
    766e:	02d37333          	remu	t1,t1,a3
    7672:	03c605b3          	mul	a1,a2,t3
    7676:	0342                	sll	t1,t1,0x10
    7678:	00676733          	or	a4,a4,t1
    767c:	00b77b63          	bgeu	a4,a1,7692 <__udivdi3+0x21e>
    7680:	9742                	add	a4,a4,a6
    7682:	fffe0513          	add	a0,t3,-1
    7686:	17076d63          	bltu	a4,a6,7800 <__udivdi3+0x38c>
    768a:	16b77b63          	bgeu	a4,a1,7800 <__udivdi3+0x38c>
    768e:	1e79                	add	t3,t3,-2
    7690:	9742                	add	a4,a4,a6
    7692:	8f0d                	sub	a4,a4,a1
    7694:	02d75533          	divu	a0,a4,a3
    7698:	07c2                	sll	a5,a5,0x10
    769a:	83c1                	srl	a5,a5,0x10
    769c:	02d77733          	remu	a4,a4,a3
    76a0:	02a60333          	mul	t1,a2,a0
    76a4:	0742                	sll	a4,a4,0x10
    76a6:	8fd9                	or	a5,a5,a4
    76a8:	0067fb63          	bgeu	a5,t1,76be <__udivdi3+0x24a>
    76ac:	97c2                	add	a5,a5,a6
    76ae:	fff50713          	add	a4,a0,-1
    76b2:	1507e363          	bltu	a5,a6,77f8 <__udivdi3+0x384>
    76b6:	1467f163          	bgeu	a5,t1,77f8 <__udivdi3+0x384>
    76ba:	1579                	add	a0,a0,-2
    76bc:	97c2                	add	a5,a5,a6
    76be:	010e1593          	sll	a1,t3,0x10
    76c2:	406787b3          	sub	a5,a5,t1
    76c6:	8dc9                	or	a1,a1,a0
    76c8:	bdcd                	j	75ba <__udivdi3+0x146>
    76ca:	1006b793          	sltiu	a5,a3,256
    76ce:	0017b793          	seqz	a5,a5
    76d2:	078e                	sll	a5,a5,0x3
    76d4:	00f6d833          	srl	a6,a3,a5
    76d8:	00003717          	auipc	a4,0x3
    76dc:	e6070713          	add	a4,a4,-416 # a538 <__clz_tab>
    76e0:	9742                	add	a4,a4,a6
    76e2:	00074703          	lbu	a4,0(a4)
    76e6:	02000893          	li	a7,32
    76ea:	973e                	add	a4,a4,a5
    76ec:	40e88833          	sub	a6,a7,a4
    76f0:	e6e88de3          	beq	a7,a4,756a <__udivdi3+0xf6>
    76f4:	00e65e33          	srl	t3,a2,a4
    76f8:	010696b3          	sll	a3,a3,a6
    76fc:	00de6e33          	or	t3,t3,a3
    7700:	00e5d8b3          	srl	a7,a1,a4
    7704:	010e5e93          	srl	t4,t3,0x10
    7708:	03d8d7b3          	divu	a5,a7,t4
    770c:	010e1313          	sll	t1,t3,0x10
    7710:	010595b3          	sll	a1,a1,a6
    7714:	01035313          	srl	t1,t1,0x10
    7718:	00e55733          	srl	a4,a0,a4
    771c:	8f4d                	or	a4,a4,a1
    771e:	01075693          	srl	a3,a4,0x10
    7722:	01061633          	sll	a2,a2,a6
    7726:	03d8f8b3          	remu	a7,a7,t4
    772a:	02f305b3          	mul	a1,t1,a5
    772e:	08c2                	sll	a7,a7,0x10
    7730:	0116e6b3          	or	a3,a3,a7
    7734:	00b6fb63          	bgeu	a3,a1,774a <__udivdi3+0x2d6>
    7738:	96f2                	add	a3,a3,t3
    773a:	fff78893          	add	a7,a5,-1
    773e:	0dc6e363          	bltu	a3,t3,7804 <__udivdi3+0x390>
    7742:	0cb6f163          	bgeu	a3,a1,7804 <__udivdi3+0x390>
    7746:	17f9                	add	a5,a5,-2
    7748:	96f2                	add	a3,a3,t3
    774a:	8e8d                	sub	a3,a3,a1
    774c:	03d6d5b3          	divu	a1,a3,t4
    7750:	0742                	sll	a4,a4,0x10
    7752:	8341                	srl	a4,a4,0x10
    7754:	03d6f6b3          	remu	a3,a3,t4
    7758:	02b308b3          	mul	a7,t1,a1
    775c:	06c2                	sll	a3,a3,0x10
    775e:	8f55                	or	a4,a4,a3
    7760:	01177b63          	bgeu	a4,a7,7776 <__udivdi3+0x302>
    7764:	9772                	add	a4,a4,t3
    7766:	fff58693          	add	a3,a1,-1
    776a:	09c76963          	bltu	a4,t3,77fc <__udivdi3+0x388>
    776e:	09177763          	bgeu	a4,a7,77fc <__udivdi3+0x388>
    7772:	15f9                	add	a1,a1,-2
    7774:	9772                	add	a4,a4,t3
    7776:	07c2                	sll	a5,a5,0x10
    7778:	6ec1                	lui	t4,0x10
    777a:	8fcd                	or	a5,a5,a1
    777c:	fffe8693          	add	a3,t4,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    7780:	00d7f5b3          	and	a1,a5,a3
    7784:	0107d313          	srl	t1,a5,0x10
    7788:	8ef1                	and	a3,a3,a2
    778a:	8241                	srl	a2,a2,0x10
    778c:	02d58e33          	mul	t3,a1,a3
    7790:	41170733          	sub	a4,a4,a7
    7794:	02d306b3          	mul	a3,t1,a3
    7798:	010e5893          	srl	a7,t3,0x10
    779c:	02c585b3          	mul	a1,a1,a2
    77a0:	95b6                	add	a1,a1,a3
    77a2:	95c6                	add	a1,a1,a7
    77a4:	02c30333          	mul	t1,t1,a2
    77a8:	00d5f363          	bgeu	a1,a3,77ae <__udivdi3+0x33a>
    77ac:	9376                	add	t1,t1,t4
    77ae:	0105d693          	srl	a3,a1,0x10
    77b2:	969a                	add	a3,a3,t1
    77b4:	02d76363          	bltu	a4,a3,77da <__udivdi3+0x366>
    77b8:	00d70563          	beq	a4,a3,77c2 <__udivdi3+0x34e>
    77bc:	853e                	mv	a0,a5
    77be:	4581                	li	a1,0
    77c0:	8082                	ret
    77c2:	66c1                	lui	a3,0x10
    77c4:	16fd                	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    77c6:	00d5f733          	and	a4,a1,a3
    77ca:	0742                	sll	a4,a4,0x10
    77cc:	00de7e33          	and	t3,t3,a3
    77d0:	01051533          	sll	a0,a0,a6
    77d4:	9772                	add	a4,a4,t3
    77d6:	fee573e3          	bgeu	a0,a4,77bc <__udivdi3+0x348>
    77da:	fff78513          	add	a0,a5,-1
    77de:	4581                	li	a1,0
    77e0:	8082                	ret
    77e2:	010007b7          	lui	a5,0x1000
    77e6:	02f67763          	bgeu	a2,a5,7814 <__udivdi3+0x3a0>
    77ea:	01065693          	srl	a3,a2,0x10
    77ee:	4741                	li	a4,16
    77f0:	b345                	j	7590 <__udivdi3+0x11c>
    77f2:	4581                	li	a1,0
    77f4:	4505                	li	a0,1
    77f6:	8082                	ret
    77f8:	853a                	mv	a0,a4
    77fa:	b5d1                	j	76be <__udivdi3+0x24a>
    77fc:	85b6                	mv	a1,a3
    77fe:	bfa5                	j	7776 <__udivdi3+0x302>
    7800:	8e2a                	mv	t3,a0
    7802:	bd41                	j	7692 <__udivdi3+0x21e>
    7804:	87c6                	mv	a5,a7
    7806:	b791                	j	774a <__udivdi3+0x2d6>
    7808:	1579                	add	a0,a0,-2
    780a:	97c2                	add	a5,a5,a6
    780c:	bbd9                	j	75e2 <__udivdi3+0x16e>
    780e:	1579                	add	a0,a0,-2
    7810:	97c2                	add	a5,a5,a6
    7812:	b1d5                	j	74f6 <__udivdi3+0x82>
    7814:	01865693          	srl	a3,a2,0x18
    7818:	4761                	li	a4,24
    781a:	bb9d                	j	7590 <__udivdi3+0x11c>

0000781c <__adddf3>:
    781c:	001007b7          	lui	a5,0x100
    7820:	1101                	add	sp,sp,-32
    7822:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_rom_size+0xeffff>
    7826:	00bef833          	and	a6,t4,a1
    782a:	00def7b3          	and	a5,t4,a3
    782e:	0146d313          	srl	t1,a3,0x14
    7832:	c84a                	sw	s2,16(sp)
    7834:	0145d913          	srl	s2,a1,0x14
    7838:	078e                	sll	a5,a5,0x3
    783a:	cc22                	sw	s0,24(sp)
    783c:	080e                	sll	a6,a6,0x3
    783e:	01f5d413          	srl	s0,a1,0x1f
    7842:	01d55713          	srl	a4,a0,0x1d
    7846:	01d65893          	srl	a7,a2,0x1d
    784a:	7ff97913          	and	s2,s2,2047
    784e:	7ff37313          	and	t1,t1,2047
    7852:	ce06                	sw	ra,28(sp)
    7854:	ca26                	sw	s1,20(sp)
    7856:	c64e                	sw	s3,12(sp)
    7858:	82fd                	srl	a3,a3,0x1f
    785a:	00f8e8b3          	or	a7,a7,a5
    785e:	01076733          	or	a4,a4,a6
    7862:	00351593          	sll	a1,a0,0x3
    7866:	00361f13          	sll	t5,a2,0x3
    786a:	406907b3          	sub	a5,s2,t1
    786e:	18d40c63          	beq	s0,a3,7a06 <__adddf3+0x1ea>
    7872:	12f05363          	blez	a5,7998 <__adddf3+0x17c>
    7876:	22030263          	beqz	t1,7a9a <__adddf3+0x27e>
    787a:	7ff00693          	li	a3,2047
    787e:	38d90163          	beq	s2,a3,7c00 <__adddf3+0x3e4>
    7882:	03800693          	li	a3,56
    7886:	4605                	li	a2,1
    7888:	02f6ca63          	blt	a3,a5,78bc <__adddf3+0xa0>
    788c:	008006b7          	lui	a3,0x800
    7890:	00d8e8b3          	or	a7,a7,a3
    7894:	46fd                	li	a3,31
    7896:	44f6ce63          	blt	a3,a5,7cf2 <__adddf3+0x4d6>
    789a:	02000693          	li	a3,32
    789e:	8e9d                	sub	a3,a3,a5
    78a0:	00d89633          	sll	a2,a7,a3
    78a4:	00ff5533          	srl	a0,t5,a5
    78a8:	00df16b3          	sll	a3,t5,a3
    78ac:	8e49                	or	a2,a2,a0
    78ae:	00d036b3          	snez	a3,a3
    78b2:	00f8d8b3          	srl	a7,a7,a5
    78b6:	8e55                	or	a2,a2,a3
    78b8:	41170733          	sub	a4,a4,a7
    78bc:	40c58633          	sub	a2,a1,a2
    78c0:	00c5b5b3          	sltu	a1,a1,a2
    78c4:	84b2                	mv	s1,a2
    78c6:	40b709b3          	sub	s3,a4,a1
    78ca:	00899793          	sll	a5,s3,0x8
    78ce:	2a07db63          	bgez	a5,7b84 <__adddf3+0x368>
    78d2:	008007b7          	lui	a5,0x800
    78d6:	17fd                	add	a5,a5,-1 # 7fffff <__neorv32_rom_size+0x7effff>
    78d8:	00f9f9b3          	and	s3,s3,a5
    78dc:	24098f63          	beqz	s3,7b3a <__adddf3+0x31e>
    78e0:	854e                	mv	a0,s3
    78e2:	523010ef          	jal	9604 <__clzsi2>
    78e6:	ff850793          	add	a5,a0,-8
    78ea:	02000693          	li	a3,32
    78ee:	40f68733          	sub	a4,a3,a5
    78f2:	00e4d733          	srl	a4,s1,a4
    78f6:	00f999b3          	sll	s3,s3,a5
    78fa:	01376733          	or	a4,a4,s3
    78fe:	00f494b3          	sll	s1,s1,a5
    7902:	3f27c063          	blt	a5,s2,7ce2 <__adddf3+0x4c6>
    7906:	412787b3          	sub	a5,a5,s2
    790a:	0785                	add	a5,a5,1
    790c:	8e9d                	sub	a3,a3,a5
    790e:	00d49633          	sll	a2,s1,a3
    7912:	00f4d9b3          	srl	s3,s1,a5
    7916:	00c03633          	snez	a2,a2
    791a:	01366633          	or	a2,a2,s3
    791e:	00d716b3          	sll	a3,a4,a3
    7922:	00c6e4b3          	or	s1,a3,a2
    7926:	00f759b3          	srl	s3,a4,a5
    792a:	4901                	li	s2,0
    792c:	0074f793          	and	a5,s1,7
    7930:	cf81                	beqz	a5,7948 <__adddf3+0x12c>
    7932:	00f4f793          	and	a5,s1,15
    7936:	4711                	li	a4,4
    7938:	00e78863          	beq	a5,a4,7948 <__adddf3+0x12c>
    793c:	00448793          	add	a5,s1,4
    7940:	0097b633          	sltu	a2,a5,s1
    7944:	99b2                	add	s3,s3,a2
    7946:	84be                	mv	s1,a5
    7948:	00899793          	sll	a5,s3,0x8
    794c:	5807dd63          	bgez	a5,7ee6 <__adddf3+0x6ca>
    7950:	00190793          	add	a5,s2,1 # f001 <__crt0_copy_data_src_begin+0x49c9>
    7954:	7ff00713          	li	a4,2047
    7958:	8e22                	mv	t3,s0
    795a:	22e78e63          	beq	a5,a4,7b96 <__adddf3+0x37a>
    795e:	ff800737          	lui	a4,0xff800
    7962:	177d                	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    7964:	00e9f733          	and	a4,s3,a4
    7968:	7ff7f793          	and	a5,a5,2047
    796c:	01d71813          	sll	a6,a4,0x1d
    7970:	0034d613          	srl	a2,s1,0x3
    7974:	0726                	sll	a4,a4,0x9
    7976:	00c86833          	or	a6,a6,a2
    797a:	8331                	srl	a4,a4,0xc
    797c:	40f2                	lw	ra,28(sp)
    797e:	4462                	lw	s0,24(sp)
    7980:	07d2                	sll	a5,a5,0x14
    7982:	8fd9                	or	a5,a5,a4
    7984:	01fe1713          	sll	a4,t3,0x1f
    7988:	8fd9                	or	a5,a5,a4
    798a:	44d2                	lw	s1,20(sp)
    798c:	4942                	lw	s2,16(sp)
    798e:	49b2                	lw	s3,12(sp)
    7990:	8542                	mv	a0,a6
    7992:	85be                	mv	a1,a5
    7994:	6105                	add	sp,sp,32
    7996:	8082                	ret
    7998:	12078463          	beqz	a5,7ac0 <__adddf3+0x2a4>
    799c:	412307b3          	sub	a5,t1,s2
    79a0:	32091463          	bnez	s2,7cc8 <__adddf3+0x4ac>
    79a4:	00b76533          	or	a0,a4,a1
    79a8:	3e050c63          	beqz	a0,7da0 <__adddf3+0x584>
    79ac:	fff78513          	add	a0,a5,-1
    79b0:	4e050263          	beqz	a0,7e94 <__adddf3+0x678>
    79b4:	7ff00813          	li	a6,2047
    79b8:	47078963          	beq	a5,a6,7e2a <__adddf3+0x60e>
    79bc:	03800793          	li	a5,56
    79c0:	4605                	li	a2,1
    79c2:	02a7c863          	blt	a5,a0,79f2 <__adddf3+0x1d6>
    79c6:	87aa                	mv	a5,a0
    79c8:	467d                	li	a2,31
    79ca:	46f64963          	blt	a2,a5,7e3c <__adddf3+0x620>
    79ce:	02000513          	li	a0,32
    79d2:	8d1d                	sub	a0,a0,a5
    79d4:	00a71633          	sll	a2,a4,a0
    79d8:	00f5d833          	srl	a6,a1,a5
    79dc:	00a59533          	sll	a0,a1,a0
    79e0:	01066633          	or	a2,a2,a6
    79e4:	00a03533          	snez	a0,a0
    79e8:	00f75733          	srl	a4,a4,a5
    79ec:	8e49                	or	a2,a2,a0
    79ee:	40e888b3          	sub	a7,a7,a4
    79f2:	40cf0633          	sub	a2,t5,a2
    79f6:	00cf3733          	sltu	a4,t5,a2
    79fa:	84b2                	mv	s1,a2
    79fc:	40e889b3          	sub	s3,a7,a4
    7a00:	891a                	mv	s2,t1
    7a02:	8436                	mv	s0,a3
    7a04:	b5d9                	j	78ca <__adddf3+0xae>
    7a06:	18f05d63          	blez	a5,7ba0 <__adddf3+0x384>
    7a0a:	10031a63          	bnez	t1,7b1e <__adddf3+0x302>
    7a0e:	01e8e6b3          	or	a3,a7,t5
    7a12:	20068a63          	beqz	a3,7c26 <__adddf3+0x40a>
    7a16:	fff78693          	add	a3,a5,-1
    7a1a:	3a068663          	beqz	a3,7dc6 <__adddf3+0x5aa>
    7a1e:	7ff00613          	li	a2,2047
    7a22:	1cc78f63          	beq	a5,a2,7c00 <__adddf3+0x3e4>
    7a26:	03800793          	li	a5,56
    7a2a:	4985                	li	s3,1
    7a2c:	02d7c863          	blt	a5,a3,7a5c <__adddf3+0x240>
    7a30:	87b6                	mv	a5,a3
    7a32:	46fd                	li	a3,31
    7a34:	3cf6c163          	blt	a3,a5,7df6 <__adddf3+0x5da>
    7a38:	02000693          	li	a3,32
    7a3c:	8e9d                	sub	a3,a3,a5
    7a3e:	00d899b3          	sll	s3,a7,a3
    7a42:	00ff5633          	srl	a2,t5,a5
    7a46:	00df16b3          	sll	a3,t5,a3
    7a4a:	00c9e9b3          	or	s3,s3,a2
    7a4e:	00d036b3          	snez	a3,a3
    7a52:	00f8d8b3          	srl	a7,a7,a5
    7a56:	00d9e9b3          	or	s3,s3,a3
    7a5a:	9746                	add	a4,a4,a7
    7a5c:	95ce                	add	a1,a1,s3
    7a5e:	0135b9b3          	sltu	s3,a1,s3
    7a62:	84ae                	mv	s1,a1
    7a64:	99ba                	add	s3,s3,a4
    7a66:	00899793          	sll	a5,s3,0x8
    7a6a:	1007dd63          	bgez	a5,7b84 <__adddf3+0x368>
    7a6e:	0905                	add	s2,s2,1
    7a70:	7ff00793          	li	a5,2047
    7a74:	2ef90163          	beq	s2,a5,7d56 <__adddf3+0x53a>
    7a78:	ff8007b7          	lui	a5,0xff800
    7a7c:	17fd                	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    7a7e:	0014f613          	and	a2,s1,1
    7a82:	00f9f7b3          	and	a5,s3,a5
    7a86:	0014d713          	srl	a4,s1,0x1
    7a8a:	8f51                	or	a4,a4,a2
    7a8c:	01f79613          	sll	a2,a5,0x1f
    7a90:	00e664b3          	or	s1,a2,a4
    7a94:	0017d993          	srl	s3,a5,0x1
    7a98:	bd51                	j	792c <__adddf3+0x110>
    7a9a:	01e8e6b3          	or	a3,a7,t5
    7a9e:	18068463          	beqz	a3,7c26 <__adddf3+0x40a>
    7aa2:	fff78693          	add	a3,a5,-1
    7aa6:	32068d63          	beqz	a3,7de0 <__adddf3+0x5c4>
    7aaa:	7ff00613          	li	a2,2047
    7aae:	14c78963          	beq	a5,a2,7c00 <__adddf3+0x3e4>
    7ab2:	03800793          	li	a5,56
    7ab6:	4605                	li	a2,1
    7ab8:	e0d7c2e3          	blt	a5,a3,78bc <__adddf3+0xa0>
    7abc:	87b6                	mv	a5,a3
    7abe:	bbd9                	j	7894 <__adddf3+0x78>
    7ac0:	00190813          	add	a6,s2,1
    7ac4:	7fe87813          	and	a6,a6,2046
    7ac8:	1c081b63          	bnez	a6,7c9e <__adddf3+0x482>
    7acc:	00b76333          	or	t1,a4,a1
    7ad0:	01e8e833          	or	a6,a7,t5
    7ad4:	2c091b63          	bnez	s2,7daa <__adddf3+0x58e>
    7ad8:	38030b63          	beqz	t1,7e6e <__adddf3+0x652>
    7adc:	34080263          	beqz	a6,7e20 <__adddf3+0x604>
    7ae0:	41e589b3          	sub	s3,a1,t5
    7ae4:	0135b533          	sltu	a0,a1,s3
    7ae8:	41170633          	sub	a2,a4,a7
    7aec:	8e09                	sub	a2,a2,a0
    7aee:	00861513          	sll	a0,a2,0x8
    7af2:	40055463          	bgez	a0,7efa <__adddf3+0x6de>
    7af6:	40bf05b3          	sub	a1,t5,a1
    7afa:	40e88733          	sub	a4,a7,a4
    7afe:	00bf3f33          	sltu	t5,t5,a1
    7b02:	41e70733          	sub	a4,a4,t5
    7b06:	00871613          	sll	a2,a4,0x8
    7b0a:	84ae                	mv	s1,a1
    7b0c:	40065e63          	bgez	a2,7f28 <__adddf3+0x70c>
    7b10:	ff8007b7          	lui	a5,0xff800
    7b14:	17fd                	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    7b16:	8f7d                	and	a4,a4,a5
    7b18:	8e36                	mv	t3,a3
    7b1a:	4785                	li	a5,1
    7b1c:	bd81                	j	796c <__adddf3+0x150>
    7b1e:	7ff00693          	li	a3,2047
    7b22:	0cd90f63          	beq	s2,a3,7c00 <__adddf3+0x3e4>
    7b26:	03800693          	li	a3,56
    7b2a:	4985                	li	s3,1
    7b2c:	f2f6c8e3          	blt	a3,a5,7a5c <__adddf3+0x240>
    7b30:	008006b7          	lui	a3,0x800
    7b34:	00d8e8b3          	or	a7,a7,a3
    7b38:	bded                	j	7a32 <__adddf3+0x216>
    7b3a:	8526                	mv	a0,s1
    7b3c:	2c9010ef          	jal	9604 <__clzsi2>
    7b40:	01850793          	add	a5,a0,24
    7b44:	46fd                	li	a3,31
    7b46:	daf6d2e3          	bge	a3,a5,78ea <__adddf3+0xce>
    7b4a:	ff850713          	add	a4,a0,-8
    7b4e:	00e49733          	sll	a4,s1,a4
    7b52:	1d27c463          	blt	a5,s2,7d1a <__adddf3+0x4fe>
    7b56:	41278933          	sub	s2,a5,s2
    7b5a:	00190793          	add	a5,s2,1
    7b5e:	38f6d963          	bge	a3,a5,7ef0 <__adddf3+0x6d4>
    7b62:	1905                	add	s2,s2,-31
    7b64:	02000693          	li	a3,32
    7b68:	012754b3          	srl	s1,a4,s2
    7b6c:	00d78b63          	beq	a5,a3,7b82 <__adddf3+0x366>
    7b70:	04000693          	li	a3,64
    7b74:	40f687b3          	sub	a5,a3,a5
    7b78:	00f71733          	sll	a4,a4,a5
    7b7c:	00e03733          	snez	a4,a4
    7b80:	8cd9                	or	s1,s1,a4
    7b82:	4901                	li	s2,0
    7b84:	0074f793          	and	a5,s1,7
    7b88:	da0795e3          	bnez	a5,7932 <__adddf3+0x116>
    7b8c:	87ca                	mv	a5,s2
    7b8e:	0034d613          	srl	a2,s1,0x3
    7b92:	874e                	mv	a4,s3
    7b94:	a861                	j	7c2c <__adddf3+0x410>
    7b96:	7ff00793          	li	a5,2047
    7b9a:	4701                	li	a4,0
    7b9c:	4801                	li	a6,0
    7b9e:	bbf9                	j	797c <__adddf3+0x160>
    7ba0:	c7cd                	beqz	a5,7c4a <__adddf3+0x42e>
    7ba2:	412307b3          	sub	a5,t1,s2
    7ba6:	18090663          	beqz	s2,7d32 <__adddf3+0x516>
    7baa:	7ff00693          	li	a3,2047
    7bae:	28d30363          	beq	t1,a3,7e34 <__adddf3+0x618>
    7bb2:	03800693          	li	a3,56
    7bb6:	4985                	li	s3,1
    7bb8:	02f6ca63          	blt	a3,a5,7bec <__adddf3+0x3d0>
    7bbc:	008006b7          	lui	a3,0x800
    7bc0:	8f55                	or	a4,a4,a3
    7bc2:	46fd                	li	a3,31
    7bc4:	2ef6cd63          	blt	a3,a5,7ebe <__adddf3+0x6a2>
    7bc8:	02000693          	li	a3,32
    7bcc:	8e9d                	sub	a3,a3,a5
    7bce:	00d719b3          	sll	s3,a4,a3
    7bd2:	00f5d633          	srl	a2,a1,a5
    7bd6:	00d596b3          	sll	a3,a1,a3
    7bda:	00c9e9b3          	or	s3,s3,a2
    7bde:	00d036b3          	snez	a3,a3
    7be2:	00f75733          	srl	a4,a4,a5
    7be6:	00d9e9b3          	or	s3,s3,a3
    7bea:	98ba                	add	a7,a7,a4
    7bec:	01e98733          	add	a4,s3,t5
    7bf0:	013739b3          	sltu	s3,a4,s3
    7bf4:	84ba                	mv	s1,a4
    7bf6:	99c6                	add	s3,s3,a7
    7bf8:	891a                	mv	s2,t1
    7bfa:	b5b5                	j	7a66 <__adddf3+0x24a>
    7bfc:	00081e63          	bnez	a6,7c18 <__adddf3+0x3fc>
    7c00:	00351613          	sll	a2,a0,0x3
    7c04:	820d                	srl	a2,a2,0x3
    7c06:	01d71813          	sll	a6,a4,0x1d
    7c0a:	00c86833          	or	a6,a6,a2
    7c0e:	830d                	srl	a4,a4,0x3
    7c10:	01076733          	or	a4,a4,a6
    7c14:	14070163          	beqz	a4,7d56 <__adddf3+0x53a>
    7c18:	4e01                	li	t3,0
    7c1a:	7ff00793          	li	a5,2047
    7c1e:	00080737          	lui	a4,0x80
    7c22:	4801                	li	a6,0
    7c24:	bba1                	j	797c <__adddf3+0x160>
    7c26:	00351613          	sll	a2,a0,0x3
    7c2a:	820d                	srl	a2,a2,0x3
    7c2c:	01d71813          	sll	a6,a4,0x1d
    7c30:	7ff00693          	li	a3,2047
    7c34:	00c86833          	or	a6,a6,a2
    7c38:	830d                	srl	a4,a4,0x3
    7c3a:	fcd78be3          	beq	a5,a3,7c10 <__adddf3+0x3f4>
    7c3e:	0732                	sll	a4,a4,0xc
    7c40:	8331                	srl	a4,a4,0xc
    7c42:	7ff7f793          	and	a5,a5,2047
    7c46:	8e22                	mv	t3,s0
    7c48:	bb15                	j	797c <__adddf3+0x160>
    7c4a:	00190693          	add	a3,s2,1
    7c4e:	7fe6f813          	and	a6,a3,2046
    7c52:	10081863          	bnez	a6,7d62 <__adddf3+0x546>
    7c56:	00b766b3          	or	a3,a4,a1
    7c5a:	20091463          	bnez	s2,7e62 <__adddf3+0x646>
    7c5e:	24068b63          	beqz	a3,7eb4 <__adddf3+0x698>
    7c62:	01e8e6b3          	or	a3,a7,t5
    7c66:	1a068d63          	beqz	a3,7e20 <__adddf3+0x604>
    7c6a:	01e587b3          	add	a5,a1,t5
    7c6e:	00b7b5b3          	sltu	a1,a5,a1
    7c72:	9746                	add	a4,a4,a7
    7c74:	972e                	add	a4,a4,a1
    7c76:	0037d813          	srl	a6,a5,0x3
    7c7a:	00871793          	sll	a5,a4,0x8
    7c7e:	8e22                	mv	t3,s0
    7c80:	2807db63          	bgez	a5,7f16 <__adddf3+0x6fa>
    7c84:	ff8007b7          	lui	a5,0xff800
    7c88:	17fd                	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    7c8a:	8f7d                	and	a4,a4,a5
    7c8c:	01d71793          	sll	a5,a4,0x1d
    7c90:	830d                	srl	a4,a4,0x3
    7c92:	0107e833          	or	a6,a5,a6
    7c96:	01d77733          	and	a4,a4,t4
    7c9a:	4785                	li	a5,1
    7c9c:	b1c5                	j	797c <__adddf3+0x160>
    7c9e:	41e58833          	sub	a6,a1,t5
    7ca2:	0105b7b3          	sltu	a5,a1,a6
    7ca6:	411709b3          	sub	s3,a4,a7
    7caa:	40f989b3          	sub	s3,s3,a5
    7cae:	00899793          	sll	a5,s3,0x8
    7cb2:	84c2                	mv	s1,a6
    7cb4:	0c07cb63          	bltz	a5,7d8a <__adddf3+0x56e>
    7cb8:	01386833          	or	a6,a6,s3
    7cbc:	c20810e3          	bnez	a6,78dc <__adddf3+0xc0>
    7cc0:	4e01                	li	t3,0
    7cc2:	4781                	li	a5,0
    7cc4:	4701                	li	a4,0
    7cc6:	b95d                	j	797c <__adddf3+0x160>
    7cc8:	7ff00513          	li	a0,2047
    7ccc:	14a30f63          	beq	t1,a0,7e2a <__adddf3+0x60e>
    7cd0:	03800513          	li	a0,56
    7cd4:	4605                	li	a2,1
    7cd6:	d0f54ee3          	blt	a0,a5,79f2 <__adddf3+0x1d6>
    7cda:	00800637          	lui	a2,0x800
    7cde:	8f51                	or	a4,a4,a2
    7ce0:	b1e5                	j	79c8 <__adddf3+0x1ac>
    7ce2:	ff8009b7          	lui	s3,0xff800
    7ce6:	19fd                	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    7ce8:	40f90933          	sub	s2,s2,a5
    7cec:	013779b3          	and	s3,a4,s3
    7cf0:	b935                	j	792c <__adddf3+0x110>
    7cf2:	fe078693          	add	a3,a5,-32
    7cf6:	02000613          	li	a2,32
    7cfa:	00d8d6b3          	srl	a3,a7,a3
    7cfe:	00c78a63          	beq	a5,a2,7d12 <__adddf3+0x4f6>
    7d02:	04000613          	li	a2,64
    7d06:	40f607b3          	sub	a5,a2,a5
    7d0a:	00f897b3          	sll	a5,a7,a5
    7d0e:	00ff6f33          	or	t5,t5,a5
    7d12:	01e03633          	snez	a2,t5
    7d16:	8e55                	or	a2,a2,a3
    7d18:	b655                	j	78bc <__adddf3+0xa0>
    7d1a:	ff8006b7          	lui	a3,0xff800
    7d1e:	16fd                	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    7d20:	40f907b3          	sub	a5,s2,a5
    7d24:	8f75                	and	a4,a4,a3
    7d26:	01d71813          	sll	a6,a4,0x1d
    7d2a:	01386833          	or	a6,a6,s3
    7d2e:	830d                	srl	a4,a4,0x3
    7d30:	b739                	j	7c3e <__adddf3+0x422>
    7d32:	00b766b3          	or	a3,a4,a1
    7d36:	16068b63          	beqz	a3,7eac <__adddf3+0x690>
    7d3a:	fff78693          	add	a3,a5,-1
    7d3e:	c6c1                	beqz	a3,7dc6 <__adddf3+0x5aa>
    7d40:	7ff00513          	li	a0,2047
    7d44:	0ea78863          	beq	a5,a0,7e34 <__adddf3+0x618>
    7d48:	03800793          	li	a5,56
    7d4c:	4985                	li	s3,1
    7d4e:	e8d7cfe3          	blt	a5,a3,7bec <__adddf3+0x3d0>
    7d52:	87b6                	mv	a5,a3
    7d54:	b5bd                	j	7bc2 <__adddf3+0x3a6>
    7d56:	8e22                	mv	t3,s0
    7d58:	7ff00793          	li	a5,2047
    7d5c:	4701                	li	a4,0
    7d5e:	4801                	li	a6,0
    7d60:	b931                	j	797c <__adddf3+0x160>
    7d62:	7ff00793          	li	a5,2047
    7d66:	fef688e3          	beq	a3,a5,7d56 <__adddf3+0x53a>
    7d6a:	9f2e                	add	t5,t5,a1
    7d6c:	00bf35b3          	sltu	a1,t5,a1
    7d70:	011707b3          	add	a5,a4,a7
    7d74:	97ae                	add	a5,a5,a1
    7d76:	01f79613          	sll	a2,a5,0x1f
    7d7a:	001f5f13          	srl	t5,t5,0x1
    7d7e:	01e664b3          	or	s1,a2,t5
    7d82:	0017d993          	srl	s3,a5,0x1
    7d86:	8936                	mv	s2,a3
    7d88:	b655                	j	792c <__adddf3+0x110>
    7d8a:	40bf0633          	sub	a2,t5,a1
    7d8e:	40e887b3          	sub	a5,a7,a4
    7d92:	00cf3733          	sltu	a4,t5,a2
    7d96:	84b2                	mv	s1,a2
    7d98:	40e789b3          	sub	s3,a5,a4
    7d9c:	8436                	mv	s0,a3
    7d9e:	be3d                	j	78dc <__adddf3+0xc0>
    7da0:	060e                	sll	a2,a2,0x3
    7da2:	820d                	srl	a2,a2,0x3
    7da4:	8436                	mv	s0,a3
    7da6:	8746                	mv	a4,a7
    7da8:	b551                	j	7c2c <__adddf3+0x410>
    7daa:	e40319e3          	bnez	t1,7bfc <__adddf3+0x3e0>
    7dae:	14080e63          	beqz	a6,7f0a <__adddf3+0x6ee>
    7db2:	0038d713          	srl	a4,a7,0x3
    7db6:	060e                	sll	a2,a2,0x3
    7db8:	08f6                	sll	a7,a7,0x1d
    7dba:	01176733          	or	a4,a4,a7
    7dbe:	820d                	srl	a2,a2,0x3
    7dc0:	8f51                	or	a4,a4,a2
    7dc2:	8436                	mv	s0,a3
    7dc4:	bd81                	j	7c14 <__adddf3+0x3f8>
    7dc6:	9f2e                	add	t5,t5,a1
    7dc8:	98ba                	add	a7,a7,a4
    7dca:	00bf35b3          	sltu	a1,t5,a1
    7dce:	00b889b3          	add	s3,a7,a1
    7dd2:	00899793          	sll	a5,s3,0x8
    7dd6:	84fa                	mv	s1,t5
    7dd8:	0a07dc63          	bgez	a5,7e90 <__adddf3+0x674>
    7ddc:	4909                	li	s2,2
    7dde:	b969                	j	7a78 <__adddf3+0x25c>
    7de0:	41e58f33          	sub	t5,a1,t5
    7de4:	411708b3          	sub	a7,a4,a7
    7de8:	01e5b5b3          	sltu	a1,a1,t5
    7dec:	84fa                	mv	s1,t5
    7dee:	40b889b3          	sub	s3,a7,a1
    7df2:	4905                	li	s2,1
    7df4:	bcd9                	j	78ca <__adddf3+0xae>
    7df6:	fe078693          	add	a3,a5,-32
    7dfa:	02000613          	li	a2,32
    7dfe:	00d8d6b3          	srl	a3,a7,a3
    7e02:	00c78a63          	beq	a5,a2,7e16 <__adddf3+0x5fa>
    7e06:	04000613          	li	a2,64
    7e0a:	40f607b3          	sub	a5,a2,a5
    7e0e:	00f897b3          	sll	a5,a7,a5
    7e12:	00ff6f33          	or	t5,t5,a5
    7e16:	01e039b3          	snez	s3,t5
    7e1a:	00d9e9b3          	or	s3,s3,a3
    7e1e:	b93d                	j	7a5c <__adddf3+0x240>
    7e20:	00351613          	sll	a2,a0,0x3
    7e24:	00365993          	srl	s3,a2,0x3
    7e28:	bdfd                	j	7d26 <__adddf3+0x50a>
    7e2a:	060e                	sll	a2,a2,0x3
    7e2c:	820d                	srl	a2,a2,0x3
    7e2e:	8436                	mv	s0,a3
    7e30:	8746                	mv	a4,a7
    7e32:	bbd1                	j	7c06 <__adddf3+0x3ea>
    7e34:	060e                	sll	a2,a2,0x3
    7e36:	820d                	srl	a2,a2,0x3
    7e38:	8746                	mv	a4,a7
    7e3a:	b3f1                	j	7c06 <__adddf3+0x3ea>
    7e3c:	fe078513          	add	a0,a5,-32
    7e40:	02000613          	li	a2,32
    7e44:	00a75533          	srl	a0,a4,a0
    7e48:	00c78963          	beq	a5,a2,7e5a <__adddf3+0x63e>
    7e4c:	04000613          	li	a2,64
    7e50:	40f607b3          	sub	a5,a2,a5
    7e54:	00f717b3          	sll	a5,a4,a5
    7e58:	8ddd                	or	a1,a1,a5
    7e5a:	00b03633          	snez	a2,a1
    7e5e:	8e49                	or	a2,a2,a0
    7e60:	be49                	j	79f2 <__adddf3+0x1d6>
    7e62:	dae9                	beqz	a3,7e34 <__adddf3+0x618>
    7e64:	01e8ef33          	or	t5,a7,t5
    7e68:	da0f18e3          	bnez	t5,7c18 <__adddf3+0x3fc>
    7e6c:	bb51                	j	7c00 <__adddf3+0x3e4>
    7e6e:	e40809e3          	beqz	a6,7cc0 <__adddf3+0x4a4>
    7e72:	00361813          	sll	a6,a2,0x3
    7e76:	01d89793          	sll	a5,a7,0x1d
    7e7a:	00385813          	srl	a6,a6,0x3
    7e7e:	0038d713          	srl	a4,a7,0x3
    7e82:	00f86833          	or	a6,a6,a5
    7e86:	01d77733          	and	a4,a4,t4
    7e8a:	8e36                	mv	t3,a3
    7e8c:	4781                	li	a5,0
    7e8e:	b4fd                	j	797c <__adddf3+0x160>
    7e90:	4785                	li	a5,1
    7e92:	b9f5                	j	7b8e <__adddf3+0x372>
    7e94:	40bf05b3          	sub	a1,t5,a1
    7e98:	40e888b3          	sub	a7,a7,a4
    7e9c:	00bf3733          	sltu	a4,t5,a1
    7ea0:	84ae                	mv	s1,a1
    7ea2:	40e889b3          	sub	s3,a7,a4
    7ea6:	8436                	mv	s0,a3
    7ea8:	4905                	li	s2,1
    7eaa:	b405                	j	78ca <__adddf3+0xae>
    7eac:	060e                	sll	a2,a2,0x3
    7eae:	820d                	srl	a2,a2,0x3
    7eb0:	8746                	mv	a4,a7
    7eb2:	bbad                	j	7c2c <__adddf3+0x410>
    7eb4:	060e                	sll	a2,a2,0x3
    7eb6:	00365993          	srl	s3,a2,0x3
    7eba:	8746                	mv	a4,a7
    7ebc:	b5ad                	j	7d26 <__adddf3+0x50a>
    7ebe:	fe078693          	add	a3,a5,-32
    7ec2:	02000613          	li	a2,32
    7ec6:	00d756b3          	srl	a3,a4,a3
    7eca:	00c78963          	beq	a5,a2,7edc <__adddf3+0x6c0>
    7ece:	04000613          	li	a2,64
    7ed2:	40f607b3          	sub	a5,a2,a5
    7ed6:	00f717b3          	sll	a5,a4,a5
    7eda:	8ddd                	or	a1,a1,a5
    7edc:	00b039b3          	snez	s3,a1
    7ee0:	00d9e9b3          	or	s3,s3,a3
    7ee4:	b321                	j	7bec <__adddf3+0x3d0>
    7ee6:	0034d613          	srl	a2,s1,0x3
    7eea:	87ca                	mv	a5,s2
    7eec:	874e                	mv	a4,s3
    7eee:	bb3d                	j	7c2c <__adddf3+0x410>
    7ef0:	02000693          	li	a3,32
    7ef4:	8e9d                	sub	a3,a3,a5
    7ef6:	4601                	li	a2,0
    7ef8:	b40d                	j	791a <__adddf3+0xfe>
    7efa:	00c9e833          	or	a6,s3,a2
    7efe:	dc0801e3          	beqz	a6,7cc0 <__adddf3+0x4a4>
    7f02:	0039d993          	srl	s3,s3,0x3
    7f06:	8732                	mv	a4,a2
    7f08:	bd39                	j	7d26 <__adddf3+0x50a>
    7f0a:	4e01                	li	t3,0
    7f0c:	7ff00793          	li	a5,2047
    7f10:	00080737          	lui	a4,0x80
    7f14:	b4a5                	j	797c <__adddf3+0x160>
    7f16:	01d71793          	sll	a5,a4,0x1d
    7f1a:	830d                	srl	a4,a4,0x3
    7f1c:	0107e833          	or	a6,a5,a6
    7f20:	01d77733          	and	a4,a4,t4
    7f24:	4781                	li	a5,0
    7f26:	bc99                	j	797c <__adddf3+0x160>
    7f28:	01d71813          	sll	a6,a4,0x1d
    7f2c:	818d                	srl	a1,a1,0x3
    7f2e:	00b86833          	or	a6,a6,a1
    7f32:	830d                	srl	a4,a4,0x3
    7f34:	8436                	mv	s0,a3
    7f36:	b321                	j	7c3e <__adddf3+0x422>

00007f38 <__divdf3>:
    7f38:	7179                	add	sp,sp,-48
    7f3a:	ce4e                	sw	s3,28(sp)
    7f3c:	0145d993          	srl	s3,a1,0x14
    7f40:	d422                	sw	s0,40(sp)
    7f42:	d226                	sw	s1,36(sp)
    7f44:	d04a                	sw	s2,32(sp)
    7f46:	cc52                	sw	s4,24(sp)
    7f48:	c65e                	sw	s7,12(sp)
    7f4a:	00c59493          	sll	s1,a1,0xc
    7f4e:	d606                	sw	ra,44(sp)
    7f50:	ca56                	sw	s5,20(sp)
    7f52:	c85a                	sw	s6,16(sp)
    7f54:	c462                	sw	s8,8(sp)
    7f56:	7ff9f993          	and	s3,s3,2047
    7f5a:	842a                	mv	s0,a0
    7f5c:	8bb2                	mv	s7,a2
    7f5e:	8936                	mv	s2,a3
    7f60:	80b1                	srl	s1,s1,0xc
    7f62:	01f5da13          	srl	s4,a1,0x1f
    7f66:	12098363          	beqz	s3,808c <__divdf3+0x154>
    7f6a:	7ff00793          	li	a5,2047
    7f6e:	06f98a63          	beq	s3,a5,7fe2 <__divdf3+0xaa>
    7f72:	048e                	sll	s1,s1,0x3
    7f74:	01d55793          	srl	a5,a0,0x1d
    7f78:	8fc5                	or	a5,a5,s1
    7f7a:	00800737          	lui	a4,0x800
    7f7e:	00e7eab3          	or	s5,a5,a4
    7f82:	00351b13          	sll	s6,a0,0x3
    7f86:	c0198993          	add	s3,s3,-1023
    7f8a:	4481                	li	s1,0
    7f8c:	4c01                	li	s8,0
    7f8e:	01495793          	srl	a5,s2,0x14
    7f92:	00c91413          	sll	s0,s2,0xc
    7f96:	7ff7f793          	and	a5,a5,2047
    7f9a:	8031                	srl	s0,s0,0xc
    7f9c:	01f95913          	srl	s2,s2,0x1f
    7fa0:	c7a5                	beqz	a5,8008 <__divdf3+0xd0>
    7fa2:	7ff00713          	li	a4,2047
    7fa6:	12e78263          	beq	a5,a4,80ca <__divdf3+0x192>
    7faa:	040e                	sll	s0,s0,0x3
    7fac:	01dbd713          	srl	a4,s7,0x1d
    7fb0:	8f41                	or	a4,a4,s0
    7fb2:	c0178793          	add	a5,a5,-1023
    7fb6:	00800437          	lui	s0,0x800
    7fba:	8c59                	or	s0,s0,a4
    7fbc:	003b9893          	sll	a7,s7,0x3
    7fc0:	40f989b3          	sub	s3,s3,a5
    7fc4:	4601                	li	a2,0
    7fc6:	473d                	li	a4,15
    7fc8:	012a46b3          	xor	a3,s4,s2
    7fcc:	1a976163          	bltu	a4,s1,816e <__divdf3+0x236>
    7fd0:	00002717          	auipc	a4,0x2
    7fd4:	52870713          	add	a4,a4,1320 # a4f8 <_ctype_+0x104>
    7fd8:	048a                	sll	s1,s1,0x2
    7fda:	94ba                	add	s1,s1,a4
    7fdc:	409c                	lw	a5,0(s1)
    7fde:	97ba                	add	a5,a5,a4
    7fe0:	8782                	jr	a5
    7fe2:	00a4eab3          	or	s5,s1,a0
    7fe6:	140a9e63          	bnez	s5,8142 <__divdf3+0x20a>
    7fea:	01495793          	srl	a5,s2,0x14
    7fee:	00c91413          	sll	s0,s2,0xc
    7ff2:	7ff7f793          	and	a5,a5,2047
    7ff6:	4b01                	li	s6,0
    7ff8:	44a1                	li	s1,8
    7ffa:	7ff00993          	li	s3,2047
    7ffe:	4c09                	li	s8,2
    8000:	8031                	srl	s0,s0,0xc
    8002:	01f95913          	srl	s2,s2,0x1f
    8006:	ffd1                	bnez	a5,7fa2 <__divdf3+0x6a>
    8008:	017468b3          	or	a7,s0,s7
    800c:	14088263          	beqz	a7,8150 <__divdf3+0x218>
    8010:	38040e63          	beqz	s0,83ac <__divdf3+0x474>
    8014:	8522                	mv	a0,s0
    8016:	5ee010ef          	jal	9604 <__clzsi2>
    801a:	87aa                	mv	a5,a0
    801c:	ff550693          	add	a3,a0,-11
    8020:	4775                	li	a4,29
    8022:	ff878893          	add	a7,a5,-8
    8026:	8f15                	sub	a4,a4,a3
    8028:	01141433          	sll	s0,s0,a7
    802c:	00ebd733          	srl	a4,s7,a4
    8030:	8c59                	or	s0,s0,a4
    8032:	011b98b3          	sll	a7,s7,a7
    8036:	97ce                	add	a5,a5,s3
    8038:	3f378993          	add	s3,a5,1011
    803c:	4601                	li	a2,0
    803e:	b761                	j	7fc6 <__divdf3+0x8e>
    8040:	8f1d                	sub	a4,a4,a5
    8042:	03800613          	li	a2,56
    8046:	3ce65663          	bge	a2,a4,8412 <__divdf3+0x4da>
    804a:	4781                	li	a5,0
    804c:	4601                	li	a2,0
    804e:	4701                	li	a4,0
    8050:	50b2                	lw	ra,44(sp)
    8052:	5422                	lw	s0,40(sp)
    8054:	07d2                	sll	a5,a5,0x14
    8056:	8fd1                	or	a5,a5,a2
    8058:	06fe                	sll	a3,a3,0x1f
    805a:	8fd5                	or	a5,a5,a3
    805c:	5492                	lw	s1,36(sp)
    805e:	5902                	lw	s2,32(sp)
    8060:	49f2                	lw	s3,28(sp)
    8062:	4a62                	lw	s4,24(sp)
    8064:	4ad2                	lw	s5,20(sp)
    8066:	4b42                	lw	s6,16(sp)
    8068:	4bb2                	lw	s7,12(sp)
    806a:	4c22                	lw	s8,8(sp)
    806c:	853a                	mv	a0,a4
    806e:	85be                	mv	a1,a5
    8070:	6145                	add	sp,sp,48
    8072:	8082                	ret
    8074:	7ff00793          	li	a5,2047
    8078:	4601                	li	a2,0
    807a:	4701                	li	a4,0
    807c:	bfd1                	j	8050 <__divdf3+0x118>
    807e:	4681                	li	a3,0
    8080:	7ff00793          	li	a5,2047
    8084:	00080637          	lui	a2,0x80
    8088:	4701                	li	a4,0
    808a:	b7d9                	j	8050 <__divdf3+0x118>
    808c:	00a4eab3          	or	s5,s1,a0
    8090:	0c0a8a63          	beqz	s5,8164 <__divdf3+0x22c>
    8094:	32048b63          	beqz	s1,83ca <__divdf3+0x492>
    8098:	8526                	mv	a0,s1
    809a:	56a010ef          	jal	9604 <__clzsi2>
    809e:	872a                	mv	a4,a0
    80a0:	ff550693          	add	a3,a0,-11
    80a4:	47f5                	li	a5,29
    80a6:	ff870b13          	add	s6,a4,-8
    80aa:	8f95                	sub	a5,a5,a3
    80ac:	016494b3          	sll	s1,s1,s6
    80b0:	00f457b3          	srl	a5,s0,a5
    80b4:	0097eab3          	or	s5,a5,s1
    80b8:	01641b33          	sll	s6,s0,s6
    80bc:	c0d00993          	li	s3,-1011
    80c0:	40e989b3          	sub	s3,s3,a4
    80c4:	4481                	li	s1,0
    80c6:	4c01                	li	s8,0
    80c8:	b5d9                	j	7f8e <__divdf3+0x56>
    80ca:	017468b3          	or	a7,s0,s7
    80ce:	80198993          	add	s3,s3,-2047
    80d2:	08089463          	bnez	a7,815a <__divdf3+0x222>
    80d6:	0024e493          	or	s1,s1,2
    80da:	4401                	li	s0,0
    80dc:	4609                	li	a2,2
    80de:	b5e5                	j	7fc6 <__divdf3+0x8e>
    80e0:	8952                	mv	s2,s4
    80e2:	8456                	mv	s0,s5
    80e4:	88da                	mv	a7,s6
    80e6:	4789                	li	a5,2
    80e8:	3efc0163          	beq	s8,a5,84ca <__divdf3+0x592>
    80ec:	478d                	li	a5,3
    80ee:	f8fc08e3          	beq	s8,a5,807e <__divdf3+0x146>
    80f2:	4785                	li	a5,1
    80f4:	86ca                	mv	a3,s2
    80f6:	f4fc0ae3          	beq	s8,a5,804a <__divdf3+0x112>
    80fa:	3ff98793          	add	a5,s3,1023
    80fe:	20f05e63          	blez	a5,831a <__divdf3+0x3e2>
    8102:	0078f713          	and	a4,a7,7
    8106:	3a071863          	bnez	a4,84b6 <__divdf3+0x57e>
    810a:	00741713          	sll	a4,s0,0x7
    810e:	00075863          	bgez	a4,811e <__divdf3+0x1e6>
    8112:	ff0007b7          	lui	a5,0xff000
    8116:	17fd                	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7effc000>
    8118:	8c7d                	and	s0,s0,a5
    811a:	40098793          	add	a5,s3,1024
    811e:	7fe00713          	li	a4,2046
    8122:	f4f749e3          	blt	a4,a5,8074 <__divdf3+0x13c>
    8126:	0038d893          	srl	a7,a7,0x3
    812a:	01d41713          	sll	a4,s0,0x1d
    812e:	00941613          	sll	a2,s0,0x9
    8132:	01176733          	or	a4,a4,a7
    8136:	8231                	srl	a2,a2,0xc
    8138:	7ff7f793          	and	a5,a5,2047
    813c:	bf11                	j	8050 <__divdf3+0x118>
    813e:	8c32                	mv	s8,a2
    8140:	b75d                	j	80e6 <__divdf3+0x1ae>
    8142:	8aa6                	mv	s5,s1
    8144:	8b2a                	mv	s6,a0
    8146:	44b1                	li	s1,12
    8148:	7ff00993          	li	s3,2047
    814c:	4c0d                	li	s8,3
    814e:	b581                	j	7f8e <__divdf3+0x56>
    8150:	0014e493          	or	s1,s1,1
    8154:	4401                	li	s0,0
    8156:	4605                	li	a2,1
    8158:	b5bd                	j	7fc6 <__divdf3+0x8e>
    815a:	0034e493          	or	s1,s1,3
    815e:	88de                	mv	a7,s7
    8160:	460d                	li	a2,3
    8162:	b595                	j	7fc6 <__divdf3+0x8e>
    8164:	4b01                	li	s6,0
    8166:	4491                	li	s1,4
    8168:	4981                	li	s3,0
    816a:	4c05                	li	s8,1
    816c:	b50d                	j	7f8e <__divdf3+0x56>
    816e:	23546563          	bltu	s0,s5,8398 <__divdf3+0x460>
    8172:	228a8163          	beq	s5,s0,8394 <__divdf3+0x45c>
    8176:	835a                	mv	t1,s6
    8178:	19fd                	add	s3,s3,-1
    817a:	87d6                	mv	a5,s5
    817c:	4b01                	li	s6,0
    817e:	00841713          	sll	a4,s0,0x8
    8182:	01075513          	srl	a0,a4,0x10
    8186:	02a7d433          	divu	s0,a5,a0
    818a:	0188d613          	srl	a2,a7,0x18
    818e:	8e59                	or	a2,a2,a4
    8190:	01061813          	sll	a6,a2,0x10
    8194:	01085813          	srl	a6,a6,0x10
    8198:	00889593          	sll	a1,a7,0x8
    819c:	01035713          	srl	a4,t1,0x10
    81a0:	02a7f7b3          	remu	a5,a5,a0
    81a4:	028808b3          	mul	a7,a6,s0
    81a8:	07c2                	sll	a5,a5,0x10
    81aa:	8fd9                	or	a5,a5,a4
    81ac:	0117f863          	bgeu	a5,a7,81bc <__divdf3+0x284>
    81b0:	97b2                	add	a5,a5,a2
    81b2:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_rom_size+0x7effff>
    81b6:	24c7f963          	bgeu	a5,a2,8408 <__divdf3+0x4d0>
    81ba:	843a                	mv	s0,a4
    81bc:	411787b3          	sub	a5,a5,a7
    81c0:	02a7d8b3          	divu	a7,a5,a0
    81c4:	01031713          	sll	a4,t1,0x10
    81c8:	8341                	srl	a4,a4,0x10
    81ca:	02a7f7b3          	remu	a5,a5,a0
    81ce:	03180fb3          	mul	t6,a6,a7
    81d2:	07c2                	sll	a5,a5,0x10
    81d4:	8f5d                	or	a4,a4,a5
    81d6:	01f77863          	bgeu	a4,t6,81e6 <__divdf3+0x2ae>
    81da:	9732                	add	a4,a4,a2
    81dc:	fff88793          	add	a5,a7,-1
    81e0:	20c77f63          	bgeu	a4,a2,83fe <__divdf3+0x4c6>
    81e4:	88be                	mv	a7,a5
    81e6:	0442                	sll	s0,s0,0x10
    81e8:	62c1                	lui	t0,0x10
    81ea:	01146433          	or	s0,s0,a7
    81ee:	fff28313          	add	t1,t0,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    81f2:	006478b3          	and	a7,s0,t1
    81f6:	01045e93          	srl	t4,s0,0x10
    81fa:	0105de13          	srl	t3,a1,0x10
    81fe:	0065f333          	and	t1,a1,t1
    8202:	03130f33          	mul	t5,t1,a7
    8206:	41f70733          	sub	a4,a4,t6
    820a:	031e08b3          	mul	a7,t3,a7
    820e:	010f5793          	srl	a5,t5,0x10
    8212:	026e8fb3          	mul	t6,t4,t1
    8216:	98fe                	add	a7,a7,t6
    8218:	97c6                	add	a5,a5,a7
    821a:	03ce8eb3          	mul	t4,t4,t3
    821e:	01f7f363          	bgeu	a5,t6,8224 <__divdf3+0x2ec>
    8222:	9e96                	add	t4,t4,t0
    8224:	6fc1                	lui	t6,0x10
    8226:	1ffd                	add	t6,t6,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    8228:	0107d893          	srl	a7,a5,0x10
    822c:	01f7f7b3          	and	a5,a5,t6
    8230:	07c2                	sll	a5,a5,0x10
    8232:	01ff7f33          	and	t5,t5,t6
    8236:	98f6                	add	a7,a7,t4
    8238:	97fa                	add	a5,a5,t5
    823a:	13176b63          	bltu	a4,a7,8370 <__divdf3+0x438>
    823e:	13170763          	beq	a4,a7,836c <__divdf3+0x434>
    8242:	40fb07b3          	sub	a5,s6,a5
    8246:	41170733          	sub	a4,a4,a7
    824a:	00fb3b33          	sltu	s6,s6,a5
    824e:	41670733          	sub	a4,a4,s6
    8252:	24e60463          	beq	a2,a4,849a <__divdf3+0x562>
    8256:	02a758b3          	divu	a7,a4,a0
    825a:	0107de93          	srl	t4,a5,0x10
    825e:	02a77733          	remu	a4,a4,a0
    8262:	03180f33          	mul	t5,a6,a7
    8266:	0742                	sll	a4,a4,0x10
    8268:	00eee733          	or	a4,t4,a4
    826c:	01e77b63          	bgeu	a4,t5,8282 <__divdf3+0x34a>
    8270:	9732                	add	a4,a4,a2
    8272:	fff88e93          	add	t4,a7,-1
    8276:	24c76863          	bltu	a4,a2,84c6 <__divdf3+0x58e>
    827a:	25e77663          	bgeu	a4,t5,84c6 <__divdf3+0x58e>
    827e:	18f9                	add	a7,a7,-2
    8280:	9732                	add	a4,a4,a2
    8282:	41e70733          	sub	a4,a4,t5
    8286:	02a75eb3          	divu	t4,a4,a0
    828a:	07c2                	sll	a5,a5,0x10
    828c:	83c1                	srl	a5,a5,0x10
    828e:	02a77733          	remu	a4,a4,a0
    8292:	03d80833          	mul	a6,a6,t4
    8296:	0742                	sll	a4,a4,0x10
    8298:	8fd9                	or	a5,a5,a4
    829a:	0107fb63          	bgeu	a5,a6,82b0 <__divdf3+0x378>
    829e:	97b2                	add	a5,a5,a2
    82a0:	fffe8713          	add	a4,t4,-1
    82a4:	20c7ef63          	bltu	a5,a2,84c2 <__divdf3+0x58a>
    82a8:	2107fd63          	bgeu	a5,a6,84c2 <__divdf3+0x58a>
    82ac:	1ef9                	add	t4,t4,-2
    82ae:	97b2                	add	a5,a5,a2
    82b0:	08c2                	sll	a7,a7,0x10
    82b2:	01d8e8b3          	or	a7,a7,t4
    82b6:	01089513          	sll	a0,a7,0x10
    82ba:	0108df13          	srl	t5,a7,0x10
    82be:	8141                	srl	a0,a0,0x10
    82c0:	02650eb3          	mul	t4,a0,t1
    82c4:	410787b3          	sub	a5,a5,a6
    82c8:	02ae0533          	mul	a0,t3,a0
    82cc:	010ed713          	srl	a4,t4,0x10
    82d0:	026f0333          	mul	t1,t5,t1
    82d4:	951a                	add	a0,a0,t1
    82d6:	972a                	add	a4,a4,a0
    82d8:	03ee0e33          	mul	t3,t3,t5
    82dc:	00677463          	bgeu	a4,t1,82e4 <__divdf3+0x3ac>
    82e0:	6541                	lui	a0,0x10
    82e2:	9e2a                	add	t3,t3,a0
    82e4:	6841                	lui	a6,0x10
    82e6:	187d                	add	a6,a6,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    82e8:	01075513          	srl	a0,a4,0x10
    82ec:	01077733          	and	a4,a4,a6
    82f0:	0742                	sll	a4,a4,0x10
    82f2:	010efeb3          	and	t4,t4,a6
    82f6:	9572                	add	a0,a0,t3
    82f8:	9776                	add	a4,a4,t4
    82fa:	0ea7f763          	bgeu	a5,a0,83e8 <__divdf3+0x4b0>
    82fe:	97b2                	add	a5,a5,a2
    8300:	fff88313          	add	t1,a7,-1
    8304:	883e                	mv	a6,a5
    8306:	16c7e863          	bltu	a5,a2,8476 <__divdf3+0x53e>
    830a:	1ca7e663          	bltu	a5,a0,84d6 <__divdf3+0x59e>
    830e:	1ca78f63          	beq	a5,a0,84ec <__divdf3+0x5b4>
    8312:	889a                	mv	a7,t1
    8314:	0018e893          	or	a7,a7,1
    8318:	b3cd                	j	80fa <__divdf3+0x1c2>
    831a:	4705                	li	a4,1
    831c:	d20792e3          	bnez	a5,8040 <__divdf3+0x108>
    8320:	41e98993          	add	s3,s3,1054
    8324:	013897b3          	sll	a5,a7,s3
    8328:	00f037b3          	snez	a5,a5
    832c:	013419b3          	sll	s3,s0,s3
    8330:	0137e7b3          	or	a5,a5,s3
    8334:	00e8d8b3          	srl	a7,a7,a4
    8338:	00f8e8b3          	or	a7,a7,a5
    833c:	0078f793          	and	a5,a7,7
    8340:	00e45433          	srl	s0,s0,a4
    8344:	cf81                	beqz	a5,835c <__divdf3+0x424>
    8346:	00f8f793          	and	a5,a7,15
    834a:	4711                	li	a4,4
    834c:	00e78863          	beq	a5,a4,835c <__divdf3+0x424>
    8350:	00488793          	add	a5,a7,4
    8354:	0117b8b3          	sltu	a7,a5,a7
    8358:	9446                	add	s0,s0,a7
    835a:	88be                	mv	a7,a5
    835c:	00841593          	sll	a1,s0,0x8
    8360:	4785                	li	a5,1
    8362:	4601                	li	a2,0
    8364:	4701                	li	a4,0
    8366:	ce05c5e3          	bltz	a1,8050 <__divdf3+0x118>
    836a:	a8dd                	j	8460 <__divdf3+0x528>
    836c:	ecfb7be3          	bgeu	s6,a5,8242 <__divdf3+0x30a>
    8370:	00bb0eb3          	add	t4,s6,a1
    8374:	016ebf33          	sltu	t5,t4,s6
    8378:	00cf0fb3          	add	t6,t5,a2
    837c:	977e                	add	a4,a4,t6
    837e:	8b76                	mv	s6,t4
    8380:	fff40f93          	add	t6,s0,-1
    8384:	06e67763          	bgeu	a2,a4,83f2 <__divdf3+0x4ba>
    8388:	11176163          	bltu	a4,a7,848a <__divdf3+0x552>
    838c:	0ee88d63          	beq	a7,a4,8486 <__divdf3+0x54e>
    8390:	847e                	mv	s0,t6
    8392:	bd45                	j	8242 <__divdf3+0x30a>
    8394:	df1b61e3          	bltu	s6,a7,8176 <__divdf3+0x23e>
    8398:	001b5713          	srl	a4,s6,0x1
    839c:	01fa9313          	sll	t1,s5,0x1f
    83a0:	001ad793          	srl	a5,s5,0x1
    83a4:	00e36333          	or	t1,t1,a4
    83a8:	0b7e                	sll	s6,s6,0x1f
    83aa:	bbd1                	j	817e <__divdf3+0x246>
    83ac:	855e                	mv	a0,s7
    83ae:	256010ef          	jal	9604 <__clzsi2>
    83b2:	01550693          	add	a3,a0,21 # 10015 <__neorv32_rom_size+0x15>
    83b6:	4771                	li	a4,28
    83b8:	02050793          	add	a5,a0,32
    83bc:	c6d752e3          	bge	a4,a3,8020 <__divdf3+0xe8>
    83c0:	1561                	add	a0,a0,-8
    83c2:	4881                	li	a7,0
    83c4:	00ab9433          	sll	s0,s7,a0
    83c8:	b1bd                	j	8036 <__divdf3+0xfe>
    83ca:	23a010ef          	jal	9604 <__clzsi2>
    83ce:	01550693          	add	a3,a0,21
    83d2:	47f1                	li	a5,28
    83d4:	02050713          	add	a4,a0,32
    83d8:	ccd7d6e3          	bge	a5,a3,80a4 <__divdf3+0x16c>
    83dc:	ff850793          	add	a5,a0,-8
    83e0:	00f41ab3          	sll	s5,s0,a5
    83e4:	4b01                	li	s6,0
    83e6:	b9d9                	j	80bc <__divdf3+0x184>
    83e8:	f2a796e3          	bne	a5,a0,8314 <__divdf3+0x3dc>
    83ec:	d00707e3          	beqz	a4,80fa <__divdf3+0x1c2>
    83f0:	b739                	j	82fe <__divdf3+0x3c6>
    83f2:	f8e61fe3          	bne	a2,a4,8390 <__divdf3+0x458>
    83f6:	f80f09e3          	beqz	t5,8388 <__divdf3+0x450>
    83fa:	847e                	mv	s0,t6
    83fc:	b599                	j	8242 <__divdf3+0x30a>
    83fe:	dff773e3          	bgeu	a4,t6,81e4 <__divdf3+0x2ac>
    8402:	18f9                	add	a7,a7,-2
    8404:	9732                	add	a4,a4,a2
    8406:	b3c5                	j	81e6 <__divdf3+0x2ae>
    8408:	db17f9e3          	bgeu	a5,a7,81ba <__divdf3+0x282>
    840c:	1479                	add	s0,s0,-2
    840e:	97b2                	add	a5,a5,a2
    8410:	b375                	j	81bc <__divdf3+0x284>
    8412:	467d                	li	a2,31
    8414:	f0e656e3          	bge	a2,a4,8320 <__divdf3+0x3e8>
    8418:	5605                	li	a2,-31
    841a:	40f607b3          	sub	a5,a2,a5
    841e:	02000613          	li	a2,32
    8422:	00f457b3          	srl	a5,s0,a5
    8426:	00c70863          	beq	a4,a2,8436 <__divdf3+0x4fe>
    842a:	43e98993          	add	s3,s3,1086
    842e:	013419b3          	sll	s3,s0,s3
    8432:	0138e8b3          	or	a7,a7,s3
    8436:	011038b3          	snez	a7,a7
    843a:	00f8e8b3          	or	a7,a7,a5
    843e:	0078f713          	and	a4,a7,7
    8442:	4601                	li	a2,0
    8444:	c31d                	beqz	a4,846a <__divdf3+0x532>
    8446:	00f8f793          	and	a5,a7,15
    844a:	4711                	li	a4,4
    844c:	4401                	li	s0,0
    844e:	00e78963          	beq	a5,a4,8460 <__divdf3+0x528>
    8452:	00488793          	add	a5,a7,4
    8456:	0117b8b3          	sltu	a7,a5,a7
    845a:	01103433          	snez	s0,a7
    845e:	88be                	mv	a7,a5
    8460:	00941613          	sll	a2,s0,0x9
    8464:	01d41713          	sll	a4,s0,0x1d
    8468:	8231                	srl	a2,a2,0xc
    846a:	0038d893          	srl	a7,a7,0x3
    846e:	00e8e733          	or	a4,a7,a4
    8472:	4781                	li	a5,0
    8474:	bef1                	j	8050 <__divdf3+0x118>
    8476:	889a                	mv	a7,t1
    8478:	e8a81ee3          	bne	a6,a0,8314 <__divdf3+0x3dc>
    847c:	c6b70fe3          	beq	a4,a1,80fa <__divdf3+0x1c2>
    8480:	0018e893          	or	a7,a7,1
    8484:	b99d                	j	80fa <__divdf3+0x1c2>
    8486:	f0fef5e3          	bgeu	t4,a5,8390 <__divdf3+0x458>
    848a:	9eae                	add	t4,t4,a1
    848c:	00bebf33          	sltu	t5,t4,a1
    8490:	9f32                	add	t5,t5,a2
    8492:	1479                	add	s0,s0,-2
    8494:	8b76                	mv	s6,t4
    8496:	977a                	add	a4,a4,t5
    8498:	b36d                	j	8242 <__divdf3+0x30a>
    849a:	c0200713          	li	a4,-1022
    849e:	3ff98793          	add	a5,s3,1023
    84a2:	58fd                	li	a7,-1
    84a4:	e6e9cbe3          	blt	s3,a4,831a <__divdf3+0x3e2>
    84a8:	00488713          	add	a4,a7,4
    84ac:	011738b3          	sltu	a7,a4,a7
    84b0:	9446                	add	s0,s0,a7
    84b2:	88ba                	mv	a7,a4
    84b4:	b999                	j	810a <__divdf3+0x1d2>
    84b6:	00f8f713          	and	a4,a7,15
    84ba:	4611                	li	a2,4
    84bc:	c4c707e3          	beq	a4,a2,810a <__divdf3+0x1d2>
    84c0:	b7e5                	j	84a8 <__divdf3+0x570>
    84c2:	8eba                	mv	t4,a4
    84c4:	b3f5                	j	82b0 <__divdf3+0x378>
    84c6:	88f6                	mv	a7,t4
    84c8:	bb6d                	j	8282 <__divdf3+0x34a>
    84ca:	86ca                	mv	a3,s2
    84cc:	7ff00793          	li	a5,2047
    84d0:	4601                	li	a2,0
    84d2:	4701                	li	a4,0
    84d4:	beb5                	j	8050 <__divdf3+0x118>
    84d6:	00159313          	sll	t1,a1,0x1
    84da:	00b33833          	sltu	a6,t1,a1
    84de:	9832                	add	a6,a6,a2
    84e0:	983e                	add	a6,a6,a5
    84e2:	18f9                	add	a7,a7,-2
    84e4:	859a                	mv	a1,t1
    84e6:	f8a80be3          	beq	a6,a0,847c <__divdf3+0x544>
    84ea:	b52d                	j	8314 <__divdf3+0x3dc>
    84ec:	fee5e5e3          	bltu	a1,a4,84d6 <__divdf3+0x59e>
    84f0:	889a                	mv	a7,t1
    84f2:	f8b717e3          	bne	a4,a1,8480 <__divdf3+0x548>
    84f6:	b111                	j	80fa <__divdf3+0x1c2>

000084f8 <__eqdf2>:
    84f8:	0145d713          	srl	a4,a1,0x14
    84fc:	001007b7          	lui	a5,0x100
    8500:	17fd                	add	a5,a5,-1 # fffff <__neorv32_rom_size+0xeffff>
    8502:	0146d813          	srl	a6,a3,0x14
    8506:	7ff77713          	and	a4,a4,2047
    850a:	7ff00313          	li	t1,2047
    850e:	00b7fe33          	and	t3,a5,a1
    8512:	88aa                	mv	a7,a0
    8514:	8ff5                	and	a5,a5,a3
    8516:	81fd                	srl	a1,a1,0x1f
    8518:	7ff87813          	and	a6,a6,2047
    851c:	82fd                	srl	a3,a3,0x1f
    851e:	4505                	li	a0,1
    8520:	00670a63          	beq	a4,t1,8534 <__eqdf2+0x3c>
    8524:	00680763          	beq	a6,t1,8532 <__eqdf2+0x3a>
    8528:	01071463          	bne	a4,a6,8530 <__eqdf2+0x38>
    852c:	02fe0063          	beq	t3,a5,854c <__eqdf2+0x54>
    8530:	8082                	ret
    8532:	8082                	ret
    8534:	fee81ee3          	bne	a6,a4,8530 <__eqdf2+0x38>
    8538:	00fe67b3          	or	a5,t3,a5
    853c:	8fd1                	or	a5,a5,a2
    853e:	0117e7b3          	or	a5,a5,a7
    8542:	f7fd                	bnez	a5,8530 <__eqdf2+0x38>
    8544:	8d95                	sub	a1,a1,a3
    8546:	00b03533          	snez	a0,a1
    854a:	8082                	ret
    854c:	fec892e3          	bne	a7,a2,8530 <__eqdf2+0x38>
    8550:	00d58863          	beq	a1,a3,8560 <__eqdf2+0x68>
    8554:	ff71                	bnez	a4,8530 <__eqdf2+0x38>
    8556:	011e6e33          	or	t3,t3,a7
    855a:	01c03533          	snez	a0,t3
    855e:	8082                	ret
    8560:	4501                	li	a0,0
    8562:	8082                	ret

00008564 <__gedf2>:
    8564:	0145d893          	srl	a7,a1,0x14
    8568:	001007b7          	lui	a5,0x100
    856c:	17fd                	add	a5,a5,-1 # fffff <__neorv32_rom_size+0xeffff>
    856e:	0146d713          	srl	a4,a3,0x14
    8572:	7ff8f893          	and	a7,a7,2047
    8576:	7ff00e13          	li	t3,2047
    857a:	00b7f333          	and	t1,a5,a1
    857e:	882a                	mv	a6,a0
    8580:	8eaa                	mv	t4,a0
    8582:	8ff5                	and	a5,a5,a3
    8584:	81fd                	srl	a1,a1,0x1f
    8586:	8f32                	mv	t5,a2
    8588:	7ff77513          	and	a0,a4,2047
    858c:	82fd                	srl	a3,a3,0x1f
    858e:	03c88d63          	beq	a7,t3,85c8 <__gedf2+0x64>
    8592:	01c50e63          	beq	a0,t3,85ae <__gedf2+0x4a>
    8596:	04089a63          	bnez	a7,85ea <__gedf2+0x86>
    859a:	01036833          	or	a6,t1,a6
    859e:	e129                	bnez	a0,85e0 <__gedf2+0x7c>
    85a0:	8e5d                	or	a2,a2,a5
    85a2:	ca25                	beqz	a2,8612 <__gedf2+0xae>
    85a4:	06081c63          	bnez	a6,861c <__gedf2+0xb8>
    85a8:	4505                	li	a0,1
    85aa:	c2b5                	beqz	a3,860e <__gedf2+0xaa>
    85ac:	8082                	ret
    85ae:	8e5d                	or	a2,a2,a5
    85b0:	e625                	bnez	a2,8618 <__gedf2+0xb4>
    85b2:	00089663          	bnez	a7,85be <__gedf2+0x5a>
    85b6:	01036333          	or	t1,t1,a6
    85ba:	fe0307e3          	beqz	t1,85a8 <__gedf2+0x44>
    85be:	04d58663          	beq	a1,a3,860a <__gedf2+0xa6>
    85c2:	e5b1                	bnez	a1,860e <__gedf2+0xaa>
    85c4:	4505                	li	a0,1
    85c6:	8082                	ret
    85c8:	01036333          	or	t1,t1,a6
    85cc:	04031663          	bnez	t1,8618 <__gedf2+0xb4>
    85d0:	ff1519e3          	bne	a0,a7,85c2 <__gedf2+0x5e>
    85d4:	8fd1                	or	a5,a5,a2
    85d6:	e3a9                	bnez	a5,8618 <__gedf2+0xb4>
    85d8:	fed595e3          	bne	a1,a3,85c2 <__gedf2+0x5e>
    85dc:	4501                	li	a0,0
    85de:	8082                	ret
    85e0:	fc0804e3          	beqz	a6,85a8 <__gedf2+0x44>
    85e4:	fcd59fe3          	bne	a1,a3,85c2 <__gedf2+0x5e>
    85e8:	a00d                	j	860a <__gedf2+0xa6>
    85ea:	dd61                	beqz	a0,85c2 <__gedf2+0x5e>
    85ec:	fcd59be3          	bne	a1,a3,85c2 <__gedf2+0x5e>
    85f0:	fd1549e3          	blt	a0,a7,85c2 <__gedf2+0x5e>
    85f4:	00a8cb63          	blt	a7,a0,860a <__gedf2+0xa6>
    85f8:	fc67e5e3          	bltu	a5,t1,85c2 <__gedf2+0x5e>
    85fc:	00f31763          	bne	t1,a5,860a <__gedf2+0xa6>
    8600:	fddf61e3          	bltu	t5,t4,85c2 <__gedf2+0x5e>
    8604:	4501                	li	a0,0
    8606:	fbeef3e3          	bgeu	t4,t5,85ac <__gedf2+0x48>
    860a:	4505                	li	a0,1
    860c:	f1c5                	bnez	a1,85ac <__gedf2+0x48>
    860e:	557d                	li	a0,-1
    8610:	8082                	ret
    8612:	fa0818e3          	bnez	a6,85c2 <__gedf2+0x5e>
    8616:	8082                	ret
    8618:	5579                	li	a0,-2
    861a:	8082                	ret
    861c:	fcd58ee3          	beq	a1,a3,85f8 <__gedf2+0x94>
    8620:	b74d                	j	85c2 <__gedf2+0x5e>

00008622 <__ledf2>:
    8622:	0145d893          	srl	a7,a1,0x14
    8626:	001007b7          	lui	a5,0x100
    862a:	17fd                	add	a5,a5,-1 # fffff <__neorv32_rom_size+0xeffff>
    862c:	0146d713          	srl	a4,a3,0x14
    8630:	7ff8f893          	and	a7,a7,2047
    8634:	7ff00313          	li	t1,2047
    8638:	00b7fe33          	and	t3,a5,a1
    863c:	882a                	mv	a6,a0
    863e:	8eaa                	mv	t4,a0
    8640:	8ff5                	and	a5,a5,a3
    8642:	81fd                	srl	a1,a1,0x1f
    8644:	8f32                	mv	t5,a2
    8646:	7ff77513          	and	a0,a4,2047
    864a:	82fd                	srl	a3,a3,0x1f
    864c:	02688e63          	beq	a7,t1,8688 <__ledf2+0x66>
    8650:	00650e63          	beq	a0,t1,866c <__ledf2+0x4a>
    8654:	04089763          	bnez	a7,86a2 <__ledf2+0x80>
    8658:	010e6833          	or	a6,t3,a6
    865c:	e53d                	bnez	a0,86ca <__ledf2+0xa8>
    865e:	8e5d                	or	a2,a2,a5
    8660:	ce25                	beqz	a2,86d8 <__ledf2+0xb6>
    8662:	06081e63          	bnez	a6,86de <__ledf2+0xbc>
    8666:	4505                	li	a0,1
    8668:	ceb9                	beqz	a3,86c6 <__ledf2+0xa4>
    866a:	8082                	ret
    866c:	8e5d                	or	a2,a2,a5
    866e:	4509                	li	a0,2
    8670:	fe6d                	bnez	a2,866a <__ledf2+0x48>
    8672:	00089663          	bnez	a7,867e <__ledf2+0x5c>
    8676:	010e6e33          	or	t3,t3,a6
    867a:	fe0e06e3          	beqz	t3,8666 <__ledf2+0x44>
    867e:	04d58263          	beq	a1,a3,86c2 <__ledf2+0xa0>
    8682:	e1b1                	bnez	a1,86c6 <__ledf2+0xa4>
    8684:	4505                	li	a0,1
    8686:	8082                	ret
    8688:	010e6e33          	or	t3,t3,a6
    868c:	040e1463          	bnez	t3,86d4 <__ledf2+0xb2>
    8690:	ff1519e3          	bne	a0,a7,8682 <__ledf2+0x60>
    8694:	8fd1                	or	a5,a5,a2
    8696:	4509                	li	a0,2
    8698:	fbe9                	bnez	a5,866a <__ledf2+0x48>
    869a:	fed594e3          	bne	a1,a3,8682 <__ledf2+0x60>
    869e:	4501                	li	a0,0
    86a0:	8082                	ret
    86a2:	d165                	beqz	a0,8682 <__ledf2+0x60>
    86a4:	fcd59fe3          	bne	a1,a3,8682 <__ledf2+0x60>
    86a8:	fd154de3          	blt	a0,a7,8682 <__ledf2+0x60>
    86ac:	00a8cb63          	blt	a7,a0,86c2 <__ledf2+0xa0>
    86b0:	fdc7e9e3          	bltu	a5,t3,8682 <__ledf2+0x60>
    86b4:	00fe1763          	bne	t3,a5,86c2 <__ledf2+0xa0>
    86b8:	fddf65e3          	bltu	t5,t4,8682 <__ledf2+0x60>
    86bc:	4501                	li	a0,0
    86be:	fbeef6e3          	bgeu	t4,t5,866a <__ledf2+0x48>
    86c2:	4505                	li	a0,1
    86c4:	f1dd                	bnez	a1,866a <__ledf2+0x48>
    86c6:	557d                	li	a0,-1
    86c8:	8082                	ret
    86ca:	f8080ee3          	beqz	a6,8666 <__ledf2+0x44>
    86ce:	fad59ae3          	bne	a1,a3,8682 <__ledf2+0x60>
    86d2:	bfc5                	j	86c2 <__ledf2+0xa0>
    86d4:	4509                	li	a0,2
    86d6:	8082                	ret
    86d8:	fa0815e3          	bnez	a6,8682 <__ledf2+0x60>
    86dc:	8082                	ret
    86de:	fcd589e3          	beq	a1,a3,86b0 <__ledf2+0x8e>
    86e2:	b745                	j	8682 <__ledf2+0x60>

000086e4 <__muldf3>:
    86e4:	7179                	add	sp,sp,-48
    86e6:	0145d793          	srl	a5,a1,0x14
    86ea:	d422                	sw	s0,40(sp)
    86ec:	d226                	sw	s1,36(sp)
    86ee:	d04a                	sw	s2,32(sp)
    86f0:	ce4e                	sw	s3,28(sp)
    86f2:	ca56                	sw	s5,20(sp)
    86f4:	00c59493          	sll	s1,a1,0xc
    86f8:	d606                	sw	ra,44(sp)
    86fa:	cc52                	sw	s4,24(sp)
    86fc:	c85a                	sw	s6,16(sp)
    86fe:	c65e                	sw	s7,12(sp)
    8700:	c462                	sw	s8,8(sp)
    8702:	7ff7f793          	and	a5,a5,2047
    8706:	842a                	mv	s0,a0
    8708:	8ab2                	mv	s5,a2
    870a:	89b6                	mv	s3,a3
    870c:	80b1                	srl	s1,s1,0xc
    870e:	01f5d913          	srl	s2,a1,0x1f
    8712:	32078f63          	beqz	a5,8a50 <__muldf3+0x36c>
    8716:	7ff00713          	li	a4,2047
    871a:	08e78663          	beq	a5,a4,87a6 <__muldf3+0xc2>
    871e:	00349693          	sll	a3,s1,0x3
    8722:	01d55713          	srl	a4,a0,0x1d
    8726:	8f55                	or	a4,a4,a3
    8728:	008006b7          	lui	a3,0x800
    872c:	00d764b3          	or	s1,a4,a3
    8730:	00351a13          	sll	s4,a0,0x3
    8734:	c0178c13          	add	s8,a5,-1023
    8738:	4b01                	li	s6,0
    873a:	4b81                	li	s7,0
    873c:	0149d793          	srl	a5,s3,0x14
    8740:	00c99713          	sll	a4,s3,0xc
    8744:	7ff7f793          	and	a5,a5,2047
    8748:	8f56                	mv	t5,s5
    874a:	00c75413          	srl	s0,a4,0xc
    874e:	01f9d993          	srl	s3,s3,0x1f
    8752:	cfbd                	beqz	a5,87d0 <__muldf3+0xec>
    8754:	7ff00713          	li	a4,2047
    8758:	0ee78f63          	beq	a5,a4,8856 <__muldf3+0x172>
    875c:	00341713          	sll	a4,s0,0x3
    8760:	01dad593          	srl	a1,s5,0x1d
    8764:	8dd9                	or	a1,a1,a4
    8766:	c0178793          	add	a5,a5,-1023
    876a:	00800737          	lui	a4,0x800
    876e:	00e5e433          	or	s0,a1,a4
    8772:	003a9f13          	sll	t5,s5,0x3
    8776:	018788b3          	add	a7,a5,s8
    877a:	4301                	li	t1,0
    877c:	4729                	li	a4,10
    877e:	00188513          	add	a0,a7,1
    8782:	09674963          	blt	a4,s6,8814 <__muldf3+0x130>
    8786:	013945b3          	xor	a1,s2,s3
    878a:	4789                	li	a5,2
    878c:	882e                	mv	a6,a1
    878e:	0f67c863          	blt	a5,s6,887e <__muldf3+0x19a>
    8792:	1b7d                	add	s6,s6,-1
    8794:	4705                	li	a4,1
    8796:	11676263          	bltu	a4,s6,889a <__muldf3+0x1b6>
    879a:	2ef30963          	beq	t1,a5,8a8c <__muldf3+0x3a8>
    879e:	84a2                	mv	s1,s0
    87a0:	8a7a                	mv	s4,t5
    87a2:	8b9a                	mv	s7,t1
    87a4:	a8bd                	j	8822 <__muldf3+0x13e>
    87a6:	00a4ea33          	or	s4,s1,a0
    87aa:	2e0a1763          	bnez	s4,8a98 <__muldf3+0x3b4>
    87ae:	0149d793          	srl	a5,s3,0x14
    87b2:	00c99713          	sll	a4,s3,0xc
    87b6:	7ff7f793          	and	a5,a5,2047
    87ba:	4481                	li	s1,0
    87bc:	4b21                	li	s6,8
    87be:	7ff00c13          	li	s8,2047
    87c2:	4b89                	li	s7,2
    87c4:	8f56                	mv	t5,s5
    87c6:	00c75413          	srl	s0,a4,0xc
    87ca:	01f9d993          	srl	s3,s3,0x1f
    87ce:	f3d9                	bnez	a5,8754 <__muldf3+0x70>
    87d0:	015467b3          	or	a5,s0,s5
    87d4:	2c078d63          	beqz	a5,8aae <__muldf3+0x3ca>
    87d8:	36040a63          	beqz	s0,8b4c <__muldf3+0x468>
    87dc:	8522                	mv	a0,s0
    87de:	627000ef          	jal	9604 <__clzsi2>
    87e2:	88aa                	mv	a7,a0
    87e4:	ff550713          	add	a4,a0,-11
    87e8:	47f5                	li	a5,29
    87ea:	ff888f13          	add	t5,a7,-8
    87ee:	8f99                	sub	a5,a5,a4
    87f0:	00fad7b3          	srl	a5,s5,a5
    87f4:	01e41733          	sll	a4,s0,t5
    87f8:	00e7e433          	or	s0,a5,a4
    87fc:	01ea9f33          	sll	t5,s5,t5
    8800:	411c08b3          	sub	a7,s8,a7
    8804:	c0d88893          	add	a7,a7,-1011
    8808:	4729                	li	a4,10
    880a:	4301                	li	t1,0
    880c:	00188513          	add	a0,a7,1
    8810:	f7675be3          	bge	a4,s6,8786 <__muldf3+0xa2>
    8814:	85ca                	mv	a1,s2
    8816:	4789                	li	a5,2
    8818:	26fb8a63          	beq	s7,a5,8a8c <__muldf3+0x3a8>
    881c:	478d                	li	a5,3
    881e:	36fb8363          	beq	s7,a5,8b84 <__muldf3+0x4a0>
    8822:	4785                	li	a5,1
    8824:	882e                	mv	a6,a1
    8826:	34fb9863          	bne	s7,a5,8b76 <__muldf3+0x492>
    882a:	4781                	li	a5,0
    882c:	4681                	li	a3,0
    882e:	4701                	li	a4,0
    8830:	50b2                	lw	ra,44(sp)
    8832:	5422                	lw	s0,40(sp)
    8834:	07d2                	sll	a5,a5,0x14
    8836:	8fd5                	or	a5,a5,a3
    8838:	01f81693          	sll	a3,a6,0x1f
    883c:	8fd5                	or	a5,a5,a3
    883e:	5492                	lw	s1,36(sp)
    8840:	5902                	lw	s2,32(sp)
    8842:	49f2                	lw	s3,28(sp)
    8844:	4a62                	lw	s4,24(sp)
    8846:	4ad2                	lw	s5,20(sp)
    8848:	4b42                	lw	s6,16(sp)
    884a:	4bb2                	lw	s7,12(sp)
    884c:	4c22                	lw	s8,8(sp)
    884e:	853a                	mv	a0,a4
    8850:	85be                	mv	a1,a5
    8852:	6145                	add	sp,sp,48
    8854:	8082                	ret
    8856:	01546733          	or	a4,s0,s5
    885a:	7ffc0893          	add	a7,s8,2047
    885e:	24070f63          	beqz	a4,8abc <__muldf3+0x3d8>
    8862:	6705                	lui	a4,0x1
    8864:	01394833          	xor	a6,s2,s3
    8868:	80070713          	add	a4,a4,-2048 # 800 <core_list_init+0x1c4>
    886c:	003b6b13          	or	s6,s6,3
    8870:	46a9                	li	a3,10
    8872:	85c2                	mv	a1,a6
    8874:	00ec0533          	add	a0,s8,a4
    8878:	2b66c463          	blt	a3,s6,8b20 <__muldf3+0x43c>
    887c:	430d                	li	t1,3
    887e:	4605                	li	a2,1
    8880:	01661633          	sll	a2,a2,s6
    8884:	53067713          	and	a4,a2,1328
    8888:	f759                	bnez	a4,8816 <__muldf3+0x132>
    888a:	24067793          	and	a5,a2,576
    888e:	2c079e63          	bnez	a5,8b6a <__muldf3+0x486>
    8892:	08867613          	and	a2,a2,136
    8896:	22061963          	bnez	a2,8ac8 <__muldf3+0x3e4>
    889a:	6fc1                	lui	t6,0x10
    889c:	ffff8e93          	add	t4,t6,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    88a0:	01da77b3          	and	a5,s4,t4
    88a4:	010a5693          	srl	a3,s4,0x10
    88a8:	01df7eb3          	and	t4,t5,t4
    88ac:	010f5e13          	srl	t3,t5,0x10
    88b0:	03d78733          	mul	a4,a5,t4
    88b4:	03d68333          	mul	t1,a3,t4
    88b8:	01075593          	srl	a1,a4,0x10
    88bc:	02fe0633          	mul	a2,t3,a5
    88c0:	961a                	add	a2,a2,t1
    88c2:	95b2                	add	a1,a1,a2
    88c4:	03c68f33          	mul	t5,a3,t3
    88c8:	0065f363          	bgeu	a1,t1,88ce <__muldf3+0x1ea>
    88cc:	9f7e                	add	t5,t5,t6
    88ce:	63c1                	lui	t2,0x10
    88d0:	fff38613          	add	a2,t2,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    88d4:	00c5f333          	and	t1,a1,a2
    88d8:	01045f93          	srl	t6,s0,0x10
    88dc:	8f71                	and	a4,a4,a2
    88de:	8c71                	and	s0,s0,a2
    88e0:	0342                	sll	t1,t1,0x10
    88e2:	028782b3          	mul	t0,a5,s0
    88e6:	933a                	add	t1,t1,a4
    88e8:	81c1                	srl	a1,a1,0x10
    88ea:	02868733          	mul	a4,a3,s0
    88ee:	0102d613          	srl	a2,t0,0x10
    88f2:	02ff87b3          	mul	a5,t6,a5
    88f6:	97ba                	add	a5,a5,a4
    88f8:	963e                	add	a2,a2,a5
    88fa:	03f687b3          	mul	a5,a3,t6
    88fe:	00e67363          	bgeu	a2,a4,8904 <__muldf3+0x220>
    8902:	979e                	add	a5,a5,t2
    8904:	6941                	lui	s2,0x10
    8906:	fff90993          	add	s3,s2,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    890a:	01367733          	and	a4,a2,s3
    890e:	0104d393          	srl	t2,s1,0x10
    8912:	0134f6b3          	and	a3,s1,s3
    8916:	0132f2b3          	and	t0,t0,s3
    891a:	0742                	sll	a4,a4,0x10
    891c:	02de84b3          	mul	s1,t4,a3
    8920:	9716                	add	a4,a4,t0
    8922:	8241                	srl	a2,a2,0x10
    8924:	963e                	add	a2,a2,a5
    8926:	95ba                	add	a1,a1,a4
    8928:	02de02b3          	mul	t0,t3,a3
    892c:	0104d793          	srl	a5,s1,0x10
    8930:	03d38eb3          	mul	t4,t2,t4
    8934:	92f6                	add	t0,t0,t4
    8936:	9796                	add	a5,a5,t0
    8938:	027e0e33          	mul	t3,t3,t2
    893c:	01d7f363          	bgeu	a5,t4,8942 <__muldf3+0x25e>
    8940:	9e4a                	add	t3,t3,s2
    8942:	69c1                	lui	s3,0x10
    8944:	fff98e93          	add	t4,s3,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    8948:	01d7f2b3          	and	t0,a5,t4
    894c:	83c1                	srl	a5,a5,0x10
    894e:	97f2                	add	a5,a5,t3
    8950:	01d4feb3          	and	t4,s1,t4
    8954:	02c2                	sll	t0,t0,0x10
    8956:	02d40933          	mul	s2,s0,a3
    895a:	92f6                	add	t0,t0,t4
    895c:	02838433          	mul	s0,t2,s0
    8960:	01095e13          	srl	t3,s2,0x10
    8964:	02df86b3          	mul	a3,t6,a3
    8968:	96a2                	add	a3,a3,s0
    896a:	9e36                	add	t3,t3,a3
    896c:	027f8eb3          	mul	t4,t6,t2
    8970:	008e7363          	bgeu	t3,s0,8976 <__muldf3+0x292>
    8974:	9ece                	add	t4,t4,s3
    8976:	6fc1                	lui	t6,0x10
    8978:	1ffd                	add	t6,t6,-1 # ffff <__crt0_copy_data_src_begin+0x59c7>
    897a:	01fe76b3          	and	a3,t3,t6
    897e:	06c2                	sll	a3,a3,0x10
    8980:	01f97933          	and	s2,s2,t6
    8984:	95fa                	add	a1,a1,t5
    8986:	96ca                	add	a3,a3,s2
    8988:	9636                	add	a2,a2,a3
    898a:	00e5b733          	sltu	a4,a1,a4
    898e:	9732                	add	a4,a4,a2
    8990:	00558f33          	add	t5,a1,t0
    8994:	97ba                	add	a5,a5,a4
    8996:	00bf35b3          	sltu	a1,t5,a1
    899a:	95be                	add	a1,a1,a5
    899c:	00d636b3          	sltu	a3,a2,a3
    89a0:	00c73633          	sltu	a2,a4,a2
    89a4:	8ed1                	or	a3,a3,a2
    89a6:	00e7b733          	sltu	a4,a5,a4
    89aa:	010e5e13          	srl	t3,t3,0x10
    89ae:	00f5b7b3          	sltu	a5,a1,a5
    89b2:	96f2                	add	a3,a3,t3
    89b4:	8f5d                	or	a4,a4,a5
    89b6:	009f1793          	sll	a5,t5,0x9
    89ba:	9736                	add	a4,a4,a3
    89bc:	0067e7b3          	or	a5,a5,t1
    89c0:	9776                	add	a4,a4,t4
    89c2:	00f037b3          	snez	a5,a5
    89c6:	017f5613          	srl	a2,t5,0x17
    89ca:	0726                	sll	a4,a4,0x9
    89cc:	0175d693          	srl	a3,a1,0x17
    89d0:	8fd1                	or	a5,a5,a2
    89d2:	05a6                	sll	a1,a1,0x9
    89d4:	00b7ea33          	or	s4,a5,a1
    89d8:	00771793          	sll	a5,a4,0x7
    89dc:	00d764b3          	or	s1,a4,a3
    89e0:	0007dd63          	bgez	a5,89fa <__muldf3+0x316>
    89e4:	001a5713          	srl	a4,s4,0x1
    89e8:	001a7793          	and	a5,s4,1
    89ec:	01f49693          	sll	a3,s1,0x1f
    89f0:	8fd9                	or	a5,a5,a4
    89f2:	00d7ea33          	or	s4,a5,a3
    89f6:	8085                	srl	s1,s1,0x1
    89f8:	88aa                	mv	a7,a0
    89fa:	3ff88613          	add	a2,a7,1023
    89fe:	0cc05a63          	blez	a2,8ad2 <__muldf3+0x3ee>
    8a02:	007a7793          	and	a5,s4,7
    8a06:	cf81                	beqz	a5,8a1e <__muldf3+0x33a>
    8a08:	00fa7793          	and	a5,s4,15
    8a0c:	4711                	li	a4,4
    8a0e:	00e78863          	beq	a5,a4,8a1e <__muldf3+0x33a>
    8a12:	004a0713          	add	a4,s4,4
    8a16:	014737b3          	sltu	a5,a4,s4
    8a1a:	94be                	add	s1,s1,a5
    8a1c:	8a3a                	mv	s4,a4
    8a1e:	00749793          	sll	a5,s1,0x7
    8a22:	0007d863          	bgez	a5,8a32 <__muldf3+0x34e>
    8a26:	ff0007b7          	lui	a5,0xff000
    8a2a:	17fd                	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7effc000>
    8a2c:	8cfd                	and	s1,s1,a5
    8a2e:	40088613          	add	a2,a7,1024
    8a32:	7fe00793          	li	a5,2046
    8a36:	14c7c263          	blt	a5,a2,8b7a <__muldf3+0x496>
    8a3a:	003a5793          	srl	a5,s4,0x3
    8a3e:	01d49713          	sll	a4,s1,0x1d
    8a42:	00949693          	sll	a3,s1,0x9
    8a46:	8f5d                	or	a4,a4,a5
    8a48:	82b1                	srl	a3,a3,0xc
    8a4a:	7ff67793          	and	a5,a2,2047
    8a4e:	b3cd                	j	8830 <__muldf3+0x14c>
    8a50:	00a4ea33          	or	s4,s1,a0
    8a54:	040a0863          	beqz	s4,8aa4 <__muldf3+0x3c0>
    8a58:	cce1                	beqz	s1,8b30 <__muldf3+0x44c>
    8a5a:	8526                	mv	a0,s1
    8a5c:	3a9000ef          	jal	9604 <__clzsi2>
    8a60:	862a                	mv	a2,a0
    8a62:	ff550693          	add	a3,a0,-11
    8a66:	4775                	li	a4,29
    8a68:	ff860793          	add	a5,a2,-8 # 7fff8 <__neorv32_rom_size+0x6fff8>
    8a6c:	8f15                	sub	a4,a4,a3
    8a6e:	00e45733          	srl	a4,s0,a4
    8a72:	00f496b3          	sll	a3,s1,a5
    8a76:	00d764b3          	or	s1,a4,a3
    8a7a:	00f41a33          	sll	s4,s0,a5
    8a7e:	c0d00793          	li	a5,-1011
    8a82:	40c78c33          	sub	s8,a5,a2
    8a86:	4b01                	li	s6,0
    8a88:	4b81                	li	s7,0
    8a8a:	b94d                	j	873c <__muldf3+0x58>
    8a8c:	882e                	mv	a6,a1
    8a8e:	7ff00793          	li	a5,2047
    8a92:	4681                	li	a3,0
    8a94:	4701                	li	a4,0
    8a96:	bb69                	j	8830 <__muldf3+0x14c>
    8a98:	8a2a                	mv	s4,a0
    8a9a:	4b31                	li	s6,12
    8a9c:	7ff00c13          	li	s8,2047
    8aa0:	4b8d                	li	s7,3
    8aa2:	b969                	j	873c <__muldf3+0x58>
    8aa4:	4481                	li	s1,0
    8aa6:	4b11                	li	s6,4
    8aa8:	4c01                	li	s8,0
    8aaa:	4b85                	li	s7,1
    8aac:	b941                	j	873c <__muldf3+0x58>
    8aae:	001b6b13          	or	s6,s6,1
    8ab2:	88e2                	mv	a7,s8
    8ab4:	4401                	li	s0,0
    8ab6:	4f01                	li	t5,0
    8ab8:	4305                	li	t1,1
    8aba:	b1c9                	j	877c <__muldf3+0x98>
    8abc:	002b6b13          	or	s6,s6,2
    8ac0:	4401                	li	s0,0
    8ac2:	4f01                	li	t5,0
    8ac4:	4309                	li	t1,2
    8ac6:	b95d                	j	877c <__muldf3+0x98>
    8ac8:	84a2                	mv	s1,s0
    8aca:	8a7a                	mv	s4,t5
    8acc:	8b9a                	mv	s7,t1
    8ace:	85ce                	mv	a1,s3
    8ad0:	b399                	j	8816 <__muldf3+0x132>
    8ad2:	4705                	li	a4,1
    8ad4:	ee5d                	bnez	a2,8b92 <__muldf3+0x4ae>
    8ad6:	41e88893          	add	a7,a7,1054
    8ada:	011a1633          	sll	a2,s4,a7
    8ade:	00c03633          	snez	a2,a2
    8ae2:	011498b3          	sll	a7,s1,a7
    8ae6:	00ea57b3          	srl	a5,s4,a4
    8aea:	01166633          	or	a2,a2,a7
    8aee:	8e5d                	or	a2,a2,a5
    8af0:	00767793          	and	a5,a2,7
    8af4:	00e4d5b3          	srl	a1,s1,a4
    8af8:	cf81                	beqz	a5,8b10 <__muldf3+0x42c>
    8afa:	00f67793          	and	a5,a2,15
    8afe:	4711                	li	a4,4
    8b00:	00e78863          	beq	a5,a4,8b10 <__muldf3+0x42c>
    8b04:	00460793          	add	a5,a2,4
    8b08:	00c7b633          	sltu	a2,a5,a2
    8b0c:	95b2                	add	a1,a1,a2
    8b0e:	863e                	mv	a2,a5
    8b10:	00859513          	sll	a0,a1,0x8
    8b14:	4785                	li	a5,1
    8b16:	4681                	li	a3,0
    8b18:	4701                	li	a4,0
    8b1a:	d0054be3          	bltz	a0,8830 <__muldf3+0x14c>
    8b1e:	a0e1                	j	8be6 <__muldf3+0x502>
    8b20:	473d                	li	a4,15
    8b22:	0ceb1b63          	bne	s6,a4,8bf8 <__muldf3+0x514>
    8b26:	4801                	li	a6,0
    8b28:	000806b7          	lui	a3,0x80
    8b2c:	4701                	li	a4,0
    8b2e:	b309                	j	8830 <__muldf3+0x14c>
    8b30:	2d5000ef          	jal	9604 <__clzsi2>
    8b34:	01550693          	add	a3,a0,21
    8b38:	47f1                	li	a5,28
    8b3a:	02050613          	add	a2,a0,32
    8b3e:	f2d7d4e3          	bge	a5,a3,8a66 <__muldf3+0x382>
    8b42:	1561                	add	a0,a0,-8
    8b44:	4a01                	li	s4,0
    8b46:	00a414b3          	sll	s1,s0,a0
    8b4a:	bf15                	j	8a7e <__muldf3+0x39a>
    8b4c:	8556                	mv	a0,s5
    8b4e:	2b7000ef          	jal	9604 <__clzsi2>
    8b52:	01550713          	add	a4,a0,21
    8b56:	47f1                	li	a5,28
    8b58:	02050893          	add	a7,a0,32
    8b5c:	c8e7d6e3          	bge	a5,a4,87e8 <__muldf3+0x104>
    8b60:	1561                	add	a0,a0,-8
    8b62:	4f01                	li	t5,0
    8b64:	00aa9433          	sll	s0,s5,a0
    8b68:	b961                	j	8800 <__muldf3+0x11c>
    8b6a:	4801                	li	a6,0
    8b6c:	7ff00793          	li	a5,2047
    8b70:	000806b7          	lui	a3,0x80
    8b74:	b975                	j	8830 <__muldf3+0x14c>
    8b76:	88aa                	mv	a7,a0
    8b78:	b549                	j	89fa <__muldf3+0x316>
    8b7a:	7ff00793          	li	a5,2047
    8b7e:	4681                	li	a3,0
    8b80:	4701                	li	a4,0
    8b82:	b17d                	j	8830 <__muldf3+0x14c>
    8b84:	4801                	li	a6,0
    8b86:	7ff00793          	li	a5,2047
    8b8a:	000806b7          	lui	a3,0x80
    8b8e:	4701                	li	a4,0
    8b90:	b145                	j	8830 <__muldf3+0x14c>
    8b92:	8f11                	sub	a4,a4,a2
    8b94:	03800793          	li	a5,56
    8b98:	c8e7c9e3          	blt	a5,a4,882a <__muldf3+0x146>
    8b9c:	47fd                	li	a5,31
    8b9e:	f2e7dce3          	bge	a5,a4,8ad6 <__muldf3+0x3f2>
    8ba2:	5785                	li	a5,-31
    8ba4:	8f91                	sub	a5,a5,a2
    8ba6:	02000693          	li	a3,32
    8baa:	00f4d7b3          	srl	a5,s1,a5
    8bae:	00d70863          	beq	a4,a3,8bbe <__muldf3+0x4da>
    8bb2:	43e88893          	add	a7,a7,1086
    8bb6:	011498b3          	sll	a7,s1,a7
    8bba:	011a6a33          	or	s4,s4,a7
    8bbe:	01403633          	snez	a2,s4
    8bc2:	8e5d                	or	a2,a2,a5
    8bc4:	00767713          	and	a4,a2,7
    8bc8:	4681                	li	a3,0
    8bca:	c31d                	beqz	a4,8bf0 <__muldf3+0x50c>
    8bcc:	00f67793          	and	a5,a2,15
    8bd0:	4711                	li	a4,4
    8bd2:	4581                	li	a1,0
    8bd4:	00e78963          	beq	a5,a4,8be6 <__muldf3+0x502>
    8bd8:	00460793          	add	a5,a2,4
    8bdc:	00c7b633          	sltu	a2,a5,a2
    8be0:	00c035b3          	snez	a1,a2
    8be4:	863e                	mv	a2,a5
    8be6:	00959693          	sll	a3,a1,0x9
    8bea:	01d59713          	sll	a4,a1,0x1d
    8bee:	82b1                	srl	a3,a3,0xc
    8bf0:	820d                	srl	a2,a2,0x3
    8bf2:	8f51                	or	a4,a4,a2
    8bf4:	4781                	li	a5,0
    8bf6:	b92d                	j	8830 <__muldf3+0x14c>
    8bf8:	84a2                	mv	s1,s0
    8bfa:	8a56                	mv	s4,s5
    8bfc:	4b8d                	li	s7,3
    8bfe:	85ce                	mv	a1,s3
    8c00:	b919                	j	8816 <__muldf3+0x132>

00008c02 <__subdf3>:
    8c02:	001007b7          	lui	a5,0x100
    8c06:	17fd                	add	a5,a5,-1 # fffff <__neorv32_rom_size+0xeffff>
    8c08:	1101                	add	sp,sp,-32
    8c0a:	00b7f8b3          	and	a7,a5,a1
    8c0e:	00d7f833          	and	a6,a5,a3
    8c12:	0146d793          	srl	a5,a3,0x14
    8c16:	088e                	sll	a7,a7,0x3
    8c18:	cc22                	sw	s0,24(sp)
    8c1a:	c64e                	sw	s3,12(sp)
    8c1c:	01f5d413          	srl	s0,a1,0x1f
    8c20:	0145d993          	srl	s3,a1,0x14
    8c24:	01d55713          	srl	a4,a0,0x1d
    8c28:	080e                	sll	a6,a6,0x3
    8c2a:	01d65593          	srl	a1,a2,0x1d
    8c2e:	ce06                	sw	ra,28(sp)
    8c30:	ca26                	sw	s1,20(sp)
    8c32:	c84a                	sw	s2,16(sp)
    8c34:	7ff7ff13          	and	t5,a5,2047
    8c38:	7ff00313          	li	t1,2047
    8c3c:	01176733          	or	a4,a4,a7
    8c40:	7ff9f993          	and	s3,s3,2047
    8c44:	8e22                	mv	t3,s0
    8c46:	00351893          	sll	a7,a0,0x3
    8c4a:	82fd                	srl	a3,a3,0x1f
    8c4c:	0105e5b3          	or	a1,a1,a6
    8c50:	00361e93          	sll	t4,a2,0x3
    8c54:	1c6f0163          	beq	t5,t1,8e16 <__subdf3+0x214>
    8c58:	0016c693          	xor	a3,a3,1
    8c5c:	41e987b3          	sub	a5,s3,t5
    8c60:	12d40263          	beq	s0,a3,8d84 <__subdf3+0x182>
    8c64:	68f05863          	blez	a5,92f4 <__subdf3+0x6f2>
    8c68:	1e0f0763          	beqz	t5,8e56 <__subdf3+0x254>
    8c6c:	32698463          	beq	s3,t1,8f94 <__subdf3+0x392>
    8c70:	03800693          	li	a3,56
    8c74:	4505                	li	a0,1
    8c76:	02f6c863          	blt	a3,a5,8ca6 <__subdf3+0xa4>
    8c7a:	008006b7          	lui	a3,0x800
    8c7e:	8dd5                	or	a1,a1,a3
    8c80:	46fd                	li	a3,31
    8c82:	40f6ca63          	blt	a3,a5,9096 <__subdf3+0x494>
    8c86:	02000693          	li	a3,32
    8c8a:	8e9d                	sub	a3,a3,a5
    8c8c:	00d59533          	sll	a0,a1,a3
    8c90:	00fed633          	srl	a2,t4,a5
    8c94:	00de96b3          	sll	a3,t4,a3
    8c98:	8d51                	or	a0,a0,a2
    8c9a:	00d036b3          	snez	a3,a3
    8c9e:	00f5d7b3          	srl	a5,a1,a5
    8ca2:	8d55                	or	a0,a0,a3
    8ca4:	8f1d                	sub	a4,a4,a5
    8ca6:	40a88533          	sub	a0,a7,a0
    8caa:	00a8b633          	sltu	a2,a7,a0
    8cae:	84aa                	mv	s1,a0
    8cb0:	40c70933          	sub	s2,a4,a2
    8cb4:	00891793          	sll	a5,s2,0x8
    8cb8:	2c07d363          	bgez	a5,8f7e <__subdf3+0x37c>
    8cbc:	008007b7          	lui	a5,0x800
    8cc0:	17fd                	add	a5,a5,-1 # 7fffff <__neorv32_rom_size+0x7effff>
    8cc2:	00f97933          	and	s2,s2,a5
    8cc6:	26090863          	beqz	s2,8f36 <__subdf3+0x334>
    8cca:	854a                	mv	a0,s2
    8ccc:	139000ef          	jal	9604 <__clzsi2>
    8cd0:	ff850793          	add	a5,a0,-8
    8cd4:	02000693          	li	a3,32
    8cd8:	40f68733          	sub	a4,a3,a5
    8cdc:	00e4d733          	srl	a4,s1,a4
    8ce0:	00f91933          	sll	s2,s2,a5
    8ce4:	01276733          	or	a4,a4,s2
    8ce8:	00f494b3          	sll	s1,s1,a5
    8cec:	3337cc63          	blt	a5,s3,9024 <__subdf3+0x422>
    8cf0:	413787b3          	sub	a5,a5,s3
    8cf4:	0785                	add	a5,a5,1
    8cf6:	8e9d                	sub	a3,a3,a5
    8cf8:	00d49633          	sll	a2,s1,a3
    8cfc:	00f4d933          	srl	s2,s1,a5
    8d00:	00c03633          	snez	a2,a2
    8d04:	00c96633          	or	a2,s2,a2
    8d08:	00d716b3          	sll	a3,a4,a3
    8d0c:	00c6e4b3          	or	s1,a3,a2
    8d10:	00f75933          	srl	s2,a4,a5
    8d14:	4981                	li	s3,0
    8d16:	0074f793          	and	a5,s1,7
    8d1a:	cf81                	beqz	a5,8d32 <__subdf3+0x130>
    8d1c:	00f4f793          	and	a5,s1,15
    8d20:	4711                	li	a4,4
    8d22:	00e78863          	beq	a5,a4,8d32 <__subdf3+0x130>
    8d26:	00448793          	add	a5,s1,4
    8d2a:	0097b533          	sltu	a0,a5,s1
    8d2e:	992a                	add	s2,s2,a0
    8d30:	84be                	mv	s1,a5
    8d32:	00891793          	sll	a5,s2,0x8
    8d36:	5607dd63          	bgez	a5,92b0 <__subdf3+0x6ae>
    8d3a:	00198793          	add	a5,s3,1
    8d3e:	7ff00713          	li	a4,2047
    8d42:	1ee78363          	beq	a5,a4,8f28 <__subdf3+0x326>
    8d46:	ff800737          	lui	a4,0xff800
    8d4a:	177d                	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    8d4c:	00e97733          	and	a4,s2,a4
    8d50:	7ff7f793          	and	a5,a5,2047
    8d54:	01d71813          	sll	a6,a4,0x1d
    8d58:	0034d513          	srl	a0,s1,0x3
    8d5c:	0726                	sll	a4,a4,0x9
    8d5e:	00a86833          	or	a6,a6,a0
    8d62:	8331                	srl	a4,a4,0xc
    8d64:	00147e13          	and	t3,s0,1
    8d68:	40f2                	lw	ra,28(sp)
    8d6a:	4462                	lw	s0,24(sp)
    8d6c:	07d2                	sll	a5,a5,0x14
    8d6e:	8fd9                	or	a5,a5,a4
    8d70:	01fe1713          	sll	a4,t3,0x1f
    8d74:	8fd9                	or	a5,a5,a4
    8d76:	44d2                	lw	s1,20(sp)
    8d78:	4942                	lw	s2,16(sp)
    8d7a:	49b2                	lw	s3,12(sp)
    8d7c:	8542                	mv	a0,a6
    8d7e:	85be                	mv	a1,a5
    8d80:	6105                	add	sp,sp,32
    8d82:	8082                	ret
    8d84:	5af05463          	blez	a5,932c <__subdf3+0x72a>
    8d88:	180f1563          	bnez	t5,8f12 <__subdf3+0x310>
    8d8c:	01d5e6b3          	or	a3,a1,t4
    8d90:	20068a63          	beqz	a3,8fa4 <__subdf3+0x3a2>
    8d94:	fff78693          	add	a3,a5,-1
    8d98:	3a068163          	beqz	a3,913a <__subdf3+0x538>
    8d9c:	1e678c63          	beq	a5,t1,8f94 <__subdf3+0x392>
    8da0:	03800793          	li	a5,56
    8da4:	4905                	li	s2,1
    8da6:	02d7c863          	blt	a5,a3,8dd6 <__subdf3+0x1d4>
    8daa:	87b6                	mv	a5,a3
    8dac:	46fd                	li	a3,31
    8dae:	3af6ce63          	blt	a3,a5,916a <__subdf3+0x568>
    8db2:	02000693          	li	a3,32
    8db6:	8e9d                	sub	a3,a3,a5
    8db8:	00d59933          	sll	s2,a1,a3
    8dbc:	00fed633          	srl	a2,t4,a5
    8dc0:	00de96b3          	sll	a3,t4,a3
    8dc4:	00c96933          	or	s2,s2,a2
    8dc8:	00d036b3          	snez	a3,a3
    8dcc:	00f5d7b3          	srl	a5,a1,a5
    8dd0:	00d96933          	or	s2,s2,a3
    8dd4:	973e                	add	a4,a4,a5
    8dd6:	01190633          	add	a2,s2,a7
    8dda:	01263933          	sltu	s2,a2,s2
    8dde:	84b2                	mv	s1,a2
    8de0:	993a                	add	s2,s2,a4
    8de2:	00891793          	sll	a5,s2,0x8
    8de6:	1807dc63          	bgez	a5,8f7e <__subdf3+0x37c>
    8dea:	0985                	add	s3,s3,1
    8dec:	7ff00793          	li	a5,2047
    8df0:	12f98c63          	beq	s3,a5,8f28 <__subdf3+0x326>
    8df4:	ff8007b7          	lui	a5,0xff800
    8df8:	17fd                	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    8dfa:	0014f513          	and	a0,s1,1
    8dfe:	00f977b3          	and	a5,s2,a5
    8e02:	0014d713          	srl	a4,s1,0x1
    8e06:	8f49                	or	a4,a4,a0
    8e08:	01f79513          	sll	a0,a5,0x1f
    8e0c:	00e564b3          	or	s1,a0,a4
    8e10:	0017d913          	srl	s2,a5,0x1
    8e14:	b709                	j	8d16 <__subdf3+0x114>
    8e16:	01d5e833          	or	a6,a1,t4
    8e1a:	80198313          	add	t1,s3,-2047
    8e1e:	04080d63          	beqz	a6,8e78 <__subdf3+0x276>
    8e22:	04d40f63          	beq	s0,a3,8e80 <__subdf3+0x27e>
    8e26:	0c030163          	beqz	t1,8ee8 <__subdf3+0x2e6>
    8e2a:	20098563          	beqz	s3,9034 <__subdf3+0x432>
    8e2e:	00361513          	sll	a0,a2,0x3
    8e32:	810d                	srl	a0,a0,0x3
    8e34:	8436                	mv	s0,a3
    8e36:	872e                	mv	a4,a1
    8e38:	01d71813          	sll	a6,a4,0x1d
    8e3c:	00a86833          	or	a6,a6,a0
    8e40:	830d                	srl	a4,a4,0x3
    8e42:	01076733          	or	a4,a4,a6
    8e46:	c36d                	beqz	a4,8f28 <__subdf3+0x326>
    8e48:	4e01                	li	t3,0
    8e4a:	7ff00793          	li	a5,2047
    8e4e:	00080737          	lui	a4,0x80
    8e52:	4801                	li	a6,0
    8e54:	bf11                	j	8d68 <__subdf3+0x166>
    8e56:	01d5e6b3          	or	a3,a1,t4
    8e5a:	14068563          	beqz	a3,8fa4 <__subdf3+0x3a2>
    8e5e:	fff78693          	add	a3,a5,-1
    8e62:	2e068963          	beqz	a3,9154 <__subdf3+0x552>
    8e66:	12678763          	beq	a5,t1,8f94 <__subdf3+0x392>
    8e6a:	03800793          	li	a5,56
    8e6e:	4505                	li	a0,1
    8e70:	e2d7cbe3          	blt	a5,a3,8ca6 <__subdf3+0xa4>
    8e74:	87b6                	mv	a5,a3
    8e76:	b529                	j	8c80 <__subdf3+0x7e>
    8e78:	0016c693          	xor	a3,a3,1
    8e7c:	fad415e3          	bne	s0,a3,8e26 <__subdf3+0x224>
    8e80:	14030463          	beqz	t1,8fc8 <__subdf3+0x3c6>
    8e84:	24099463          	bnez	s3,90cc <__subdf3+0x4ca>
    8e88:	7ff00793          	li	a5,2047
    8e8c:	011766b3          	or	a3,a4,a7
    8e90:	3a068763          	beqz	a3,923e <__subdf3+0x63c>
    8e94:	fff78693          	add	a3,a5,-1
    8e98:	2a068163          	beqz	a3,913a <__subdf3+0x538>
    8e9c:	7ff00513          	li	a0,2047
    8ea0:	22a78663          	beq	a5,a0,90cc <__subdf3+0x4ca>
    8ea4:	03800793          	li	a5,56
    8ea8:	4905                	li	s2,1
    8eaa:	02d7c763          	blt	a5,a3,8ed8 <__subdf3+0x2d6>
    8eae:	47fd                	li	a5,31
    8eb0:	3cd7cb63          	blt	a5,a3,9286 <__subdf3+0x684>
    8eb4:	02000793          	li	a5,32
    8eb8:	8f95                	sub	a5,a5,a3
    8eba:	00f71933          	sll	s2,a4,a5
    8ebe:	00d8d633          	srl	a2,a7,a3
    8ec2:	00f897b3          	sll	a5,a7,a5
    8ec6:	00c96933          	or	s2,s2,a2
    8eca:	00f037b3          	snez	a5,a5
    8ece:	00d756b3          	srl	a3,a4,a3
    8ed2:	00f96933          	or	s2,s2,a5
    8ed6:	95b6                	add	a1,a1,a3
    8ed8:	01d90733          	add	a4,s2,t4
    8edc:	01273933          	sltu	s2,a4,s2
    8ee0:	84ba                	mv	s1,a4
    8ee2:	992e                	add	s2,s2,a1
    8ee4:	89fa                	mv	s3,t5
    8ee6:	bdf5                	j	8de2 <__subdf3+0x1e0>
    8ee8:	00198793          	add	a5,s3,1
    8eec:	7fe7f793          	and	a5,a5,2046
    8ef0:	10079563          	bnez	a5,8ffa <__subdf3+0x3f8>
    8ef4:	01d5e833          	or	a6,a1,t4
    8ef8:	011767b3          	or	a5,a4,a7
    8efc:	22099263          	bnez	s3,9120 <__subdf3+0x51e>
    8f00:	2e078163          	beqz	a5,91e2 <__subdf3+0x5e0>
    8f04:	2e081e63          	bnez	a6,9200 <__subdf3+0x5fe>
    8f08:	050e                	sll	a0,a0,0x3
    8f0a:	00355913          	srl	s2,a0,0x3
    8f0e:	4781                	li	a5,0
    8f10:	a8f9                	j	8fee <__subdf3+0x3ec>
    8f12:	08698163          	beq	s3,t1,8f94 <__subdf3+0x392>
    8f16:	03800693          	li	a3,56
    8f1a:	4905                	li	s2,1
    8f1c:	eaf6cde3          	blt	a3,a5,8dd6 <__subdf3+0x1d4>
    8f20:	008006b7          	lui	a3,0x800
    8f24:	8dd5                	or	a1,a1,a3
    8f26:	b559                	j	8dac <__subdf3+0x1aa>
    8f28:	00147e13          	and	t3,s0,1
    8f2c:	7ff00793          	li	a5,2047
    8f30:	4701                	li	a4,0
    8f32:	4801                	li	a6,0
    8f34:	bd15                	j	8d68 <__subdf3+0x166>
    8f36:	8526                	mv	a0,s1
    8f38:	25f1                	jal	9604 <__clzsi2>
    8f3a:	01850793          	add	a5,a0,24
    8f3e:	46fd                	li	a3,31
    8f40:	d8f6dae3          	bge	a3,a5,8cd4 <__subdf3+0xd2>
    8f44:	ff850713          	add	a4,a0,-8
    8f48:	00e49733          	sll	a4,s1,a4
    8f4c:	1737c963          	blt	a5,s3,90be <__subdf3+0x4bc>
    8f50:	413789b3          	sub	s3,a5,s3
    8f54:	00198793          	add	a5,s3,1
    8f58:	36f6d163          	bge	a3,a5,92ba <__subdf3+0x6b8>
    8f5c:	1985                	add	s3,s3,-31
    8f5e:	02000693          	li	a3,32
    8f62:	013754b3          	srl	s1,a4,s3
    8f66:	00d78b63          	beq	a5,a3,8f7c <__subdf3+0x37a>
    8f6a:	04000693          	li	a3,64
    8f6e:	40f687b3          	sub	a5,a3,a5
    8f72:	00f71733          	sll	a4,a4,a5
    8f76:	00e03733          	snez	a4,a4
    8f7a:	8cd9                	or	s1,s1,a4
    8f7c:	4981                	li	s3,0
    8f7e:	0074f793          	and	a5,s1,7
    8f82:	d8079de3          	bnez	a5,8d1c <__subdf3+0x11a>
    8f86:	87ce                	mv	a5,s3
    8f88:	0034d513          	srl	a0,s1,0x3
    8f8c:	874a                	mv	a4,s2
    8f8e:	a829                	j	8fa8 <__subdf3+0x3a6>
    8f90:	ea081ce3          	bnez	a6,8e48 <__subdf3+0x246>
    8f94:	050e                	sll	a0,a0,0x3
    8f96:	01d71813          	sll	a6,a4,0x1d
    8f9a:	810d                	srl	a0,a0,0x3
    8f9c:	00a86833          	or	a6,a6,a0
    8fa0:	830d                	srl	a4,a4,0x3
    8fa2:	b545                	j	8e42 <__subdf3+0x240>
    8fa4:	050e                	sll	a0,a0,0x3
    8fa6:	810d                	srl	a0,a0,0x3
    8fa8:	01d71813          	sll	a6,a4,0x1d
    8fac:	7ff00693          	li	a3,2047
    8fb0:	00a86833          	or	a6,a6,a0
    8fb4:	830d                	srl	a4,a4,0x3
    8fb6:	e8d786e3          	beq	a5,a3,8e42 <__subdf3+0x240>
    8fba:	0732                	sll	a4,a4,0xc
    8fbc:	8331                	srl	a4,a4,0xc
    8fbe:	7ff7f793          	and	a5,a5,2047
    8fc2:	00147e13          	and	t3,s0,1
    8fc6:	b34d                	j	8d68 <__subdf3+0x166>
    8fc8:	00198693          	add	a3,s3,1
    8fcc:	7fe6f793          	and	a5,a3,2046
    8fd0:	10079363          	bnez	a5,90d6 <__subdf3+0x4d4>
    8fd4:	011767b3          	or	a5,a4,a7
    8fd8:	1e099263          	bnez	s3,91bc <__subdf3+0x5ba>
    8fdc:	26078663          	beqz	a5,9248 <__subdf3+0x646>
    8fe0:	01d5e7b3          	or	a5,a1,t4
    8fe4:	26079763          	bnez	a5,9252 <__subdf3+0x650>
    8fe8:	050e                	sll	a0,a0,0x3
    8fea:	00355913          	srl	s2,a0,0x3
    8fee:	01d71813          	sll	a6,a4,0x1d
    8ff2:	01286833          	or	a6,a6,s2
    8ff6:	830d                	srl	a4,a4,0x3
    8ff8:	b7c9                	j	8fba <__subdf3+0x3b8>
    8ffa:	41d88833          	sub	a6,a7,t4
    8ffe:	0108b7b3          	sltu	a5,a7,a6
    9002:	40b70933          	sub	s2,a4,a1
    9006:	40f90933          	sub	s2,s2,a5
    900a:	00891793          	sll	a5,s2,0x8
    900e:	84c2                	mv	s1,a6
    9010:	0e07c763          	bltz	a5,90fe <__subdf3+0x4fc>
    9014:	01286833          	or	a6,a6,s2
    9018:	ca0817e3          	bnez	a6,8cc6 <__subdf3+0xc4>
    901c:	4e01                	li	t3,0
    901e:	4781                	li	a5,0
    9020:	4701                	li	a4,0
    9022:	b399                	j	8d68 <__subdf3+0x166>
    9024:	ff800937          	lui	s2,0xff800
    9028:	197d                	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    902a:	40f989b3          	sub	s3,s3,a5
    902e:	01277933          	and	s2,a4,s2
    9032:	b1d5                	j	8d16 <__subdf3+0x114>
    9034:	7ff00793          	li	a5,2047
    9038:	01176533          	or	a0,a4,a7
    903c:	cd61                	beqz	a0,9114 <__subdf3+0x512>
    903e:	fff78813          	add	a6,a5,-1
    9042:	18080363          	beqz	a6,91c8 <__subdf3+0x5c6>
    9046:	7ff00513          	li	a0,2047
    904a:	dea782e3          	beq	a5,a0,8e2e <__subdf3+0x22c>
    904e:	03800793          	li	a5,56
    9052:	8436                	mv	s0,a3
    9054:	4505                	li	a0,1
    9056:	0307c763          	blt	a5,a6,9084 <__subdf3+0x482>
    905a:	47fd                	li	a5,31
    905c:	1307cc63          	blt	a5,a6,9194 <__subdf3+0x592>
    9060:	02000793          	li	a5,32
    9064:	410787b3          	sub	a5,a5,a6
    9068:	00f71533          	sll	a0,a4,a5
    906c:	0108d6b3          	srl	a3,a7,a6
    9070:	00f897b3          	sll	a5,a7,a5
    9074:	8d55                	or	a0,a0,a3
    9076:	00f037b3          	snez	a5,a5
    907a:	01075833          	srl	a6,a4,a6
    907e:	8d5d                	or	a0,a0,a5
    9080:	410585b3          	sub	a1,a1,a6
    9084:	40ae8533          	sub	a0,t4,a0
    9088:	00aeb733          	sltu	a4,t4,a0
    908c:	84aa                	mv	s1,a0
    908e:	40e58933          	sub	s2,a1,a4
    9092:	89fa                	mv	s3,t5
    9094:	b105                	j	8cb4 <__subdf3+0xb2>
    9096:	fe078693          	add	a3,a5,-32
    909a:	02000613          	li	a2,32
    909e:	00d5d6b3          	srl	a3,a1,a3
    90a2:	00c78a63          	beq	a5,a2,90b6 <__subdf3+0x4b4>
    90a6:	04000613          	li	a2,64
    90aa:	40f607b3          	sub	a5,a2,a5
    90ae:	00f597b3          	sll	a5,a1,a5
    90b2:	00feeeb3          	or	t4,t4,a5
    90b6:	01d03533          	snez	a0,t4
    90ba:	8d55                	or	a0,a0,a3
    90bc:	b6ed                	j	8ca6 <__subdf3+0xa4>
    90be:	ff8006b7          	lui	a3,0xff800
    90c2:	16fd                	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    90c4:	40f987b3          	sub	a5,s3,a5
    90c8:	8f75                	and	a4,a4,a3
    90ca:	b715                	j	8fee <__subdf3+0x3ec>
    90cc:	00361513          	sll	a0,a2,0x3
    90d0:	810d                	srl	a0,a0,0x3
    90d2:	872e                	mv	a4,a1
    90d4:	b395                	j	8e38 <__subdf3+0x236>
    90d6:	7ff00793          	li	a5,2047
    90da:	e4f687e3          	beq	a3,a5,8f28 <__subdf3+0x326>
    90de:	9ec6                	add	t4,t4,a7
    90e0:	011eb633          	sltu	a2,t4,a7
    90e4:	00b707b3          	add	a5,a4,a1
    90e8:	97b2                	add	a5,a5,a2
    90ea:	01f79513          	sll	a0,a5,0x1f
    90ee:	001ede93          	srl	t4,t4,0x1
    90f2:	01d564b3          	or	s1,a0,t4
    90f6:	0017d913          	srl	s2,a5,0x1
    90fa:	89b6                	mv	s3,a3
    90fc:	b929                	j	8d16 <__subdf3+0x114>
    90fe:	411e8633          	sub	a2,t4,a7
    9102:	40e587b3          	sub	a5,a1,a4
    9106:	00ceb733          	sltu	a4,t4,a2
    910a:	84b2                	mv	s1,a2
    910c:	40e78933          	sub	s2,a5,a4
    9110:	8436                	mv	s0,a3
    9112:	be55                	j	8cc6 <__subdf3+0xc4>
    9114:	060e                	sll	a2,a2,0x3
    9116:	00365513          	srl	a0,a2,0x3
    911a:	8436                	mv	s0,a3
    911c:	872e                	mv	a4,a1
    911e:	b569                	j	8fa8 <__subdf3+0x3a6>
    9120:	e60798e3          	bnez	a5,8f90 <__subdf3+0x38e>
    9124:	1a080963          	beqz	a6,92d6 <__subdf3+0x6d4>
    9128:	0035d713          	srl	a4,a1,0x3
    912c:	060e                	sll	a2,a2,0x3
    912e:	05f6                	sll	a1,a1,0x1d
    9130:	8f4d                	or	a4,a4,a1
    9132:	820d                	srl	a2,a2,0x3
    9134:	8f51                	or	a4,a4,a2
    9136:	8436                	mv	s0,a3
    9138:	b339                	j	8e46 <__subdf3+0x244>
    913a:	9ec6                	add	t4,t4,a7
    913c:	95ba                	add	a1,a1,a4
    913e:	011eb633          	sltu	a2,t4,a7
    9142:	00c58933          	add	s2,a1,a2
    9146:	00891793          	sll	a5,s2,0x8
    914a:	84f6                	mv	s1,t4
    914c:	0807d963          	bgez	a5,91de <__subdf3+0x5dc>
    9150:	4989                	li	s3,2
    9152:	b14d                	j	8df4 <__subdf3+0x1f2>
    9154:	41d88eb3          	sub	t4,a7,t4
    9158:	40b705b3          	sub	a1,a4,a1
    915c:	01d8b633          	sltu	a2,a7,t4
    9160:	84f6                	mv	s1,t4
    9162:	40c58933          	sub	s2,a1,a2
    9166:	4985                	li	s3,1
    9168:	b6b1                	j	8cb4 <__subdf3+0xb2>
    916a:	fe078693          	add	a3,a5,-32
    916e:	02000613          	li	a2,32
    9172:	00d5d6b3          	srl	a3,a1,a3
    9176:	00c78a63          	beq	a5,a2,918a <__subdf3+0x588>
    917a:	04000613          	li	a2,64
    917e:	40f607b3          	sub	a5,a2,a5
    9182:	00f597b3          	sll	a5,a1,a5
    9186:	00feeeb3          	or	t4,t4,a5
    918a:	01d03933          	snez	s2,t4
    918e:	00d96933          	or	s2,s2,a3
    9192:	b191                	j	8dd6 <__subdf3+0x1d4>
    9194:	fe080793          	add	a5,a6,-32
    9198:	02000693          	li	a3,32
    919c:	00f757b3          	srl	a5,a4,a5
    91a0:	00d80a63          	beq	a6,a3,91b4 <__subdf3+0x5b2>
    91a4:	04000693          	li	a3,64
    91a8:	410686b3          	sub	a3,a3,a6
    91ac:	00d71733          	sll	a4,a4,a3
    91b0:	00e8e8b3          	or	a7,a7,a4
    91b4:	01103533          	snez	a0,a7
    91b8:	8d5d                	or	a0,a0,a5
    91ba:	b5e9                	j	9084 <__subdf3+0x482>
    91bc:	db81                	beqz	a5,90cc <__subdf3+0x4ca>
    91be:	01d5eeb3          	or	t4,a1,t4
    91c2:	c80e93e3          	bnez	t4,8e48 <__subdf3+0x246>
    91c6:	b3f9                	j	8f94 <__subdf3+0x392>
    91c8:	411e8633          	sub	a2,t4,a7
    91cc:	8d99                	sub	a1,a1,a4
    91ce:	00ceb733          	sltu	a4,t4,a2
    91d2:	84b2                	mv	s1,a2
    91d4:	40e58933          	sub	s2,a1,a4
    91d8:	8436                	mv	s0,a3
    91da:	4985                	li	s3,1
    91dc:	bce1                	j	8cb4 <__subdf3+0xb2>
    91de:	4785                	li	a5,1
    91e0:	b365                	j	8f88 <__subdf3+0x386>
    91e2:	e2080de3          	beqz	a6,901c <__subdf3+0x41a>
    91e6:	060e                	sll	a2,a2,0x3
    91e8:	00365793          	srl	a5,a2,0x3
    91ec:	01d59813          	sll	a6,a1,0x1d
    91f0:	00959713          	sll	a4,a1,0x9
    91f4:	00f86833          	or	a6,a6,a5
    91f8:	8331                	srl	a4,a4,0xc
    91fa:	8e36                	mv	t3,a3
    91fc:	4781                	li	a5,0
    91fe:	b6ad                	j	8d68 <__subdf3+0x166>
    9200:	41d88933          	sub	s2,a7,t4
    9204:	0128b7b3          	sltu	a5,a7,s2
    9208:	40b70633          	sub	a2,a4,a1
    920c:	8e1d                	sub	a2,a2,a5
    920e:	00861793          	sll	a5,a2,0x8
    9212:	0a07d963          	bgez	a5,92c4 <__subdf3+0x6c2>
    9216:	411e8633          	sub	a2,t4,a7
    921a:	40e58733          	sub	a4,a1,a4
    921e:	00cebeb3          	sltu	t4,t4,a2
    9222:	41d70733          	sub	a4,a4,t4
    9226:	00871793          	sll	a5,a4,0x8
    922a:	84b2                	mv	s1,a2
    922c:	0e07d763          	bgez	a5,931a <__subdf3+0x718>
    9230:	ff8007b7          	lui	a5,0xff800
    9234:	17fd                	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    9236:	8f7d                	and	a4,a4,a5
    9238:	8436                	mv	s0,a3
    923a:	4785                	li	a5,1
    923c:	be21                	j	8d54 <__subdf3+0x152>
    923e:	060e                	sll	a2,a2,0x3
    9240:	00365513          	srl	a0,a2,0x3
    9244:	872e                	mv	a4,a1
    9246:	b38d                	j	8fa8 <__subdf3+0x3a6>
    9248:	060e                	sll	a2,a2,0x3
    924a:	00365913          	srl	s2,a2,0x3
    924e:	872e                	mv	a4,a1
    9250:	bb79                	j	8fee <__subdf3+0x3ec>
    9252:	01d886b3          	add	a3,a7,t4
    9256:	00b707b3          	add	a5,a4,a1
    925a:	0116b633          	sltu	a2,a3,a7
    925e:	97b2                	add	a5,a5,a2
    9260:	00879713          	sll	a4,a5,0x8
    9264:	0036d813          	srl	a6,a3,0x3
    9268:	06075d63          	bgez	a4,92e2 <__subdf3+0x6e0>
    926c:	ff800737          	lui	a4,0xff800
    9270:	177d                	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    9272:	8ff9                	and	a5,a5,a4
    9274:	01d79713          	sll	a4,a5,0x1d
    9278:	07a6                	sll	a5,a5,0x9
    927a:	01076833          	or	a6,a4,a6
    927e:	00c7d713          	srl	a4,a5,0xc
    9282:	4785                	li	a5,1
    9284:	b4d5                	j	8d68 <__subdf3+0x166>
    9286:	fe068793          	add	a5,a3,-32
    928a:	02000613          	li	a2,32
    928e:	00f757b3          	srl	a5,a4,a5
    9292:	00c68a63          	beq	a3,a2,92a6 <__subdf3+0x6a4>
    9296:	04000613          	li	a2,64
    929a:	40d606b3          	sub	a3,a2,a3
    929e:	00d71733          	sll	a4,a4,a3
    92a2:	00e8e8b3          	or	a7,a7,a4
    92a6:	01103933          	snez	s2,a7
    92aa:	00f96933          	or	s2,s2,a5
    92ae:	b12d                	j	8ed8 <__subdf3+0x2d6>
    92b0:	0034d513          	srl	a0,s1,0x3
    92b4:	87ce                	mv	a5,s3
    92b6:	874a                	mv	a4,s2
    92b8:	b9c5                	j	8fa8 <__subdf3+0x3a6>
    92ba:	02000693          	li	a3,32
    92be:	8e9d                	sub	a3,a3,a5
    92c0:	4601                	li	a2,0
    92c2:	b489                	j	8d04 <__subdf3+0x102>
    92c4:	00c96833          	or	a6,s2,a2
    92c8:	d4080ae3          	beqz	a6,901c <__subdf3+0x41a>
    92cc:	00395913          	srl	s2,s2,0x3
    92d0:	4781                	li	a5,0
    92d2:	8732                	mv	a4,a2
    92d4:	bb29                	j	8fee <__subdf3+0x3ec>
    92d6:	4e01                	li	t3,0
    92d8:	7ff00793          	li	a5,2047
    92dc:	00080737          	lui	a4,0x80
    92e0:	b461                	j	8d68 <__subdf3+0x166>
    92e2:	01d79713          	sll	a4,a5,0x1d
    92e6:	07a6                	sll	a5,a5,0x9
    92e8:	01076833          	or	a6,a4,a6
    92ec:	00c7d713          	srl	a4,a5,0xc
    92f0:	4781                	li	a5,0
    92f2:	bc9d                	j	8d68 <__subdf3+0x166>
    92f4:	be078ae3          	beqz	a5,8ee8 <__subdf3+0x2e6>
    92f8:	413f0833          	sub	a6,t5,s3
    92fc:	87c2                	mv	a5,a6
    92fe:	d2098de3          	beqz	s3,9038 <__subdf3+0x436>
    9302:	03800793          	li	a5,56
    9306:	0107c763          	blt	a5,a6,9314 <__subdf3+0x712>
    930a:	008007b7          	lui	a5,0x800
    930e:	8f5d                	or	a4,a4,a5
    9310:	8436                	mv	s0,a3
    9312:	b3a1                	j	905a <__subdf3+0x458>
    9314:	8436                	mv	s0,a3
    9316:	4505                	li	a0,1
    9318:	b3b5                	j	9084 <__subdf3+0x482>
    931a:	01d71813          	sll	a6,a4,0x1d
    931e:	820d                	srl	a2,a2,0x3
    9320:	00c86833          	or	a6,a6,a2
    9324:	830d                	srl	a4,a4,0x3
    9326:	4781                	li	a5,0
    9328:	8436                	mv	s0,a3
    932a:	b941                	j	8fba <__subdf3+0x3b8>
    932c:	c8078ee3          	beqz	a5,8fc8 <__subdf3+0x3c6>
    9330:	413f06b3          	sub	a3,t5,s3
    9334:	00099463          	bnez	s3,933c <__subdf3+0x73a>
    9338:	87b6                	mv	a5,a3
    933a:	be89                	j	8e8c <__subdf3+0x28a>
    933c:	03800793          	li	a5,56
    9340:	4905                	li	s2,1
    9342:	b8d7cbe3          	blt	a5,a3,8ed8 <__subdf3+0x2d6>
    9346:	008007b7          	lui	a5,0x800
    934a:	8f5d                	or	a4,a4,a5
    934c:	b68d                	j	8eae <__subdf3+0x2ac>

0000934e <__fixdfsi>:
    934e:	0145d793          	srl	a5,a1,0x14
    9352:	001006b7          	lui	a3,0x100
    9356:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_rom_size+0xeffff>
    935a:	7ff7f793          	and	a5,a5,2047
    935e:	3fe00613          	li	a2,1022
    9362:	8f6d                	and	a4,a4,a1
    9364:	81fd                	srl	a1,a1,0x1f
    9366:	00f65b63          	bge	a2,a5,937c <__fixdfsi+0x2e>
    936a:	41d00613          	li	a2,1053
    936e:	00f65963          	bge	a2,a5,9380 <__fixdfsi+0x32>
    9372:	80000537          	lui	a0,0x80000
    9376:	157d                	add	a0,a0,-1 # 7fffffff <__neorv32_rom_size+0x7ffeffff>
    9378:	952e                	add	a0,a0,a1
    937a:	8082                	ret
    937c:	4501                	li	a0,0
    937e:	8082                	ret
    9380:	43300613          	li	a2,1075
    9384:	8e1d                	sub	a2,a2,a5
    9386:	487d                	li	a6,31
    9388:	8f55                	or	a4,a4,a3
    938a:	00c85d63          	bge	a6,a2,93a4 <__fixdfsi+0x56>
    938e:	41300693          	li	a3,1043
    9392:	40f687b3          	sub	a5,a3,a5
    9396:	00f75733          	srl	a4,a4,a5
    939a:	40e00533          	neg	a0,a4
    939e:	f1e5                	bnez	a1,937e <__fixdfsi+0x30>
    93a0:	853a                	mv	a0,a4
    93a2:	8082                	ret
    93a4:	bed78793          	add	a5,a5,-1043 # 7ffbed <__neorv32_rom_size+0x7efbed>
    93a8:	00f71733          	sll	a4,a4,a5
    93ac:	00c55533          	srl	a0,a0,a2
    93b0:	8f49                	or	a4,a4,a0
    93b2:	b7e5                	j	939a <__fixdfsi+0x4c>

000093b4 <__fixunsdfsi>:
    93b4:	0145d793          	srl	a5,a1,0x14
    93b8:	00100637          	lui	a2,0x100
    93bc:	fff60713          	add	a4,a2,-1 # fffff <__neorv32_rom_size+0xeffff>
    93c0:	7ff7f793          	and	a5,a5,2047
    93c4:	3fe00813          	li	a6,1022
    93c8:	86aa                	mv	a3,a0
    93ca:	8f6d                	and	a4,a4,a1
    93cc:	4501                	li	a0,0
    93ce:	81fd                	srl	a1,a1,0x1f
    93d0:	00f85363          	bge	a6,a5,93d6 <__fixunsdfsi+0x22>
    93d4:	c191                	beqz	a1,93d8 <__fixunsdfsi+0x24>
    93d6:	8082                	ret
    93d8:	41e00593          	li	a1,1054
    93dc:	557d                	li	a0,-1
    93de:	fef5cce3          	blt	a1,a5,93d6 <__fixunsdfsi+0x22>
    93e2:	43300593          	li	a1,1075
    93e6:	8d9d                	sub	a1,a1,a5
    93e8:	457d                	li	a0,31
    93ea:	8f51                	or	a4,a4,a2
    93ec:	00b54a63          	blt	a0,a1,9400 <__fixunsdfsi+0x4c>
    93f0:	bed78793          	add	a5,a5,-1043
    93f4:	00f71733          	sll	a4,a4,a5
    93f8:	00b6d533          	srl	a0,a3,a1
    93fc:	8d59                	or	a0,a0,a4
    93fe:	8082                	ret
    9400:	41300513          	li	a0,1043
    9404:	8d1d                	sub	a0,a0,a5
    9406:	00a75533          	srl	a0,a4,a0
    940a:	8082                	ret

0000940c <__floatunsidf>:
    940c:	1141                	add	sp,sp,-16
    940e:	c422                	sw	s0,8(sp)
    9410:	c606                	sw	ra,12(sp)
    9412:	842a                	mv	s0,a0
    9414:	c91d                	beqz	a0,944a <__floatunsidf+0x3e>
    9416:	22fd                	jal	9604 <__clzsi2>
    9418:	41e00793          	li	a5,1054
    941c:	8f89                	sub	a5,a5,a0
    941e:	4729                	li	a4,10
    9420:	7ff7f793          	and	a5,a5,2047
    9424:	02a74d63          	blt	a4,a0,945e <__floatunsidf+0x52>
    9428:	472d                	li	a4,11
    942a:	8f09                	sub	a4,a4,a0
    942c:	0555                	add	a0,a0,21
    942e:	00e45733          	srl	a4,s0,a4
    9432:	00a41433          	sll	s0,s0,a0
    9436:	40b2                	lw	ra,12(sp)
    9438:	8522                	mv	a0,s0
    943a:	0732                	sll	a4,a4,0xc
    943c:	4422                	lw	s0,8(sp)
    943e:	8331                	srl	a4,a4,0xc
    9440:	07d2                	sll	a5,a5,0x14
    9442:	8fd9                	or	a5,a5,a4
    9444:	85be                	mv	a1,a5
    9446:	0141                	add	sp,sp,16
    9448:	8082                	ret
    944a:	40b2                	lw	ra,12(sp)
    944c:	8522                	mv	a0,s0
    944e:	4781                	li	a5,0
    9450:	4422                	lw	s0,8(sp)
    9452:	4701                	li	a4,0
    9454:	07d2                	sll	a5,a5,0x14
    9456:	8fd9                	or	a5,a5,a4
    9458:	85be                	mv	a1,a5
    945a:	0141                	add	sp,sp,16
    945c:	8082                	ret
    945e:	1555                	add	a0,a0,-11
    9460:	00a41733          	sll	a4,s0,a0
    9464:	4401                	li	s0,0
    9466:	40b2                	lw	ra,12(sp)
    9468:	8522                	mv	a0,s0
    946a:	0732                	sll	a4,a4,0xc
    946c:	4422                	lw	s0,8(sp)
    946e:	8331                	srl	a4,a4,0xc
    9470:	07d2                	sll	a5,a5,0x14
    9472:	8fd9                	or	a5,a5,a4
    9474:	85be                	mv	a1,a5
    9476:	0141                	add	sp,sp,16
    9478:	8082                	ret

0000947a <__floatundidf>:
    947a:	1141                	add	sp,sp,-16
    947c:	c606                	sw	ra,12(sp)
    947e:	c226                	sw	s1,4(sp)
    9480:	00b567b3          	or	a5,a0,a1
    9484:	c3cd                	beqz	a5,9526 <__floatundidf+0xac>
    9486:	c422                	sw	s0,8(sp)
    9488:	c04a                	sw	s2,0(sp)
    948a:	842a                	mv	s0,a0
    948c:	892e                	mv	s2,a1
    948e:	84ae                	mv	s1,a1
    9490:	c5d5                	beqz	a1,953c <__floatundidf+0xc2>
    9492:	852e                	mv	a0,a1
    9494:	2a85                	jal	9604 <__clzsi2>
    9496:	43e00793          	li	a5,1086
    949a:	8f89                	sub	a5,a5,a0
    949c:	43300713          	li	a4,1075
    94a0:	86aa                	mv	a3,a0
    94a2:	0ef75963          	bge	a4,a5,9594 <__floatundidf+0x11a>
    94a6:	43600713          	li	a4,1078
    94aa:	0af74d63          	blt	a4,a5,9564 <__floatundidf+0xea>
    94ae:	4721                	li	a4,8
    94b0:	00e50e63          	beq	a0,a4,94cc <__floatundidf+0x52>
    94b4:	02800713          	li	a4,40
    94b8:	ff850613          	add	a2,a0,-8
    94bc:	8f09                	sub	a4,a4,a0
    94be:	00e45733          	srl	a4,s0,a4
    94c2:	00c914b3          	sll	s1,s2,a2
    94c6:	8cd9                	or	s1,s1,a4
    94c8:	00c41433          	sll	s0,s0,a2
    94cc:	ff800637          	lui	a2,0xff800
    94d0:	167d                	add	a2,a2,-1 # ff7fffff <__crt0_ram_last+0x7f7fc000>
    94d2:	00747593          	and	a1,s0,7
    94d6:	00c4f733          	and	a4,s1,a2
    94da:	c585                	beqz	a1,9502 <__floatundidf+0x88>
    94dc:	00f47593          	and	a1,s0,15
    94e0:	4511                	li	a0,4
    94e2:	02a58063          	beq	a1,a0,9502 <__floatundidf+0x88>
    94e6:	00440593          	add	a1,s0,4
    94ea:	0085b433          	sltu	s0,a1,s0
    94ee:	9722                	add	a4,a4,s0
    94f0:	842e                	mv	s0,a1
    94f2:	00871593          	sll	a1,a4,0x8
    94f6:	0005d663          	bgez	a1,9502 <__floatundidf+0x88>
    94fa:	43f00793          	li	a5,1087
    94fe:	8f71                	and	a4,a4,a2
    9500:	8f95                	sub	a5,a5,a3
    9502:	800d                	srl	s0,s0,0x3
    9504:	01d71493          	sll	s1,a4,0x1d
    9508:	8cc1                	or	s1,s1,s0
    950a:	40b2                	lw	ra,12(sp)
    950c:	4422                	lw	s0,8(sp)
    950e:	0726                	sll	a4,a4,0x9
    9510:	7ff7f793          	and	a5,a5,2047
    9514:	8331                	srl	a4,a4,0xc
    9516:	07d2                	sll	a5,a5,0x14
    9518:	8fd9                	or	a5,a5,a4
    951a:	4902                	lw	s2,0(sp)
    951c:	8526                	mv	a0,s1
    951e:	85be                	mv	a1,a5
    9520:	4492                	lw	s1,4(sp)
    9522:	0141                	add	sp,sp,16
    9524:	8082                	ret
    9526:	4781                	li	a5,0
    9528:	4701                	li	a4,0
    952a:	4481                	li	s1,0
    952c:	40b2                	lw	ra,12(sp)
    952e:	07d2                	sll	a5,a5,0x14
    9530:	8fd9                	or	a5,a5,a4
    9532:	8526                	mv	a0,s1
    9534:	85be                	mv	a1,a5
    9536:	4492                	lw	s1,4(sp)
    9538:	0141                	add	sp,sp,16
    953a:	8082                	ret
    953c:	20e1                	jal	9604 <__clzsi2>
    953e:	02050693          	add	a3,a0,32
    9542:	43e00793          	li	a5,1086
    9546:	02a00713          	li	a4,42
    954a:	8f95                	sub	a5,a5,a3
    954c:	04d75763          	bge	a4,a3,959a <__floatundidf+0x120>
    9550:	1555                	add	a0,a0,-11
    9552:	00a41733          	sll	a4,s0,a0
    9556:	0732                	sll	a4,a4,0xc
    9558:	4422                	lw	s0,8(sp)
    955a:	4902                	lw	s2,0(sp)
    955c:	7ff7f793          	and	a5,a5,2047
    9560:	8331                	srl	a4,a4,0xc
    9562:	b7e9                	j	952c <__floatundidf+0xb2>
    9564:	01850613          	add	a2,a0,24
    9568:	03850713          	add	a4,a0,56
    956c:	06064763          	bltz	a2,95da <__floatundidf+0x160>
    9570:	00c41633          	sll	a2,s0,a2
    9574:	4701                	li	a4,0
    9576:	45a1                	li	a1,8
    9578:	8d95                	sub	a1,a1,a3
    957a:	8f51                	or	a4,a4,a2
    957c:	fe058613          	add	a2,a1,-32
    9580:	00e03733          	snez	a4,a4
    9584:	02064f63          	bltz	a2,95c2 <__floatundidf+0x148>
    9588:	00c95433          	srl	s0,s2,a2
    958c:	4901                	li	s2,0
    958e:	8c59                	or	s0,s0,a4
    9590:	84ca                	mv	s1,s2
    9592:	bf2d                	j	94cc <__floatundidf+0x52>
    9594:	472d                	li	a4,11
    9596:	04e50e63          	beq	a0,a4,95f2 <__floatundidf+0x178>
    959a:	02b00713          	li	a4,43
    959e:	ff568493          	add	s1,a3,-11
    95a2:	8f15                	sub	a4,a4,a3
    95a4:	00991933          	sll	s2,s2,s1
    95a8:	00e45733          	srl	a4,s0,a4
    95ac:	01276733          	or	a4,a4,s2
    95b0:	0732                	sll	a4,a4,0xc
    95b2:	009414b3          	sll	s1,s0,s1
    95b6:	4902                	lw	s2,0(sp)
    95b8:	4422                	lw	s0,8(sp)
    95ba:	8331                	srl	a4,a4,0xc
    95bc:	7ff7f793          	and	a5,a5,2047
    95c0:	b7b5                	j	952c <__floatundidf+0xb2>
    95c2:	457d                	li	a0,31
    95c4:	00191613          	sll	a2,s2,0x1
    95c8:	8d0d                	sub	a0,a0,a1
    95ca:	00a61633          	sll	a2,a2,a0
    95ce:	00b45433          	srl	s0,s0,a1
    95d2:	8c51                	or	s0,s0,a2
    95d4:	00b95933          	srl	s2,s2,a1
    95d8:	bf5d                	j	958e <__floatundidf+0x114>
    95da:	467d                	li	a2,31
    95dc:	8e19                	sub	a2,a2,a4
    95de:	00145593          	srl	a1,s0,0x1
    95e2:	00c5d5b3          	srl	a1,a1,a2
    95e6:	00e91633          	sll	a2,s2,a4
    95ea:	8e4d                	or	a2,a2,a1
    95ec:	00e41733          	sll	a4,s0,a4
    95f0:	b759                	j	9576 <__floatundidf+0xfc>
    95f2:	00c91713          	sll	a4,s2,0xc
    95f6:	84a2                	mv	s1,s0
    95f8:	4902                	lw	s2,0(sp)
    95fa:	4422                	lw	s0,8(sp)
    95fc:	8331                	srl	a4,a4,0xc
    95fe:	43300793          	li	a5,1075
    9602:	b72d                	j	952c <__floatundidf+0xb2>

00009604 <__clzsi2>:
    9604:	67c1                	lui	a5,0x10
    9606:	02f57663          	bgeu	a0,a5,9632 <__clzsi2+0x2e>
    960a:	10053793          	sltiu	a5,a0,256
    960e:	0017b793          	seqz	a5,a5
    9612:	078e                	sll	a5,a5,0x3
    9614:	02000713          	li	a4,32
    9618:	8f1d                	sub	a4,a4,a5
    961a:	00f55533          	srl	a0,a0,a5
    961e:	00001797          	auipc	a5,0x1
    9622:	f1a78793          	add	a5,a5,-230 # a538 <__clz_tab>
    9626:	97aa                	add	a5,a5,a0
    9628:	0007c503          	lbu	a0,0(a5)
    962c:	40a70533          	sub	a0,a4,a0
    9630:	8082                	ret
    9632:	010007b7          	lui	a5,0x1000
    9636:	02f57063          	bgeu	a0,a5,9656 <__clzsi2+0x52>
    963a:	47c1                	li	a5,16
    963c:	00f55533          	srl	a0,a0,a5
    9640:	00001797          	auipc	a5,0x1
    9644:	ef878793          	add	a5,a5,-264 # a538 <__clz_tab>
    9648:	97aa                	add	a5,a5,a0
    964a:	0007c503          	lbu	a0,0(a5)
    964e:	4741                	li	a4,16
    9650:	40a70533          	sub	a0,a4,a0
    9654:	8082                	ret
    9656:	47e1                	li	a5,24
    9658:	00f55533          	srl	a0,a0,a5
    965c:	00001797          	auipc	a5,0x1
    9660:	edc78793          	add	a5,a5,-292 # a538 <__clz_tab>
    9664:	97aa                	add	a5,a5,a0
    9666:	0007c503          	lbu	a0,0(a5)
    966a:	4721                	li	a4,8
    966c:	40a70533          	sub	a0,a4,a0
    9670:	8082                	ret
    9672:	0000                	unimp
