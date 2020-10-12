# 3.9

```x86asm
shift_left4_rightn:
    movq  %rdi, %rax
    salq   $4, %rax
    movl  %esi, %ecx
    sarq  %cl, %rax
```
