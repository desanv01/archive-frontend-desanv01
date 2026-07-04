# Day 9, Assignment 2: AND instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

and_case_basic:
    li  t0, 0xf0
    li  t1, 0x3c
    and t2, t0, t1
    li  t3, 0x30
    bne t2, t3, fail

and_case_zero:
    li  t0, 0xaa
    li  t1, 0x55
    and t2, t0, t1
    li  t3, 0
    bne t2, t3, fail

and_case_all_ones:
    li  t0, 0x1234
    li  t1, -1
    and t2, t0, t1
    li  t3, 0x1234
    bne t2, t3, fail

and_case_rd_eq_rs1:
    li  t0, 0xff
    li  t1, 0x0f
    and t0, t0, t1
    li  t3, 0x0f
    bne t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
