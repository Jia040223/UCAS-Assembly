.section .data
stringvar:
  .ascii    "0123456789abcdef"
.section .text
.globl _start
_start:
    nop
    movl    $8, %ecx
    movl    $0, %ebx
L1:
    movl    $stringvar, %edx
    movb    (%edx,%ebx,1), %al
    movb    1(%edx,%ebx,1), %ah
    xchgb   %al, %ah
    movb    %al, (%edx,%ebx,1)
    movb    %ah, 1(%edx,%ebx,1)
    addl    $2, %ebx 
    loop L1
#output
    movl    $4, %eax
    movl    $1, %ebx
    movl    $stringvar, %ecx
    movl    $16, %edx
    int    $0x80
#exit
    movl    $1, %eax
    movl    $0, %ebx
    int    $0x80
