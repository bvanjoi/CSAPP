# 2.36

```cpp
/* Determine whether arguments can be multiplied without overflow */
int tmult_ok(int32_t x, int32_t y) {
    int64_t p = x * y;
    return !((p >= ((1<<31) - 1)) || (p < 1<<31)) ;
}
```

or other solution:

```cpp
/* Determine whether arguments can be multiplied without overflow */
int tmult_ok(int32_t x, int32_t y) {
    int64_t p = x * y;
    return p == (int32_t)p;
}
```
