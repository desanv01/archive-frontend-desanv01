# odd_and_even.S
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option norvc

    li   t0, 66

    # If bit 0 is 0, number is even.if bit 0 is 1, number is odd.
    andi t1, t0, 1

    bne  t1, x0, fail

    .option pop
    RVTEST_PASS

fail:
    RVTEST_FAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN
RVTEST_DATA_END