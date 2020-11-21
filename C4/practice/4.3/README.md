# 4.3

```x86asm
;long sum(long *start, long count)
; start in %rdi, count in %rsi

sum:
    xorq %rax, %rax
    andq %rsi, %rsi
    jmp test
loop:
    mrmovq (%rdi), %r10
    addq %r10, %rax
    iaddq $8, %rdi
    iaddq $-1, %rsi
test:
    jne loop
    ret
```
