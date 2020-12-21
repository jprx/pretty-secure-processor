
jal testfn
addi x11, x11, 1
addi x11, x11, 1
addi x11, x11, 1
addi x11, x11, 1
j exit

testfn:
	nop
	nop
	nop
	nop
	addi x1, x1, 1
	addi x2, x2, 2
	jal testfn2
	nop
	nop
	nop
	nop
	jalr x0, x1, 0
	nop
	nop
	nop
	nop


testfn2:
	nop
	nop
	nop
	nop
	jalr x0, x1, 0

# Exit from simulation
exit:
    la x1, TEST
    xor x1, x1, x1
    lui x1, 0x600d6
    addi x1, x1, 0x00d
    sb x1, 0(x1)

.section .rodata
.balign 256
TEST: .word 0x42424242

