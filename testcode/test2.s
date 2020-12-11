auipc x1, 0
nop
nop
nop
lw x2, 0(x1)
nop
nop
nop
addi x2, x2, 4
nop
nop
nop
slt x3, x2, x1
nop
nop
nop
sltu x4, x3, x1
nop
nop
nop
slt x5, x1, 0
nop
nop
nop
sltu x6, x2, 2
nop
nop
nop
sb x3, 0(x0)
nop
nop
nop

label1:
    .long 0x69694200

done_addr:
    .long 0x600d600d
