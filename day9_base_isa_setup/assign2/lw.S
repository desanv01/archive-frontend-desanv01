# Day 9, Assignment 2: LW instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

lw_case_positive_word:
    la  t0, lw_data
    lw  t1, 0(t0)
    li  t2, 0x7fffffff
    bne t1, t2, fail

lw_case_negative_word_sign_extend:
    la  t0, lw_data
    lw  t1, 4(t0)
    li  t2, 0xffffffff80000000
    bne t1, t2, fail

lw_case_minus_one_sign_extend:
    la  t0, lw_data
    lw  t1, 8(t0)
    li  t2, -1
    bne t1, t2, fail

lw_case_negative_offset:
    la  t0, lw_data_plus_12
    lw  t1, -4(t0)
    li  t2, -1
    bne t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 2
lw_data:
    .word 0x7fffffff, 0x80000000, 0xffffffff
lw_data_plus_12:
    .word 0x12345678
RVTEST_DATA_END
