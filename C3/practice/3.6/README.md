# 3.6

| Instruction                   | Result     |
|      -                        |   -        |
| `leaq 6(%rax), %rdx`          | x + 6      |
| `leaq (%rax, %rcx), %rdx`     | x + y      |
| `leaq (%rax, %rcx, 4), %rdx`  | x + 4y     |
| `leaq 7(%rax, %rax, 8), %rdx` | 9x + 7     |
| `leaq 0xA(, %rcx, 4), %rdx`   | 4y + 10    |
| `leaq 9(%rax, %rcx, 2), %rdx` | x + 2y + 9 |
