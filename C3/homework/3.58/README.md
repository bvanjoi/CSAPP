# 3.58

```cpp
long decode2(long x, long y, long z) {
  // x in %rdi, y in %rsi, z in %rdx
  y -= z;
  x *= y;
  return (y<<63>>63) ^ x;
}
```
