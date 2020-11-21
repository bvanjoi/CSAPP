# 4.2

A.

```x86asm
irmovq $-4, %rbx
rmmovq %rsi, 0x800(%rbx)
halt
```

B.

```x86asm
pushq %rsi
call 0x20c
halt
irmovq $10, %rbx
ret
```

C.

```x86asm
mrmovq 0x7(%rbp), %rbp
nop
.byte f0  ; invalid byte
pop %rcx
```

D.

```x86asm
subq %rcx, %rbx
je 0x400
halt
```

E.

```x86asm
xorq %rsi, %rdx
.byte a0f0 ; invalid byte
```
