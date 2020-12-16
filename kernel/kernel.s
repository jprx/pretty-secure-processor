# Kernel for pretty-secure-processor

#lui x1, %hi(TFT_MEM)
#addi x2, x2, %lo(TEST_CHAR)
#sb x2, 0(x1)
#j wfi_loop

lui x11, %hi(TFT_MEM)
la x12, teststr
la x13, teststr_len
lw x13, 0(x13)
jal memcpy

wfi_loop:
	j wfi_loop

# memcpy(dest = x11, src = x12, len = x13)
memcpy:
_memcpy_loop:
	beq x13, x0, _memcpy_exit
	addi x13, x13, -1
	lb x14, 0(x12)
	sb x14, 0(x11)
	nop
	nop
	nop

	addi x11, x11, 1
	addi x12, x12, 1
	j memcpy
	nop
	nop
	nop
	nop
	nop
	nop

_memcpy_exit:
	jalr x0, x1, 0

teststr_len:
	.word 21

teststr:
	.string "Hello World from PSP!"



.equ TFT_MEM, 0x40000000
.equ TESTSTR_LEN, 21
.equ TEST_CHAR, 0x41