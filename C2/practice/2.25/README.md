# 2.25

```cpp
float sum_elements( float a[], unsigned length) {
    int i;
    float result = 0;
    for ( i = 0; i <= length - 1; i++) {
        result += a[i];
    }
    return result;
}
```

The error: if we input the unsigned type `length` as 0, then `length - 1` is the UMax, so the loop will never stop.
