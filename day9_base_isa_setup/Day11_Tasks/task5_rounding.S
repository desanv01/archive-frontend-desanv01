# Day 11 Task 5 - FP rounding modes and FCSR
Answers :
# Q1: 2.5 converts to 2 with RNE, 2 with RTZ, 2 with RDN, and 3 with RUP.
# Q2: Ties to even means exactly-half values choose the even integer. So 2.5 goes to 2.
# Q3: FDIV.D by zero sets the DZ flag, which is bit 3 of fflags.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task5_load_2_5:
    la   t0, round_data
    fld  f0, 0(t0)

task5_convert_static_rounding:
    fcvt.l.d t1, f0, rne # round_to_nearest_even
    fcvt.l.d t2, f0, rtz # round_towards_zero
    fcvt.l.d t3, f0, rdn # round_down
    fcvt.l.d t4, f0, rup # round_up
    li   t5, 2
    bne  t1, t5, fail
    bne  t2, t5, fail
    bne  t3, t5, fail
    li   t5, 3
    bne  t4, t5, fail

task5_read_modify_frm:
    csrwi frm, 1
    csrr t6, frm # frm=fp_rounding_mode
    li   t5, 1
    bne  t6, t5, fail
    csrwi frm, 0

task5_divide_by_zero_flag:
    csrwi fflags, 0
    fld  f1, 8(t0)
    fld  f2, 16(t0)
    fdiv.d f3, f1, f2
    csrr t1, fflags
    andi t1, t1, 8
    li   t2, 8
    bne  t1, t2, fail

task5_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 3
round_data:
    .dword 0x4004000000000000
    .dword 0x3ff0000000000000
    .dword 0x0000000000000000
RVTEST_DATA_END
