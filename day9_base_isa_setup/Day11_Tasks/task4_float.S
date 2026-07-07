# Day 11 Task 4 - Basic floating-point operations
Answers :
# Q1: IEEE 754 double 1.0 is 0x3ff0000000000000.
# Q2: 1.0 + 2.0 with FADD.D gives 3.0.
# Q3: FP divide by zero produces infinity and sets the DZ flag in fflags/fcsr; it does not trap like integer code might.

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN
    .option push
    .option norvc

task4_load_and_add_double:
    la   t0, fp_data
    fld  f1, 0(t0)
    # float load double
    # Reads 8 bytes (64 bits) from memory and puts them into a floating-point register.

    fld  f2, 8(t0)
    fadd.d f0, f1, f2
    fsd  f0, 24(t0)
    # float store double
    # Takes a 64-bit value from a floating-point register and saves it into memory.

    ld   t1, 24(t0)
    li   t2, 0x4008000000000000
    bne  t1, t2, fail

task4_int_to_double_and_back:
    li   t1, 7
    fcvt.d.l f3, t1
    # float convert (long to double), read it backwards

    fcvt.l.d t2, f3, rtz
    # float convert (double to long), read it backwards
    bne  t1, t2, fail

task4_compare_double:
    flt.d t3, f1, f2
    # floating less than (compare 2 64bit fp nums)

    li   t4, 1
    bne  t3, t4, fail

task4_divide_by_zero_flag:
    csrwi fflags, 0
    # control_and_write_immediate 0 to fflags

    fld  f4, 16(t0)
    # fp_double_Word
    # (Loads a 64-bit (double-precision) floating-point number from memory into register)

    fdiv.d f5, f1, f4
    # fp_divide_doubleprecision
    # Divides the 64-bit float in f1 by the 64-bit float f4

    csrr t5, fflags
    # control_and_status_register_read
    andi t5, t5, 8
    li   t6, 8
    bne  t5, t6, fail

task4_pass:
    .option pop
    RVTEST_PASS
fail:
    RVTEST_FAIL

RVTEST_CODE_END
RVTEST_DATA_BEGIN
    .align 3
fp_data:
    .dword 0x3ff0000000000000
    .dword 0x4000000000000000
    .dword 0x0000000000000000
fp_result:
    .dword 0
RVTEST_DATA_END
