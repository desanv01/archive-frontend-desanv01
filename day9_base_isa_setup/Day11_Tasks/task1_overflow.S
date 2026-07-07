# Day 11 Task 1 - Overflow detection in addition/subtraction
Answers : 
# Q1: 0x7fffffffffffffff + 1 = 0x8000000000000000. This is signed overflow, and the result looks negative.
# Q2: ADDW on 0x7fffffff + 1 makes 0x80000000, then sign-extends to 0xffffffff80000000.
# Q3: For positive A and positive B, signed overflow happened if the result is negative.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task1_add64_overflow:
    li   t0, 0x7fffffffffffffff
    li   t1, 1
    add  t2, t0, t1
    li   t3, 0x8000000000000000
    bne  t2, t3, fail

task1_detect_positive_overflow:
    slt  t4, x0, t0
    slt  t5, x0, t1
    and  t4, t4, t5
    slt  t5, t2, x0
    and  t6, t4, t5
    li   a0, 1
    bne  t6, a0, fail

task1_addw_overflow:
    li   t0, 0x7fffffff
    li   t1, 1
    addw t2, t0, t1
    li   t3, 0xffffffff80000000
    bne  t2, t3, fail

task1_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
