# Kernel for pretty-secure-processor

lui x11, %hi(TFT_MEM)
la x12, teststr
xor x13, x13, x13
addi x13, x13, %lo(TESTSTR_LEN)
jal memcpy

wfi_loop:
	j wfi_loop

# memcpy(dest = x11, src = x12, len = x13)
memcpy:
	mv x10, x13
_memcpy_loop:
	beq x1, x0, _memcpy_exit
	addi x13, x13, -1
	lb x14, 0(x12)
	sb x14, 0(x11)
	addi x11, x11, 1
	addi x12, x12, 1
	j _memcpy_loop

_memcpy_exit:
	jalr x0, x1, 0

teststr:
	.string "Hello World from PSP!"

.equ TFT_MEM, 0x40000000
.equ TESTSTR_LEN, 21
.equ TEST_CHAR, 0x41