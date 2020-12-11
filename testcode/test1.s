#la x1, label1
#lw x2, done_addr
#lw x29, done_addr
auipc x1, 0
nop
nop
nop
nop
addi x1, x1, 20
nop
nop
nop
lw x1, 0(x1)
nop
nop
nop
addi x1, x1, 4
nop
nop
nop
sw x1, 0(x1)

label1:
    .long 0x69694200

done_addr:
    .long 0x600d600d
