# Day 9, Assignment 2: LH instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

lh_case_positive_half:
    la  t0, lh_data
    lh  t1, 0(t0)
    li  t2, 0x7fff
    bne t1, t2, fail

lh_case_negative_half_sign_extend:
    la  t0, lh_data
    lh  t1, 2(t0)
    li  t2, -32768
    bne t1, t2, fail

lh_case_minus_one_sign_extend:
    la  t0, lh_data
    lh  t1, 4(t0)
    li  t2, -1
    bne t1, t2, fail

lh_case_negative_offset:
    la  t0, lh_data_plus_6
    lh  t1, -2(t0)
    li  t2, -1
    bne t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 1
lh_data:
    .half 0x7fff, 0x8000, 0xffff
lh_data_plus_6:
    .half 0x1234
RVTEST_DATA_END
