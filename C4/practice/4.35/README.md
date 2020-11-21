# 4.35

```x86asm
irmovq $0x123, %rax
irmovq $0x321, %rdx
xorq %rcx, %rcx
cmovne %rax, %rdx
add  $rdx, %rdx
halt
```
