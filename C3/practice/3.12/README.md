# 3.12

```cpp
void uremdiv(unsigned long x, unsigned long y, unsigned long *qp, unsigned long * rp)
// x  in %rdi
// y  in %rsi
// qp in %rdx
// rp in %rcx
```

result:

```x86asm
uremdiv:
    movq %rdx, %r8
    movq %rdi, %rax
    movq $0, %edx
    cqto
    divq %rsi
    movq %rax, (%r8)
    movq %rdx, (%rcx)
    ret
```
