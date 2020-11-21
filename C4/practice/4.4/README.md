# 4.4

```x86asm
;long rsum(long *start, long count)
; start in %rdi, count in %rsi

rsum:
    xorq %rax, %rax
    andq %rsi, %rsi
    jle .L2
    pushq %rbx
    mrmovq (%rdi), %rbx
    irmovq $1, %r8
    irmovq $8, %r9
    subq %r8, %rsi ; count--
    addq %r9, %rdi ; start++
    call rsum
    addq %rbx, %rax
    popq %rbx
.L2:
    ret

```
