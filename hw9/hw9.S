.section .data
    test : .asciiz "hello world"
.section .text
.globl __start
__start:
    lui  $4, 0x0
    addi $4, $4, 0x0 
    
    sub $sp, $sp, 24
    addi $t0, $sp, 11 #$t0 : pointer
    
    sb  $0, 0($t0)
    

L2: 
    addi $t0, $t0, -1
    addi $t2, $0, '0'
    sb   $t2, 0($t0)
    addi $a2, $0, 1
    addi $a1, $t0, 0

L3:
    addi $v0, $0, 4004
    addi $a0, $0, 1
    syscall

    addi $sp, $sp, 24
    nop

    addi $v0, $0, 4001
    addi $a0, $0, 0
    syscall
