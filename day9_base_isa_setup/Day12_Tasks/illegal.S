#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

.option norvc
.align 2

li TESTNUM, 2

la   t0, mtvec_handler
csrw mtvec, t0

illegal_test:
    .word 0              # illegal instruction, mcause = 2

back:
    RVTEST_PASS

fail:
    RVTEST_FAIL

.align 8
.global mtvec_handler

mtvec_handler:
    csrr t1, mcause      # read trap cause
    li   t2, 2           # expected illegal instruction cause

    mret                 # WRONG: returns to same .word 0 again

RVTEST_CODE_END

RVTEST_DATA_BEGIN
RVTEST_DATA_END