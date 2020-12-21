# Kernel for pretty-secure-processor

la x30, exception_vector

# Clear video memory
lui x11, %hi(TFT_MEM)
la x12, clear_vmem_val
lw x12, 0(x12)
la x13, clear_vmem_len
lw x13, 0(x13)
jal memset

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

lui x11, %hi(TFT_MEM)
addi x11, x11, 240
la x12, testcase_prompt_str
la x13, testcase_prompt_len
lw x13, 0(x13)
jal memcpy

jal malicious

# Skip over this instruction if we do return (malicious increments return address by 4)
nop

# Should only get here if Pointer HMACs are disabled in the core
lui x11, %hi(TFT_MEM)
addi x11, x11, 240
addi x11, x11, 160
la x12, never_get_here_str
la x13, never_get_here_len
lw x13, 0(x13)
jal memcpy

#j exit

# Malicious method- attempts to mess with return address!
malicious:
	addi x1, x1, 4
	jalr x0, x1, 0

# Wait for interrupt forever
wfi_loop:
	j wfi_loop

# Exit from simulation
exit:
    la x1, TEST
    xor x1, x1, x1
    lui x1, 0x600d6
    addi x1, x1, 0x00d
    sb x1, 0(x1)

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

# memset(dest = x11, val = x12, len = x13)
memset:
_memset_loop:
	beq x13, x0, _memset_exit
	addi x13, x13, -1
	sb x12, 0(x11)
	nop
	nop
	nop
	addi x11, x11, 1
	j memset
	nop
	nop
	nop
	nop

_memset_exit:
	jalr x0, x1, 0

# Generate hash in x11
verify_hash:
	la x16, verify_hash_num_iters
	lw x16, 0(x16)

_verify_hash_outer_loop:
	beq x16, x0, _verify_hash_exit
	addi x16, x16, -1
	xor x12, x12, x12
	la x13, verify_hash_len
	lw x13, 0(x13)
	xor x11, x11, x11
_verify_hash_loop:
	beq x13, x0, _verify_hash_outer_loop
	lw x14, 0(x12)
	add x11, x14, x11
	addi x12, x12, 4
	addi x13, x13, -1
	j _verify_hash_loop

_verify_hash_exit:
	jalr x0, x1, 0

verify_hash_num_iters:
	.word 300000

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

exception_vector:
	lui x11, %hi(TFT_MEM)
	addi x11, x11, 240
	addi x11, x11, 240
	addi x11, x11, 240
	addi x11, x11, 240
	addi x11, x11, 240
	addi x11, x11, 240
	addi x11, x11, 240
	la x12, exception_str
	la x13, exception_str_len
	lw x13, 0(x13)
	jal memcpy

loop_forever:
	j loop_forever

# Number of words to read

.balign 4
verify_hash_len:
	.word 16

teststr_len:
	.word 21

exception_str_len:
	.word 80

welcome_str_len:
	.word 25

clear_vmem_val:
	.word 0x20

clear_vmem_len:
	.word 2560

testcase_prompt_len:
	.word 124

never_get_here_len:
	.word 33

.balign 4
teststr:
	.string "Hello World from PSP!"

testcase_prompt_str:
	.string "About to jump into malicious code.                                              (We should observe an exception after this)!"

welcome_str:
	.string "Verifying bootrom hash..."

exception_str:
	.string "                        Exception: Pointer HMAC Invalid!                        "

.balign 4
never_get_here_str:
	.string "You should never see this string."

# Reinforce alignment after the strings
.balign 4

.equ TFT_MEM, 0x40000000
.equ TESTSTR_LEN, 21
.equ TEST_CHAR, 0x41

.section .rodata
.balign 256
TEST: .word 0x42424242

