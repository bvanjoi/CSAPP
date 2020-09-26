# 2.67

A. because `1<<32` may equal `1` or even not defined.

B. `int beyond_msb = set_msb << 1`;

C.

```cpp
int int_size_is_16() {
    int set_msb = 1 << 15;
    int beyond_msb = set_msb << 1;
    return set_msb && !beyond_msb;
}
```
