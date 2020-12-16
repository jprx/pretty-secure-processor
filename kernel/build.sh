#!/bin/bash
# Make a raw rv32i binary

if [[ -z $1 ]]; then
    echo "Missing file!"
    echo "Usage: build.sh [assembly file to build]"
    exit -1
fi

echo "Building $1"

# strip .s from file
FILENAME_PREFIX=`basename $1 .s`

riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -fno-plt -fno-pic $1 -o $FILENAME_PREFIX.o
riscv64-unknown-elf-objcopy -O binary $FILENAME_PREFIX.o $FILENAME_PREFIX.bin
riscv64-unknown-elf-objdump -d $FILENAME_PREFIX.o -Mnumeric
python3 hexdump.py $FILENAME_PREFIX.bin > $FILENAME_PREFIX.mem
rm $FILENAME_PREFIX.o
rm $FILENAME_PREFIX.bin

echo "Output is at $FILENAME_PREFIX.mem"
