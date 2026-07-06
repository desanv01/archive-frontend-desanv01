# Day 8 Task 1 - Register file exploration
Answers :
# Q1: x10 is a0. It is used for function argument 0 and also return value 0.
# Q2: after li x0, 0xDEAD, x0 is still 0. x0 is hardwired to zero.
# Q3: li x5, 1000 becomes one addi because 1000 fits the signed 12-bit range.
# Q4: the largest positive value for one addi immediate is 2047.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc
dv1:
    li   t0, 1000
    li   t1, -7
    li   x0, 0xDEAD
    add  t2, x0, x0
dv2:
    li   t3, 1000
    bne  t0, t3, fail
    li   t3, -7
    bne  t1, t3, fail
    bne  t2, x0, fail
    bne  x0, x0, fail

    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
