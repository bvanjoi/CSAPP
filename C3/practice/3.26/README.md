# 3.26

A. `jmp`

B.

```cpp
long fun_a(unsigned long x) {
    long val = 0;
    while(x) {
        val = x ^ val;
        x = x >> 1;
    }
    return val & 1;
}
```

C. Even or odd number fo one.
