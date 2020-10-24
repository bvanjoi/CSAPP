# 3.17

A.

```cpp
void goto_absdiff_se(long x, long y) {
    long t = x - y;
    if( t >= 0) {
        goto x_ge_y;
    }
    lt_cnt++;
    result = y - x;
    goto done;
x_ge_y:
    ge_cnt++;
    result = x - y;
done:
    return result;
}
```

B. The choice is arbitrary.
