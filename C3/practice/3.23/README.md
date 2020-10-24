# 3.23

A.

| register | values |
| -        |   -    |
| `%rax`   |  `x`   |
| `%rcx`   |  `y`   |
| `%rdx`   |  `n`   |

B. `leap 1(%rcx, %rax), %rax`.

C.

```x86asm
dw_loop:
    movq %rdi, %rax          // Copy x to %rax
    movq %rdi, %rcx
    imulq %rdi, %rcx         // y = x * x;
    leap (%rdi,%rdi), %rdx
.L2:
    leaq 1(%rcx, %rax), %rax // x = x + y + 1;
    subq $1, %rdx            // n = n - 1;
    testq %rdx, %rdx         // Test n
    jg .L2                   // if n > 0, go .L2
    rep; ret
```
