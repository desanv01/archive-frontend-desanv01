# Day 9, Assignment 2: SW instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sw_case_store_word:
    la  t0, sw_area
    li  t1, 0x89abcdef
    sw  t1, 0(t0)
    lwu t2, 0(t0)
    li  t3, 0x89abcdef
    bne t2, t3, fail

sw_case_store_low_word_only:
    la  t0, sw_area
    li  t1, 0x123456789abcdef0
    sw  t1, 4(t0)
    lwu t2, 4(t0)
    li  t3, 0x9abcdef0
    bne t2, t3, fail

sw_case_negative_offset:
    la  t0, sw_area_plus_12
    li  t1, 0x7f800102
    sw  t1, -4(t0)
    lwu t2, -4(t0)
    li  t3, 0x7f800102
    bne t2, t3, fail

sw_case_neighbor_unchanged:
    la  t0, sw_area
    lwu t2, 12(t0)
    li  t3, 0
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 2
sw_area:
    .word 0, 0, 0
sw_area_plus_12:
    .word 0
RVTEST_DATA_END
