# 4.33

```x86asm
                      ; cycle  0  1  2  3  4  5  6  7  8  9  10
irmovq $5, %rdx       ;        F  E  D  M  W
irmovq $0x100, %rsp   ;           F  E  D  M  W
rmmovq %rdx,0(%rsp)   ;              F  E  D  M  W
popq %rsp             ;                 F  E  D  M  W
nop                   ;                    F  E  D  M  W
nop                   ;                       F  E  D  M  W
rrmovq %rsp, %rax     ;                          F  E  D  M   W
```

If the two cases were reversed, then the register `%rax` will be set to the incremented program counter rather than the value read from memory.
