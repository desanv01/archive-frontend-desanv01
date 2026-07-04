# Day 9, Assignment 2: LBU instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

lbu_case_positive_byte:
    la  t0, lbu_data
    lbu t1, 0(t0)
    li  t2, 0x7f
    bne t1, t2, fail

lbu_case_zero_extend_0x80:
    la  t0, lbu_data
    lbu t1, 1(t0)
    li  t2, 0x80
    bne t1, t2, fail

lbu_case_zero_extend_0xff:
    la  t0, lbu_data
    lbu t1, 2(t0)
    li  t2, 0xff
    bne t1, t2, fail

lbu_case_negative_offset:
    la  t0, lbu_data_plus_3
    lbu t1, -1(t0)
    li  t2, 0xff
    bne t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
lbu_data:
    .byte 0x7f, 0x80, 0xff
lbu_data_plus_3:
    .byte 0x11
RVTEST_DATA_END
