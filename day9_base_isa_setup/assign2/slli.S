# Day 9, Assignment 2: SLLI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

slli_case_shift_zero:
    li   t0, 0x12
    slli t1, t0, 0
    li   t2, 0x12
    bne  t1, t2, fail

slli_case_shift_one:
    li   t0, 0x12
    slli t1, t0, 1
    li   t2, 0x24
    bne  t1, t2, fail

slli_case_shift_31:
    li   t0, 1
    slli t1, t0, 31
    li   t2, 0x80000000
    bne  t1, t2, fail

slli_case_shift_63:
    li   t0, 1
    slli t1, t0, 63
    li   t2, 0x8000000000000000
    bne  t1, t2, fail

slli_case_rd_eq_rs1:
    li   t0, 3
    slli t0, t0, 4
    li   t2, 48
    bne  t0, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
