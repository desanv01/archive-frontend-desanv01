# Day 9, Assignment 2: XORI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

xori_case_basic:
    li   t0, 0x55
    xori t1, t0, 0x0f
    li   t2, 0x5a
    bne  t1, t2, fail

xori_case_zero_imm:
    li   t0, 0x123
    xori t1, t0, 0
    li   t2, 0x123
    bne  t1, t2, fail

xori_case_not_pseudo_behavior:
    li   t0, 0
    xori t1, t0, -1
    li   t2, -1
    bne  t1, t2, fail

xori_case_negative_value:
    li   t0, -1
    xori t1, t0, 0x0f
    li   t2, -16
    bne  t1, t2, fail

xori_case_rd_eq_rs1:
    li   t0, 0xaa
    xori t0, t0, 0xff
    li   t2, 0x55
    bne  t0, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
