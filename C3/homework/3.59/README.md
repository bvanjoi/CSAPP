# 3.59

```cpp
typedef __int128 int128_t;
void store_prod(int128_t *dest, int64_t x, int64_t y) {
    *dest = x * (int128_t)y;
}
```

Gcc generates the following assembly code implementing the computation:

```x86asm
store_prod:
    ; dest in %rdi
    ; x in %rsi
    ; y in %rdx
    movq %rdx, %rax   ; %rax = y
    cqto              ; (int128_t)y
    movq %rsi, %rcx   ; %rcx = x;
    sarq $63, %rcx;   ; %rcx = x >> 63
    imulq %rax, %rcx  ; %rcx = %rcx * y
    imulq %rsi, %rdx  ; y = y * x
    addq %rdx, %rcx   ; %rcx = %rcx + y;
    mulq %rsi         ; %rdx:%rax <= x * y
    addq %rcx, %rdx;
    movq %rax, (%rdi)   ; low  8 bytes
    movq %rdx, 8(%rdi)  ; high 8 bytes
    ret
```
