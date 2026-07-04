# Day 9, Assignment 2: write your own RISC-V assembly.
# Edit the area marked below, then run ./run.sh to build + run it on Spike.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

    # ---- your code here -------------------------------------------------
    # Example: compute 3 + 4. Replace with your own instructions.
dv:
    li   t0, 299
    li   t1, 399
    add  t2, t0, t1              # your result in t2

    # ---- self-check: PASS if t2 == expected -----------------------------
    li   t3, 698                   # TODO: set the value you expect
    bne  t2, t3, fail
    # ---------------------------------------------------------------------

    RVTEST_PASS                  # exit 0
fail:
    RVTEST_FAIL                  # exit non-zero

RVTEST_CODE_END

RVTEST_DATA_BEGIN
RVTEST_DATA_END
