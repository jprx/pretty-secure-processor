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

riscv64-linux-gnu-as -march=rv32i -mabi=ilp32 -c $1 -o $FILENAME_PREFIX.o
riscv64-linux-gnu-objcopy -O binary $FILENAME_PREFIX.o $FILENAME_PREFIX.bin
python3 hexdump.py $FILENAME_PREFIX.bin > $FILENAME_PREFIX.mem
# rm $FILENAME_PREFIX.o
rm $FILENAME_PREFIX.bin

echo "Output is at $FILENAME_PREFIX.mem"
