# Day 8 Task 3 - ALU ops, shifts, compare
# Q1: 10110100 AND 11110000 = 10110000 = 0xb0.
# Q2: sra -8,1 gives -4. srl -8,1 shifts in zeroes and gives 0x7ffffffffffffffc on RV64.
# Q3: signed: -1 < 1, so slt gives 1. unsigned: 0xffffffffffffffff > 1, so sltu gives 0.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task3_bit_mask:
    li   t0, 0xb4
    andi t1, t0, 0xf0
    li   t2, 0xb0
    bne  t1, t2, fail

task3_sra_vs_srl:
    li   t0, -8
    srai t1, t0, 1
    srli t2, t0, 1
    li   t3, -4
    bne  t1, t3, fail
    li   t3, 0x7ffffffffffffffc
    bne  t2, t3, fail

task3_slt_vs_sltu:
    li   t0, -1
    li   t1, 1
    slt  t2, t0, t1
    sltu t3, t0, t1
    li   t4, 1
    bne  t2, t4, fail
    bne  t3, x0, fail

task3_count_bits_setup:
    li   t0, 0xb4
    li   t1, 8
    li   t2, 0
task3_bit_count_loop:
    andi t3, t0, 1
    add  t2, t2, t3
    srli t0, t0, 1
    addi t1, t1, -1
    bne  t1, x0, task3_bit_count_loop

task3_check_bit_count:
    li   t4, 4
    bne  t2, t4, fail

task3_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
