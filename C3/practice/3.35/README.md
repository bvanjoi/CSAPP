# 3.35

```cpp
long rfun(unsigned long x) {
    if (x == 0) {
        return x;
    }
    unsigned long nx = x>>2;
    long rv = rfun(nx);
    return rv + x;
}
```
