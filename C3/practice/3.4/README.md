# 3.4

we had code:

```c
src_t *sp;
dest_t *dp;
```

and we want implement the operation `*dp = (dest_t) *sp;`.

Assume that the value of `sp` and `dp` are stored in register `%rdi` and `%rsi`, respectively.

| src_t          | dest_t         | instruction |
|   -            |   -            |     -       |
|  long          |  long          | `movq (%rdi), %rax`, `movq %rax, (%rsi)`   |
|  char          |  int           | `movsbl (%rdi), %eax`, `movl %eax, (%rsi)`   |
|  char          |  unsigned      | `movsbl (%rdi), %eax`, `movl %eax, (%rsi)` |
|  unsigned char |  long          | `movzbl (%di), %eax`, `movq %rax, (%rsi)` |
|  int           |  char          | `movl (%rdi), %eax`, `movb %al, (%rsi)` |
|  unsigned      |  unsigned char | `movl (%rdi), %eax`, `movb %al, (%rsi)` |
|  char          |  short         | `mosbw (%rdi), %ax`, `movw %ax, (%rsi)` |
