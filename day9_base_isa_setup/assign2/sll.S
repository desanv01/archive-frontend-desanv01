# Day 9, Assignment 2: SLL instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sll_case_shift_zero:
    li  t0, 0x12
    li  t1, 0
    sll t2, t0, t1
    li  t3, 0x12
    bne t2, t3, fail

sll_case_shift_one:
    li  t0, 0x12
    li  t1, 1
    sll t2, t0, t1
    li  t3, 0x24
    bne t2, t3, fail

sll_case_shift_63:
    li  t0, 1
    li  t1, 63
    sll t2, t0, t1
    li  t3, 0x8000000000000000
    bne t2, t3, fail

sll_case_rs2_mask_64_to_0:
    li  t0, 5
    li  t1, 64
    sll t2, t0, t1
    li  t3, 5
    bne t2, t3, fail

sll_case_rd_eq_rs1:
    li  t0, 3
    li  t1, 4
    sll t0, t0, t1
    li  t3, 48
    bne t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
