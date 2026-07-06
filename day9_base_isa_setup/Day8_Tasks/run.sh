#!/bin/bash
set -e
cd "$(dirname "$0")"

GCC=riscv64-unknown-elf-gcc
OBJDUMP=riscv64-unknown-elf-objdump
SPIKE=spike
ISA=rv64gcZicsr_Zifencei
CFLAGS="-march=rv64imafdczicsr_zifencei -mabi=lp64 -static -mcmodel=medany \
        -fvisibility=hidden -nostdlib -nostartfiles -std=gnu99 -O2 -I.. -T../link.ld"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <name>   example: ./run.sh task1_registers"
    echo "       $0 clean"
    exit 1
fi

if [ "$1" = "clean" ]; then
    rm -rf work
    mkdir -p work
    echo "cleaned work/"
    exit 0
fi

NAME="$1"
SRC="$NAME.S"
OUT="work/$NAME"
ELF="$OUT/$NAME.elf"

[ -f "$SRC" ] || { echo "missing $SRC"; exit 1; }
mkdir -p "$OUT"

echo "assembling $SRC"
$GCC $CFLAGS "$SRC" -o "$ELF"

echo "writing $OUT/$NAME.disass"
$OBJDUMP -d "$ELF" > "$OUT/$NAME.disass"

echo "running spike"
timeout --foreground 5s $SPIKE --isa=$ISA --log-commits --log "$OUT/$NAME.dump" "$ELF"
echo "PASS: $OUT/$NAME.disass and $OUT/$NAME.dump"
