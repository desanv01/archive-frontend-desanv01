# Day 9, Assignment 2: SRAI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

srai_case_positive:
    li   t0, 0x80
    srai t1, t0, 1
    li   t2, 0x40
    bne  t1, t2, fail

srai_case_negative_sign_fill:
    li   t0, -8
    srai t1, t0, 1
    li   t2, -4
    bne  t1, t2, fail

srai_case_shift_zero:
    li   t0, -8
    srai t1, t0, 0
    li   t2, -8
    bne  t1, t2, fail

srai_case_shift_63_negative:
    li   t0, 0x8000000000000000
    srai t1, t0, 63
    li   t2, -1
    bne  t1, t2, fail

srai_case_rd_eq_rs1:
    li   t0, -32
    srai t0, t0, 4
    li   t2, -2
    bne  t0, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
