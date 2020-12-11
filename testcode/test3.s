xor x1, x1, x1
nop
nop
nop
beq x1, x0, location_1
nop
nop
nop
addi x1, x1, 0xffffffff
nop
nop
nop

location_1:
addi x1, x1, 0x1
nop
nop
nop

# At the end if branching works x1 should have the value 1, otherwise 0
