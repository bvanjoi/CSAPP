# 3.67

A. before calling `process`.

```
|stack|
| ... |
|  z  |
| &z  |
|  y  |
|  x  |  <- %rsp
```

B. The first address of `s`, `%rsp + 64`.

C. `%rsp + offset`

D. `u[0]` in `%rdi`, `u[1]` in `%rdi + 8`, `y` in `%rdi + 16`, and return `%rdi`.

E. return from `process`.

```
|stack|
| ... |
|  z  |
|  x  |  
|  y  |   <- %rdi
| ... |
|  z  |
| &z  |
|  y  |
|  x  |  `eval`'s %rsp
|     |  `process`'s %rsp
```

F. The stack address.
