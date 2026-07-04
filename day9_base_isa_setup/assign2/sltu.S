# Day 9, Assignment 2: SLTU instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sltu_case_unsigned_true:
    li   t0, 1
    li   t1, 9
    sltu t2, t0, t1
    li   t3, 1
    bne  t2, t3, fail

sltu_case_unsigned_false:
    li   t0, -1
    li   t1, 1
    sltu t2, t0, t1
    li   t3, 0
    bne  t2, t3, fail

sltu_case_equal_false:
    li   t0, 7
    li   t1, 7
    sltu t2, t0, t1
    li   t3, 0
    bne  t2, t3, fail

sltu_case_snez_pseudo_behavior:
    li   t0, 9
    sltu t2, zero, t0
    li   t3, 1
    bne  t2, t3, fail

sltu_case_rd_eq_rs1:
    li   t0, 2
    li   t1, 3
    sltu t0, t0, t1
    li   t3, 1
    bne  t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
