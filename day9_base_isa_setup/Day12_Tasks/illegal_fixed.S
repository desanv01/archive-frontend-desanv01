#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

    .option norvc
    .align 2
    li TESTNUM, 2

illegal_test:
    .word 0              # illegal instruction, mcause = 2

    j fail               # goes to fail label inside TEST_PASSFAIL

back:
    TEST_PASSFAIL

    .align 8
    .global mtvec_handler

mtvec_handler:
    csrr t1, mcause      # read mcause

    la   t0, back        # missing line 1: load address to continue after trap
    csrw mepc, t0        # missing line 2: change trap return PC to 'back'

    mret                 # return from trap

RVTEST_CODE_END

RVTEST_DATA_BEGIN
RVTEST_DATA_END
