# Day 9, Assignment 2: SLT instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

slt_case_signed_true:
    li  t0, -1
    li  t1, 1
    slt t2, t0, t1
    li  t3, 1
    bne t2, t3, fail

slt_case_signed_false:
    li  t0, 9
    li  t1, -1
    slt t2, t0, t1
    li  t3, 0
    bne t2, t3, fail

slt_case_equal_false:
    li  t0, 5
    li  t1, 5
    slt t2, t0, t1
    li  t3, 0
    bne t2, t3, fail

slt_case_rd_eq_rs1:
    li  t0, -8
    li  t1, 0
    slt t0, t0, t1
    li  t3, 1
    bne t0, t3, fail

slt_case_rs2_zero:
    li  t0, -2
    slt t2, t0, zero
    li  t3, 1
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
