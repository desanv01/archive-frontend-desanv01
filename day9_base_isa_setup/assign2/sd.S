# Day 9, Assignment 2: SD instruction tests.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

sd_case_store_double:
    la  t0, sd_area
    li  t1, 0x0123456789abcdef
    sd  t1, 0(t0)
    ld  t2, 0(t0)
    li  t3, 0x0123456789abcdef
    bne t2, t3, fail

sd_case_store_minus_one:
    la  t0, sd_area
    li  t1, -1
    sd  t1, 8(t0)
    ld  t2, 8(t0)
    li  t3, -1
    bne t2, t3, fail

sd_case_negative_offset:
    la  t0, sd_area_plus_24
    li  t1, 0x8000000000000000
    sd  t1, -8(t0)
    ld  t2, -8(t0)
    li  t3, 0x8000000000000000
    bne t2, t3, fail

sd_case_neighbor_unchanged:
    la  t0, sd_area
    ld  t2, 24(t0)
    li  t3, 0
    bne t2, t3, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 3
sd_area:
    .dword 0, 0, 0
sd_area_plus_24:
    .dword 0
RVTEST_DATA_END
