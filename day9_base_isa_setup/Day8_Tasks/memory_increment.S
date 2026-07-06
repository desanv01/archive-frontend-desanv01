#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

    la   t0, test_mem
    li   t1, 20

loop:
    lw   t2, 0(t0)
    addi t2, t2, 1
    sw   t2, 0(t0)

    addi t0, t0, 4
    addi t1, t1, -1
    bne  t1, x0, loop

    .option pop
    RVTEST_PASS

fail:
    RVTEST_FAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN

test_mem:
    .word 0x1
    .word 0x2
    .word 0x3
    .word 0x4
    .word 0x5
    .word 0x1
    .word 0x2
    .word 0x3
    .word 0x4
    .word 0x5
    .word 0x1
    .word 0x2
    .word 0x3
    .word 0x4
    .word 0x5
    .word 0x1
    .word 0x2
    .word 0x3
    .word 0x4
    .word 0x5

RVTEST_DATA_END