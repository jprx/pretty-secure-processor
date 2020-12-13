.align 4
.section .text
.globl _start
_start:
la x1, TEST
xor x2, x2, x2
sw x1, 0(x2)

la x1, TEST
li x2, 0x41414141
sw x2, 0(x1)

j exit

nop
nop
nop
nop
nop
nop


exit:
    la x1, TEST
    xor x1, x1, x1
    lui x1, 0x600d6
    addi x1, x1, 0x00d
    sb x1, 0(x1)

.section .rodata
.balign 256
TEST: .word 0x42424242
