# Day 9, Assignment 2: ADDI instruction tests.
# Avoids x3/gp and x4/tp.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

addi_case_positive:
    li   t0, 10
    addi t1, t0, 25
    li   t2, 35
    bne  t1, t2, fail

addi_case_negative_imm:
    li   t0, 10
    addi t1, t0, -25
    li   t2, -15
    bne  t1, t2, fail

addi_case_min_imm:
    li   t0, 7
    addi t1, t0, -2048
    li   t2, -2041
    bne  t1, t2, fail

addi_case_max_imm:
    li   t0, 7
    addi t1, t0, 2047
    li   t2, 2054
    bne  t1, t2, fail

addi_case_rd_eq_rs1:
    li   t0, 99
    addi t0, t0, 1
    li   t2, 100
    bne  t0, t2, fail

addi_case_rs1_zero:
    addi t1, zero, -12
    li   t2, -12
    bne  t1, t2, fail

addi_case_rd_zero_ignored:
    li   t0, 123
    addi zero, t0, 9
    bne  zero, zero, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
