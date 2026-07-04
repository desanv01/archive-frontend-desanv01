# Day 9, Assignment 2: SRA instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sra_case_positive:
    li  t0, 0x80
    li  t1, 1
    sra t2, t0, t1
    li  t3, 0x40
    bne t2, t3, fail

sra_case_negative_sign_fill:
    li  t0, -8
    li  t1, 1
    sra t2, t0, t1
    li  t3, -4
    bne t2, t3, fail

sra_case_shift_63_negative:
    li  t0, 0x8000000000000000
    li  t1, 63
    sra t2, t0, t1
    li  t3, -1
    bne t2, t3, fail

sra_case_rs2_mask_64_to_0:
    li  t0, -9
    li  t1, 64
    sra t2, t0, t1
    li  t3, -9
    bne t2, t3, fail

sra_case_rd_eq_rs1:
    li  t0, -32
    li  t1, 4
    sra t0, t0, t1
    li  t3, -2
    bne t0, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
