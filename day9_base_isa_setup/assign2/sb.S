# Day 9, Assignment 2: SB instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sb_case_store_low_byte:
    la  t0, sb_area
    li  t1, 0xaa
    sb  t1, 0(t0)
    lbu t2, 0(t0)
    li  t3, 0xaa
    bne t2, t3, fail

sb_case_store_low_byte_only:
    la  t0, sb_area
    li  t1, 0x123456789abcdef0
    sb  t1, 1(t0)
    lbu t2, 1(t0)
    li  t3, 0xf0
    bne t2, t3, fail

sb_case_negative_offset:
    la  t0, sb_area_plus_4
    li  t1, 0x7f
    sb  t1, -1(t0)
    lbu t2, -1(t0)
    li  t3, 0x7f
    bne t2, t3, fail

sb_case_neighbor_unchanged:
    la  t0, sb_area
    lbu t2, 2(t0)
    li  t3, 0x00
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
sb_area:
    .byte 0, 0, 0, 0
sb_area_plus_4:
    .byte 0
RVTEST_DATA_END
