# Day 9, Assignment 2: SUB instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sub_case_positive:
    li  t0, 399
    li  t1, 299
    sub t2, t0, t1
    li  t3, 100
    bne t2, t3, fail

sub_case_negative_result:
    li  t0, 7
    li  t1, 20
    sub t2, t0, t1
    li  t3, -13
    bne t2, t3, fail

sub_case_overflow_wrap:
    li  t0, 0x8000000000000000
    li  t1, 1
    sub t2, t0, t1
    li  t3, 0x7fffffffffffffff
    bne t2, t3, fail

sub_case_rd_eq_rs1:
    li  t0, 10
    li  t1, 3
    sub t0, t0, t1
    li  t3, 7
    bne t0, t3, fail

sub_case_rs1_zero:
    li  t1, 5
    sub t2, zero, t1
    li  t3, -5
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
