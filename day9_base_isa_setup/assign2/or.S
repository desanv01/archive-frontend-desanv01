# Day 9, Assignment 2: OR instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

or_case_basic:
    li t0, 0xf0
    li t1, 0x0f
    or t2, t0, t1
    li t3, 0xff
    bne t2, t3, fail

or_case_zero:
    li t0, 0x1234
    or t2, t0, zero
    li t3, 0x1234
    bne t2, t3, fail

or_case_all_ones:
    li t0, 0x1234
    li t1, -1
    or t2, t0, t1
    li t3, -1
    bne t2, t3, fail

or_case_rd_eq_rs1:
    li t0, 0x100
    li t1, 0x022
    or t0, t0, t1
    li t3, 0x122
    bne t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
