# 3.60

A. `x`: `%rdi`, `n`: `%ecx` and `esi`, `result`:`%eax`, `mask`:`%rdx`.

B. `result` is 0, `mask` is 1.

C. `mask != 0`;

D. `mask <<= n;`

E. `result |= (x & mask);`

F.

```cpp
long loop (long x, int n) {
    // x in %rdi
    // n in %esi
    long result = 0;  
    long mask;
    for (mask = 1; mask != 0; mask <<= n) {
      result |= (x & mask);
    }
    return result;
}
```
