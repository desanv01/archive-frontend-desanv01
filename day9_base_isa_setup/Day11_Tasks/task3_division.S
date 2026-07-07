# Day 11 Task 3 - Integer division architectural behavior
Answer : 
# Q1: (-7) / 2 = -3 and (-7) % 2 = -1. RISC-V signed division rounds toward zero.
# Q2: DIVU of 0xffffffffffffffff / 2 returns 0x7fffffffffffffff.
# Q3: DIV by zero returns -1 for signed DIV. It is defined behavior, not a trap.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task3_signed_div_rem:
    li   t0, -7
    li   t1, 2
    div  t2, t0, t1
    rem  t3, t0, t1
    li   t4, -3
    bne  t2, t4, fail
    li   t4, -1
    bne  t3, t4, fail

task3_unsigned_div:
    li   t0, -1
    li   t1, 2
    divu t2, t0, t1
    li   t3, 0x7fffffffffffffff
    bne  t2, t3, fail

task3_divide_by_zero:
    li   t0, 123
    div  t2, t0, x0
    li   t3, -1
    bne  t2, t3, fail

task3_int_min_overflow:
    li   t0, 0x8000000000000000
    li   t1, -1
    div  t2, t0, t1
    rem  t3, t0, t1
    bne  t2, t0, fail
    bne  t3, x0, fail

task3_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
