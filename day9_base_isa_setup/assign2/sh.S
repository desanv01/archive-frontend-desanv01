# Day 9, Assignment 2: SH instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sh_case_store_half:
    la  t0, sh_area
    li  t1, 0xabcd
    sh  t1, 0(t0)
    lhu t2, 0(t0)
    li  t3, 0xabcd
    bne t2, t3, fail

sh_case_store_low_half_only:
    la  t0, sh_area
    li  t1, 0x123456789abcdef0
    sh  t1, 2(t0)
    lhu t2, 2(t0)
    li  t3, 0xdef0
    bne t2, t3, fail

sh_case_negative_offset:
    la  t0, sh_area_plus_6
    li  t1, 0x7f80
    sh  t1, -2(t0)
    lhu t2, -2(t0)
    li  t3, 0x7f80
    bne t2, t3, fail

sh_case_neighbor_unchanged:
    la  t0, sh_area
    lhu t2, 6(t0)
    li  t3, 0
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 1
sh_area:
    .half 0, 0, 0
sh_area_plus_6:
    .half 0
RVTEST_DATA_END
