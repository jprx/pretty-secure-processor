# Test hazards
#la x2, label1
#xor x1, x1, x1
#addi x1, x1, 2
#sw x1, 0(x2)

#addi x1, x1, 2
#nop
#nop
#nop
#addi x1, x1, 2
#
#nop
#nop
#nop
#nop
#
#addi x1, x1, 2
#nop
#nop
#addi x1, x1, 2
#
#nop
#nop
#nop
#nop

addi x1, x1, 1
nop
addi x1, x1, 2

# nop
# nop
# nop
# nop
# 
# addi x1, x1, 2
# addi x1, x1, 2
# addi x1, x1, 2
# addi x1, x1, 2
# addi x1, x1, 2
# addi x1, x1, 2

label1:
    .word 0
