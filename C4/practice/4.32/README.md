# 4.32

```x86asm
                      ; cycle  0  1  2  3  4  5  6  7  8
irmovq $5, %rdx       ;        F  E  D  M  W
irmovq $0x100, %rsp   ;           F  E  D  M  W
rmmovq %rdx,0(%rsp)   ;              F  E  D  M  W
popq %rsp             ;                 F  E  D  M  W
rrmovq %rsp, %rax     ;                    F  E  D  M  W
```

If the two cases were reversed, then the write back from `M_valE` would take priority, causing the incremented stack pointer to be passed as the argument to the `rrmovq` instruction. 
