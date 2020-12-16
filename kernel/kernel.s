# Kernel for pretty-secure-processor

lui x11, %hi(TFT_MEM)
la x12, welcome_str
la x13, welcome_str_len
lw x13, 0(x13)
jal memcpy
jal verify_hash

lui x12, %hi(TFT_MEM)
addi x12, x12, 80
jal print_as_hex

lui x11, %hi(TFT_MEM)
addi x11, x11, 160
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

# Generate hash in x11
verify_hash:
	xor x12, x12, x12
	la x13, verify_hash_len
	lw x13, 0(x13)
	xor x11, x11, x11
_verify_hash_loop:
	beq x13, x0, _verify_hash_exit
	lw x14, 0(x12)
	add x11, x14, x11
	addi x12, x12, 1
	addi x13, x13, -1
	j _verify_hash_loop

_verify_hash_exit:
	jalr x0, x1, 0

# Print contents of x11 in hex at address x12
print_as_hex:
	# Save return address:
	mv x2, x1
	srli x13, x11, 28
	jal print_byte
	addi x12, x12, 1

	srli x13, x11, 24
	jal print_byte
	addi x12, x12, 1

	srli x13, x11, 20
	jal print_byte
	addi x12, x12, 1

	srli x13, x11, 16
	jal print_byte
	addi x12, x12, 1

	srli x13, x11, 12
	jal print_byte
	addi x12, x12, 1

	srli x13, x11, 8
	jal print_byte
	addi x12, x12, 1

	srli x13, x11, 4
	jal print_byte
	addi x12, x12, 1

	mv x13, x11
	jal print_byte
	addi x12, x12, 1

	mv x1, x2
	jalr x0, x1, 0

# Print lower byte in x13 as hex
print_byte:
	andi x13, x13, 0x0f
	xor x14, x14, x14
	addi x14, x14, 10
	blt x13, x14, _print_as_hex_byte_int
	addi x13, x13, 0x7

_print_as_hex_byte_int:
	addi x13, x13, 0x30
	sb x13, 0(x12)
	jalr x0, x1, 0

# Number of words to read
verify_hash_len:
	.word 16

teststr_len:
	.word 21

teststr:
	.string "Hello World from PSP!"

welcome_str:
	.string "Verifying bootrom hash..."

welcome_str_len:
	.word 25


.equ TFT_MEM, 0x40000000
.equ TESTSTR_LEN, 21
.equ TEST_CHAR, 0x41