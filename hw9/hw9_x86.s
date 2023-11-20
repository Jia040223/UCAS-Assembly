.section .data
    test : .asciiz "hello world"
.section .text
.globl __start
__start:
    addi  $v0, $0, 4004
    addi  $a0, $0, 1
    la    $a1, test
    addi  $a2, $0, 11
    syscall

    addi $v0, $0, 4001
    addi $a0, $0, 0
    syscall