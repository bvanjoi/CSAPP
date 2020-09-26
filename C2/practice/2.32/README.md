# 2.32

First, please read this function: [tadd_ok](../2.30/README.md).

```cpp
/* Determine whether arguments can be subtracted without overflow */
int tsub_ok(int x, int y) {
    return tadd_ok(x, -y);
}
```

This code has bug, if `x = 0x8000 0000`, `y = 0x8000 0000`, then `-y = 0x8000 0000` also, and the result is `0`, and its overflow.
