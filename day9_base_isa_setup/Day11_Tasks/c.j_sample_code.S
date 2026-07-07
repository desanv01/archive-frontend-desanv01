#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
    .option push
    .option rvc

c_j_test:
    c.j target_label        # compressed unconditional jump

should_not_run:
    RVTEST_FAIL             # if C.J works, CPU should skip this

target_label:
    li   t0, 5
    li   t1, 5
    bne  t0, t1, fail

    .option pop
    RVTEST_PASS

fail:
    RVTEST_FAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN
RVTEST_DATA_END