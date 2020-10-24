# 3.32

|Label | PC         | Instruction            | `%rdi`| `%rsi`| `%rax`| `%rsp`           | `*%rsp`  | Description      |
| -    | -          | -                      | -     | -     | -     | -                | -        | -                |
| M1   | 0x400560   | `callq 400548`         | 10    | -     | -     | 0x7fffffffe820   | -        | call `first(10)` |
| F1   | 0x400548   | `lea 0x1(%rdi), %rsi`  | 10    | -     | -     | 0x7fffffffe818   | 0x400565 | `x + 1`          |
| F2   | 0x40054c   | `sub $0x1, %rdi`       | 10    | 11    | -     | 0x7fffffffe818   | 0x400565 | `x - 1`          |
| F3   | 0x400550   | `callq 400540`         |  9    | 11    | -     | 0x7fffffffe818   | 0x400565 | call `last(9,11)`|
| L1   | 0x400540   | `mov %rdi, %rax`       |  9    | 11    | -     | 0x7fffffffe810   | 0x400555 | `u = 9`          |
| L2   | 0x400543   | `imul %rsi, %rax`      |  9    | 11    | 9     | 0x7fffffffe810   | 0x400555 | `u = 9 * 11`     |
| L3   | 0x400547   | `retq`                 |  9    | 11    | 99    | 0x7fffffffe810   | 0x400555 | `return`         |
| F4   | 0x400555   | `repz retq`            |  9    | 11    | 99    | 0x7fffffffe818   | 0x400565 | `return`         |
| M2   | 0x400565   | `mov %rax, %rdx`       |  9    | 11    | 99    | 0x7fffffffe820   | -        |  99 -> %rdx     |
