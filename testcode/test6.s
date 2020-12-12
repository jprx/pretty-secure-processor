# A longer test with some branches, jal/ jalrs, and hazards
# x1 <- return address pointer

add x3, x1, 1
la x8, TEST
sw  x3, 0(x8)
lw  x4, TEST
bne x3,x4, fail
j exit

TEST:
    .word 0x00000042

fail:
    j fail

jal testfn
j exit

testfn:
    ret

main:
    la x11, memcpy_region
    xor x12, x12, x12
    addi x12, x12, 0x41
    xor x13, x13, x13
    addi x13, x13, 20
    jal memcpy
    j exit
    
# memset(dest_addr = x11, val (char) = x12, len = x13)
memset:
    # x4 = cursor
    # x5 = idx
    addi x4, x11, 0
    addi x5, x13, 0

_memset_loop:
    beq x5, x0, _memset_exit
    sb x12, 0(x4)
    addi x4, x4, 1
    addi x5, x5, -1
    j _memset_loop

_memset_exit:
    ret # jalr x0, x1, 0

exit:
    xor x1, x1, x1
    lui x1, 0x600d6
    addi x1, x1, 0x00d
    sb x1, 0(x1)

memcpy_region:
    .word 0
