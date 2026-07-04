# Day 9, Assignment 2: SRLI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

srli_case_shift_zero:
    li   t0, 0x80
    srli t1, t0, 0
    li   t2, 0x80
    bne  t1, t2, fail

srli_case_shift_one:
    li   t0, 0x80
    srli t1, t0, 1
    li   t2, 0x40
    bne  t1, t2, fail

srli_case_logical_negative:
    li   t0, -1
    srli t1, t0, 1
    li   t2, 0x7fffffffffffffff
    bne  t1, t2, fail

srli_case_shift_63:
    li   t0, 0x8000000000000000
    srli t1, t0, 63
    li   t2, 1
    bne  t1, t2, fail

srli_case_rd_eq_rs1:
    li   t0, 0x100
    srli t0, t0, 4
    li   t2, 0x10
    bne  t0, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
