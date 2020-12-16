#!/usr/bin/env python3
# Given an input file output its bytes as hex chars, 4 bytes to a line
import sys

if len(sys.argv) != 2:
    print("usage: hexdump.py [file to dump]")
    exit(-1)

with open (sys.argv[1], "rb") as file_f:
    data = file_f.read(4)
    while data:
        print(data[::-1].hex())
        data = file_f.read(4)
