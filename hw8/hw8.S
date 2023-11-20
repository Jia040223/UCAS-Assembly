.section .data
.section .text
.globl __start
__start:
    addiu $4, $0, 0x0fff 
    jal  print_dec
    nop

#exit
    jal  as_exit
    nop

.globl print_dec
.type print_dec, @function
print_dec:
    sub $sp, $sp, 24
    addi $t0, $sp, 11 #$t0 : pointer
    
    sb  $0, 0($t0)
    beq $4, $0, L2 #$4 : x
    nop

    addi $t1, $0, 10 #$t1 : 10
L1:
    addi $t0, $t0, -1
    xor  $t2, $t2, $t2 #$t2 : 0
    divu  $4, $t1
    mfhi $t2 #$t2  : r
    mflo $4  # $4 : x
    addi $t3, $0, 0x30 #$t3 : 0x30 
    or   $t4, $t3, $t2 #$t4 : r|0x30
 
    sb   $t4, 0($t0) 
    bne $4, $0,  L1     # x!=0
    nop

    add $t1, $sp, 11
    sub $a2, $t1, $t0
    add  $a1, $0, $t0
    j   L3
    nop

L2: addi $t0, $t0, -1
    addi $t2, $0, '0'
    sb   $t2, 0($t0)
    addi $a2, $0, 1
    addi $a1, $t0, 0

L3:
    addi $v0, $0, 4004
    addi $a0, $0, 1
    syscall

    addi $sp, $sp, 24
    jr $31
    nop

.globl as_exit
.type as_exit, @function
as_exit:
    addi $v0, $0, 4001
    addi $a0, $0, 0
    syscall
