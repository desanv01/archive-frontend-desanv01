# Day 9, Assignment 2: LD instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

ld_case_positive_double:
    la  t0, ld_data
    ld  t1, 0(t0)
    li  t2, 0x0123456789abcdef
    bne t1, t2, fail

ld_case_negative_double:
    la  t0, ld_data
    ld  t1, 8(t0)
    li  t2, -1
    bne t1, t2, fail

ld_case_sign_bit_value:
    la  t0, ld_data
    ld  t1, 16(t0)
    li  t2, 0x8000000000000000
    bne t1, t2, fail

ld_case_negative_offset:
    la  t0, ld_data_plus_24
    ld  t1, -8(t0)
    li  t2, 0x8000000000000000
    bne t1, t2, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 3
ld_data:
    .dword 0x0123456789abcdef, 0xffffffffffffffff, 0x8000000000000000
ld_data_plus_24:
    .dword 0x1111222233334444
RVTEST_DATA_END
