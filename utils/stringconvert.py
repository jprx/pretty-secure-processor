#!/usr/bin/env python3
# Convert a string of text to a memory initialization file.

val = "Hello, PSP!".ljust(80*32)

val = " " * (80 * 14)

val += "+-------------------------+".center(80)
val += "| Pretty Secure Processor |".center(80)
val += "+-------------------------+".center(80)

val = val.ljust(80*32)

for i in val:
	print(hex(ord(i))[2:])
