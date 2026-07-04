# Day 9, Assignment 2: SLTI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

slti_case_signed_true:
    li   t0, -5
    slti t1, t0, 0
    li   t2, 1
    bne  t1, t2, fail

slti_case_signed_false:
    li   t0, 9
    slti t1, t0, -1
    li   t2, 0
    bne  t1, t2, fail

slti_case_equal_false:
    li   t0, 7
    slti t1, t0, 7
    li   t2, 0
    bne  t1, t2, fail

slti_case_max_imm_true:
    li   t0, 2046
    slti t1, t0, 2047
    li   t2, 1
    bne  t1, t2, fail

slti_case_min_imm_false:
    li   t0, -2048
    slti t1, t0, -2048
    li   t2, 0
    bne  t1, t2, fail

slti_case_rd_eq_rs1:
    li   t0, -9
    slti t0, t0, 1
    li   t2, 1
    bne  t0, t2, fail

slti_case_rs1_zero:
    slti t1, zero, 1
    li   t2, 1
    bne  t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
