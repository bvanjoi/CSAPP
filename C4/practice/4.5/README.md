# 4.5

```x86asm
;long abssum(long *start, long count)
; start in %rdi, count in %rsi

abssum:
    irmovq: $8, %r8
    irmovq: $1, %r9
    xorq %rax, %rax
    andq %rsi, %rsi
    jmp test
loop:
    mrmovq (%rdi), %r10
    xorq %r11, %r11
    subq %r10, %r11
    jle pos
    rrmovq %r11, %r10
pos:
    addq %r10, %rax
    addq %r8, %rdi
    subq %r9, %rsi
test:
    jne loop
    ret
```
