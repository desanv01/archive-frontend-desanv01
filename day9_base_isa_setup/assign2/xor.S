# Day 9, Assignment 2: XOR instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

xor_case_basic:
    li  t0, 0xf0
    li  t1, 0x0f
    xor t2, t0, t1
    li  t3, 0xff
    bne t2, t3, fail

xor_case_same_zero:
    li  t0, 0x1234
    xor t2, t0, t0
    li  t3, 0
    bne t2, t3, fail

xor_case_with_all_ones:
    li  t0, 0
    li  t1, -1
    xor t2, t0, t1
    li  t3, -1
    bne t2, t3, fail

xor_case_rd_eq_rs1:
    li  t0, 0xaa
    li  t1, 0xff
    xor t0, t0, t1
    li  t3, 0x55
    bne t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
