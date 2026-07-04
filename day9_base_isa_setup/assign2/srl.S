# Day 9, Assignment 2: SRL instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

srl_case_shift_zero:
    li  t0, 0x80
    li  t1, 0
    srl t2, t0, t1
    li  t3, 0x80
    bne t2, t3, fail

srl_case_shift_one:
    li  t0, 0x80
    li  t1, 1
    srl t2, t0, t1
    li  t3, 0x40
    bne t2, t3, fail

srl_case_logical_negative:
    li  t0, -1
    li  t1, 1
    srl t2, t0, t1
    li  t3, 0x7fffffffffffffff
    bne t2, t3, fail

srl_case_rs2_mask_64_to_0:
    li  t0, 9
    li  t1, 64
    srl t2, t0, t1
    li  t3, 9
    bne t2, t3, fail

srl_case_rd_eq_rs1:
    li  t0, 0x100
    li  t1, 4
    srl t0, t0, t1
    li  t3, 0x10
    bne t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
