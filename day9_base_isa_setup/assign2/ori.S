# Day 9, Assignment 2: ORI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

ori_case_basic:
    li  t0, 0x50
    ori t1, t0, 0x0f
    li  t2, 0x5f
    bne t1, t2, fail

ori_case_zero_imm:
    li  t0, 0x123
    ori t1, t0, 0
    li  t2, 0x123
    bne t1, t2, fail

ori_case_rs1_zero:
    ori t1, zero, 0x7f
    li  t2, 0x7f
    bne t1, t2, fail

ori_case_negative_imm:
    li  t0, 0
    ori t1, t0, -1
    li  t2, -1
    bne t1, t2, fail

ori_case_rd_eq_rs1:
    li  t0, 0x100
    ori t0, t0, 0x022
    li  t2, 0x122
    bne t0, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
