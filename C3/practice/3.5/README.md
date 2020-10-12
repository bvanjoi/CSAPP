# 3.5

`xp` in `%rdi`, `yp` in `%rsi`, `zp` in `%rdx`.

The c code:

```cpp
void decode1(long* xp, long* yp, long* zp) {
    long x = *xp;
    long y = *yp;
    long z = zp;
    *yp = x;
    *zp = y;
    *xp = z;
    return ;
}
```
