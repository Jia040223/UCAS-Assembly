.section .data
.section .text
.globl _start
_start:
    push $0xffffffff
    call print_signed_hex
#exit
    call    as_exit

.globl print_signed_hex
.type print_signed_hex, @function
print_signed_hex:
    push %ebp
    movl %esp, %ebp
    subl $32, %esp
    movl %ebx, 16(%esp)
    movl %edi, 20(%esp)  
    movl %esi, 24(%esp)

    movl 8(%ebp), %ecx

    movl %esp, %edi

    lea 10(%esp), %eax
    lea 3(%esp), %ebx

    testl %ecx, %ecx
    push %ecx
    jge L1
    not %ecx
    inc %ecx
    movl $11, %esi
    jmp L2
L1:
    movl $10, %esi
L2:
    movl %ecx, %edx
    andb $0xf, %dl
    cmpb $10, %dl
    jb L3
    addb $0x57, %dl
    jmp L4
L3:
    orb $0x30, %dl
L4:
    movb %dl,(%eax)
    dec %eax
    shrl $4, %ecx
    cmpl %ebx, %eax
    jae L2

    lea 10(%edi), %eax
L5:
    movb (%ebx), %dl
    cmpb $'0', %dl
    jne L6
    inc %edi
    dec %esi
    inc %ebx
    cmpl %ebx, %eax
    ja L5
L6:
    pop %ecx
    testl %ecx, %ecx
    jge L7
    movb $'-', 0(%edi)
    movb $'0', 1(%edi)
    movb $'x', 2(%edi)
    movb $0, 11(%edi)
    jmp L8
L7:
    movb $'0', 1(%edi)
    movb $'x', 2(%edi)
    movb $0, 11(%edi)
    inc %edi
L8:
    movl    $4, %eax
    movl    $1, %ebx
    movl    %edi, %ecx
    movl    %esi, %edx
    int  $0x80

    movl 16(%esp), %ebx
    movl 20(%esp), %edi
    movl 24(%esp), %esi

    leave
    ret

.globl as_exit
.type as_exit, @function
as_exit:
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80
