# Day 11 Task 2 - Multiplication high-word precision
Answers : 
# Q1: MUL of -1 * -1 gives 1.
# Q2: Unsigned max * unsigned max has lower 64 bits = 1 and upper 64 bits = 0xfffffffffffffffe.
# Q3: MULH treats operands as signed, while MULHU treats the same bits as unsigned.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task2_mul_negative_one:
    li   t0, -1
    li   t1, -1
    mul  t2, t0, t1
    li   t3, 1
    bne  t2, t3, fail

task2_mulhu_full_unsigned:
    li   t0, -1
    li   t1, -1
    mul  t2, t0, t1
    mulhu t3, t0, t1
    li   t4, 1
    bne  t2, t4, fail
    li   t4, 0xfffffffffffffffe
    bne  t3, t4, fail

task2_mulh_vs_mulhu:
    mulh t5, t0, t1
    li   t6, 0
    bne  t5, t6, fail
    beq  t5, t3, fail

task2_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
