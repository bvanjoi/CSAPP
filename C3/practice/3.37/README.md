# 3.37

```cpp
short S[];  // %rdx
long i;     // %rcx
```

| Expression  | Type      | Value          | Assembly code                |
| -           | -         | -              | -                            |
| S + 1       | `short*`  | x + 2          | `leaq 2(%rdx), %rax`         |
| S[3]        | `short`   | M[x + 6]       | `movw 6(%rdx), %ax`          |
| &S[i]       | `short*`  | x + 2 * i      | `leaq (%rdx,%rcx,2), %rax`   |
| S[4*i+1]    | `short`   | M[x+8*i+2]     | `movw 2(%%rdx,%rcx,8),%ax`   |
| S + i - 5   | `short*`  | x + 2 * i - 10 | `leaq -10(%%rdx,%rcx,2),%rax`|
