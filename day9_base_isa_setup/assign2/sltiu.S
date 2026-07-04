# Day 9, Assignment 2: SLTIU instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sltiu_case_unsigned_true:
    li    t0, 5
    sltiu t1, t0, 9
    li    t2, 1
    bne   t1, t2, fail

sltiu_case_unsigned_false:
    li    t0, 9
    sltiu t1, t0, 5
    li    t2, 0
    bne   t1, t2, fail

sltiu_case_equal_false:
    li    t0, 7
    sltiu t1, t0, 7
    li    t2, 0
    bne   t1, t2, fail

sltiu_case_negative_rs1_large:
    li    t0, -1
    sltiu t1, t0, 1
    li    t2, 0
    bne   t1, t2, fail

sltiu_case_negative_imm_is_large:
    li    t0, 2047
    sltiu t1, t0, -1
    li    t2, 1
    bne   t1, t2, fail

sltiu_case_seqz_pseudo_behavior:
    sltiu t1, zero, 1
    li    t2, 1
    bne   t1, t2, fail

sltiu_case_rd_eq_rs1:
    li    t0, 2
    sltiu t0, t0, 3
    li    t2, 1
    bne   t0, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
