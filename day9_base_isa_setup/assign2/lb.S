# Day 9, Assignment 2: LB instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

lb_case_positive_byte:
    la  t0, lb_data
    lb  t1, 0(t0)
    li  t2, 0x7f
    bne t1, t2, fail

lb_case_negative_byte_sign_extend:
    la  t0, lb_data
    lb  t1, 1(t0)
    li  t2, -128
    bne t1, t2, fail

lb_case_minus_one_sign_extend:
    la  t0, lb_data
    lb  t1, 2(t0)
    li  t2, -1
    bne t1, t2, fail

lb_case_negative_offset:
    la  t0, lb_data_plus_3
    lb  t1, -1(t0)
    li  t2, -1
    bne t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
lb_data:
    .byte 0x7f, 0x80, 0xff
lb_data_plus_3:
    .byte 0x11
RVTEST_DATA_END
