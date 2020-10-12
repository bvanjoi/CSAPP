# 3.3

1. can't use %ebx as address register.
2. %rax is 64-bit, so we need `movq`
3. Can't memory to memory.
4. No register named %sl.
5. The destination can't be a immediate.
6. Destination operand incorrect size.
7. movb -> movw
