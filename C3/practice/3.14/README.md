# 3.14

```cpp
int test(data_t a) {
    return a TEST 0;
}
```

| order | `data_t`                      | `COMP` |
| -     |  -                            | -      |
| A     |  `long`                       | `>=`   |
| B     |  `short` or `unsigned short`  | `==`   |
| C     |  `unsigned char`              | `>`    |
| D     |  `int`                        | `<=`   |
