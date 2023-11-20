.section .data
 testdata:
     .byte 'A', '0', 'z', 'P', '8', 'r', 'Z', '2', 'f', 'H'
.section .text
.globl _start
_start:
    movl    $testdata, %ebx
    push    $10
    push    %ebx
    call    insert_sort
#output 
    push    $10
    push    %ebx
    call    as_puts
#exit
    call    as_exit

.globl insert_sort
.type insert_sort, @function
insert_sort:
    push    %ebp
    movl    %esp, %ebp

    push    %ebx
    push    %edi
    movl    $1, %ebx
    movl    8(%ebp), %edi
L1:
    cmpl    12(%ebp), %ebx
    jge     L2
    movb    (%edi,%ebx), %dl
    dec     %ebx
    movl    %ebx, %ecx
    inc     %ebx

L4:
    testl    %ecx, %ecx
    jl      L3
    cmpb    (%edi,%ecx), %dl
    jae     L3
    movb    (%edi,%ecx), %dh
    movb    %dh, 1(%edi,%ecx)
    dec     %ecx
    jmp     L4

L3:
    movb    %dl, 1(%edi,%ecx)
    inc     %ebx
    jmp     L1

L2:
    pop     %edi
    pop     %ebx
    leave
    ret

.globl as_puts
.type as_puts, @function
as_puts:
    push    %ebx
    movl    $4, %eax
    movl    $1, %ebx
    movl    8(%esp), %ecx
    movl    12(%esp), %edx
    int     $0x80
    pop     %ebx
    ret

.globl as_exit
.type as_exit, @function
as_exit:
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80
