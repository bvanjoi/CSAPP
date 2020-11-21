# 4.38

```x86asm
    irmovq mem, %rbx
    mrmovq 0(%rbx), %rsp
    ret
    halt
rtnpt:
    irmovq $5, %rsi
    halt

.pos 0x40
mem: .quad stack
.pos 0x50
stack: .quad rtnpt
```
