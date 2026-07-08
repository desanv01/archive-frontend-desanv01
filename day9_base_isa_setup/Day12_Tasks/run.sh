#!/bin/bash

TEST=$1

if [ -z "$TEST" ]; then
    echo "Usage: bash run.sh <test_name_without_.S>"
    exit 1
fi

mkdir -p work/$TEST

echo "assembling $TEST.S"

riscv64-unknown-elf-gcc \
    -march=rv64im_zicsr_zifencei \
    -mabi=lp64 \
    -static \
    -mcmodel=medany \
    -fvisibility=hidden \
    -nostdlib \
    -nostartfiles \
    -I.. \
    -T ../link.ld \
    $TEST.S \
    -o work/$TEST/$TEST.elf

if [ $? -ne 0 ]; then
    echo "assembly failed"
    exit 1
fi

echo "writing work/$TEST/$TEST.disass"

riscv64-unknown-elf-objdump -d work/$TEST/$TEST.elf > work/$TEST/$TEST.disass
riscv64-unknown-elf-objdump -D work/$TEST/$TEST.elf > work/$TEST/$TEST.dump

echo "running spike"

spike --isa=rv64im_zicsr_zifencei work/$TEST/$TEST.elf
