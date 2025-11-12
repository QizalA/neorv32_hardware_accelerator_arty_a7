#include "coremark.h"  // Ensure this is included at the top of the file

/* local functions */

list_head *core_list_find(list_head *list, list_data *info);
list_head *core_list_reverse(list_head *list);
list_head *core_list_remove(list_head *item);
list_head *core_list_undo_remove(list_head *item_removed,
                                 list_head *item_modified);
list_head *core_list_insert_new(list_head * insert_point,
                                list_data * info,
                                list_head **memblock,
                                list_data **datablock,
                                list_head * memblock_end,
                                list_data * datablock_end);
typedef ee_s32 (*list_cmp)(list_data *a, list_data *b, core_results *res);
list_head *core_list_mergesort(list_head *   list,
                               list_cmp      cmp,
                               core_results *res);

// Function definitions for list operations (find, reverse, remove, etc.)

ee_s16
calc_func(ee_s16 *pdata, core_results *res)
{
    ee_s16 data = *pdata;
    ee_s16 retval;
    ee_u8  optype
        = (data >> 7)
          & 1;  /* bit 7 indicates if the function result has been cached */
    if (optype) /* if cached, use cache */
        return (data & 0x007f);
    else
    {                             /* otherwise calculate and cache the result */
        ee_s16 flag = data & 0x7; /* bits 0-2 is type of function to perform */
        ee_s16 dtype
            = ((data >> 3)
               & 0xf);       /* bits 3-6 is specific data for the operation */
        dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
        switch (flag)
        {
            case 0:
                if (dtype < 0x22) /* set min period for bit corruption */
                    dtype = 0x22;
                retval = core_bench_state(res->size,
                                          res->memblock[3],
                                          res->seed1,
                                          res->seed2,
                                          dtype,
                                          res->crc);
                if (res->crcstate == 0)
                    res->crcstate = retval;
                break;
            case 1:
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
                if (res->crcmatrix == 0)
                    res->crcmatrix = retval;
                break;
            default:
                retval = data;
                break;
        }
        res->crc = crcu16(retval, res->crc);
        retval &= 0x007f;
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
        return retval;
    }
}
/* Function: cmp_complex
        Compare the data item in a list cell.

        Can be used by mergesort.
*/
ee_s32
cmp_complex(list_data *a, list_data *b, core_results *res)
{
    ee_s16 val1 = calc_func(&(a->data16), res);
    ee_s16 val2 = calc_func(&(b->data16), res);
    return val1 - val2;
}

/* Function: cmp_idx
        Compare the idx item in a list cell, and regen the data.

        Can be used by mergesort.
*/
ee_s32
cmp_idx(list_data *a, list_data *b, core_results *res)
{
    if (res == NULL)
    {
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
        b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16 >> 8));
    }
    return a->idx - b->idx;
}

void
copy_info(list_data *to, list_data *from)
{
    to->data16 = from->data16;
    to->idx    = from->idx;
}

/* Benchmark for linked list:
        - Try to find multiple data items.
        - List sort
        - Operate on data from list (crc)
        - Single remove/reinsert
        * At the end of this function, the list is back to original state
*/
ee_u16
core_bench_list(core_results *res, ee_s16 finder_idx)
{
    ee_u16     retval = 0;
    ee_u16     found = 0, missed = 0;
    list_head *list     = res->list;
    ee_s16     find_num = res->seed3;
    list_head *this_find;
    list_head *finder, *remover;
    list_data  info;
    ee_s16     i;

    info.idx = finder_idx;
    /* find <find_num> values in the list, and change the list each time
     * (reverse and cache if value found) */
    for (i = 0; i < find_num; i++)
    {
        info.data16 = (i & 0xff);
        this_find   = core_list_find(list, &info);
        list        = core_list_reverse(list);
        if (this_find == NULL)
        {
            missed++;
            retval += (list->next->info->data16 >> 8) & 1;
        }
        else
        {
            found++;
            if (this_find->info->data16 & 0x1) /* use found value */
                retval += (this_find->info->data16 >> 9) & 1;
            /* and cache next item at the head of the list (if any) */
            if (this_find->next != NULL)
            {
                finder          = this_find->next;
                this_find->next = finder->next;
                finder->next    = list->next;
                list->next      = finder;
            }
        }
        if (info.idx >= 0)
            info.idx++;
#if CORE_DEBUG
        ee_printf("List find %d: [%d,%d,%d]\n", i, retval, missed, found);
#endif
    }
    retval += found * 4 - missed;
    /* sort the list by data content and remove one item*/
    if (finder_idx > 0)
        list = core_list_mergesort(list, cmp_complex, res);
    remover = core_list_remove(list->next);
    /* CRC data content of list from location of index N forward, and then undo
     * remove */
    finder = core_list_find(list, &info);
    if (!finder)
        finder = list->next;
    while (finder)
    {
        retval = crc16(list->info->data16, retval);
        finder = finder->next;
    }
#if CORE_DEBUG
    ee_printf("List sort 1: %04x\n", retval);
#endif
    remover = core_list_undo_remove(remover, list->next);
    /* sort the list by index, in effect returning the list to original state */
    list = core_list_mergesort(list, cmp_idx, NULL);
    /* CRC data content of list */
    finder = list->next;
    while (finder)
    {
        retval = crc16(list->info->data16, retval);
        finder = finder->next;
    }
#if CORE_DEBUG
    ee_printf("List sort 2: %04x\n", retval);
#endif
    return retval;
}

