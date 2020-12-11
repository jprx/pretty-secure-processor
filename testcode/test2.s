# auipc x1, 0
# nop
# nop
# nop
# lw x2, 0(x1)
# nop
# nop
# nop
# addi x2, x2, 4
# nop
# nop
# nop
# slt x3, x2, x1
# nop
# nop
# nop
# sltu x4, x3, x1
# nop
# nop
# nop
# slt x5, x1, 0
# nop
# nop
# nop
# sltu x6, x2, 2
# nop
# nop
# nop
# sb x3, 0(x0)

xor x1, x1, x1
nop
nop
nop
addi x1, x1, 69
nop
nop
nop
sh x1, 4(x0)
nop
nop
nop
lbu x2, 52(x0)

label3:
    .long 0x000000ff

label1:
    .long 0x69694200

done_addr:
    .long 0x600d600d
