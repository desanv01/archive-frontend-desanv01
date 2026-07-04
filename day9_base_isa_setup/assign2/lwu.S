# Day 9, Assignment 2: LWU instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

lwu_case_positive_word:
    la  t0, lwu_data
    lwu t1, 0(t0)
    li  t2, 0x7fffffff
    bne t1, t2, fail

lwu_case_zero_extend_0x80000000:
    la  t0, lwu_data
    lwu t1, 4(t0)
    li  t2, 0x80000000
    bne t1, t2, fail

lwu_case_zero_extend_0xffffffff:
    la  t0, lwu_data
    lwu t1, 8(t0)
    li  t2, 0xffffffff
    bne t1, t2, fail

lwu_case_negative_offset:
    la  t0, lwu_data_plus_12
    lwu t1, -4(t0)
    li  t2, 0xffffffff
    bne t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 2
lwu_data:
    .word 0x7fffffff, 0x80000000, 0xffffffff
lwu_data_plus_12:
    .word 0x12345678
RVTEST_DATA_END
