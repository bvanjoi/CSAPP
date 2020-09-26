# 2.27

```cpp
/* return 1 if argument s and y can be added without causing overflow. */
int uadd_ok(unsigned x, unsigned y) {
    return x + y >= x;
}
```
