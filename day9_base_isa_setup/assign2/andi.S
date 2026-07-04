# Day 9, Assignment 2: ANDI instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

andi_case_mask_low:
    li   t0, 0x3f
    andi t1, t0, 0x0f
    li   t2, 0x0f
    bne  t1, t2, fail

andi_case_zero_result:
    li   t0, 0x55
    andi t1, t0, 0x0a
    li   t2, 0x00
    bne  t1, t2, fail

andi_case_negative_imm_all_ones:
    li   t0, 0x123
    andi t1, t0, -1
    li   t2, 0x123
    bne  t1, t2, fail

andi_case_sign_extended_imm:
    li   t0, -1
    andi t1, t0, -2048
    li   t2, -2048
    bne  t1, t2, fail

andi_case_rd_eq_rs1:
    li   t0, 0xff
    andi t0, t0, 0xf0
    li   t2, 0xf0
    bne  t0, t2, fail

andi_case_rs1_zero:
    andi t1, zero, -1
    li   t2, 0
    bne  t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
