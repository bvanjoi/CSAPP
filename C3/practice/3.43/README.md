# 3.43

| expr                | type   | code                                     |
| -                   | -      | -                                        |
|`up->t1.u`           | long   | `movq (%rdi), %rax` `movq %rax, (%rsi)`  |
|`up->t1.v`           | short  | `movw 8(%rdi), %ax` `movw %ax, (%rsi)`   |
|`&up->t1.w`          | char*  | `leaq 10(%rdi), %rax` `movq %rax, (%rsi)`|
|`up->t2.a`           | int*   | `movq %rdi, (%rsi)` |
|`up->t2.a[up->t1.u]` | int    | `movq (%rdi), %rax` `movl (%rdi, %rsi, 4),%rsi` `movl %eax, (%rsi)`|
|`*up->t2.p`          | char   | `movq 8(%rdi), %rax` `movq (%rax), (%rsi)` |
