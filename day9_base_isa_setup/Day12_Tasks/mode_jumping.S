#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

    .option norvc
    .align 2

test_illegal:
    .word 0              # illegal instruction
    j fail

back:
    nop
    nop
    nop
    add t0, t1, t2

    RVTEST_PASS

fail:
    RVTEST_FAIL

.globl mtvec_handler
mtvec_handler:
    csrr t3, mcause
    csrr t4, mtval
    csrr t5, mstatus

    la   t0, back
    csrw mepc, t0

    # Set mstatus.MPP = 00, so mret returns to USER mode
    csrr t0, mstatus
    li   t1, 0x1800      # MPP bits = bits 12:11
    not  t1, t1
    and  t0, t0, t1      # clear MPP
    csrw mstatus, t0

    mret

RVTEST_CODE_END

RVTEST_DATA_BEGIN

test_mem:
.dword 0xdeadbeaf
.dword 0x12345678
.dword 0xdeadbeaf
.dword 0x12345678
.dword 0xdeadbeaf
.dword 0x12345678

RVTEST_DATA_END