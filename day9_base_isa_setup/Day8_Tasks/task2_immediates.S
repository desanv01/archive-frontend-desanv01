# Day 8 Task 2 - Immediate encoding and sign extension
Answers : 
# Q1: addi t0, x0, -1 gives 0xffffffffffffffff on RV64.
# Q2: 0x12345678 can be loaded as lui 0x12345, then addi 0x678.
# Q3: if low 12 bits are >= 0x800, addi treats them as negative, so LUI must add 1 to the upper part.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task2_sign_extend_minus_one:
    addi t0, x0, -1
    li   t1, -1
    bne  t0, t1, fail

task2_load_12345678:
    lui  t2, 0x12345
    addi t2, t2, 0x678
    li   t3, 0x12345678
    bne  t2, t3, fail

task2_low_12_negative_case:
    # Example with low 12 bits >= 0x800:
    # 0x12345888 = 0x12346000 + (-0x778)
    lui  t4, 0x12346
    addi t4, t4, -1912
    li   t5, 0x12345888
    bne  t4, t5, fail

task2_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
RVTEST_DATA_END
