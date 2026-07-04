# Day 9, Assignment 2: ADD instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

add_case_positive:
    li  t0, 299
    li  t1, 399
    add t2, t0, t1
    li  t3, 698
    bne t2, t3, fail

add_case_negative:
    li  t0, -20
    li  t1, 7
    add t2, t0, t1
    li  t3, -13
    bne t2, t3, fail

add_case_overflow_wrap:
    li  t0, 0x7fffffffffffffff
    li  t1, 1
    add t2, t0, t1
    li  t3, 0x8000000000000000
    bne t2, t3, fail

add_case_rd_eq_rs1:
    li  t0, 5
    li  t1, 9
    add t0, t0, t1
    li  t3, 14
    bne t0, t3, fail

add_case_rs1_zero:
    li  t1, 44
    add t2, zero, t1
    li  t3, 44
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
