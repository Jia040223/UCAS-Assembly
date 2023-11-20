.section .data
iostring:
  .asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl _start
_start:
    movl    $0, %ecx
    movl    $iostring, %edx
Loop1:
    movb    (%edx,%ecx), %al
    inc     %ecx
    cmpb    $122, %al
    ja Loop2
    cmpb    $97, %al
    jb Loop2
    subb    $32, %al
    movb    %al, -1(%edx,%ecx)
Loop2:
    cmpl    $20, %ecx
    jbe     Loop1

#output
    movl    $4, %eax
    movl    $1, %ebx
    movl    $iostring, %ecx
    movl    $20,%edx
    int    $0x80
#exit
    movl    $1, %eax
    movl    $0, %ebx
    int    $0x80
