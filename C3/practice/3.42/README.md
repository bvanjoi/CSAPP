# 3.42

A.

```cpp
struct ELE {
    long v;
    struct ELE *p;
}

long fun(struct ELE *ptr) {
    long res = 0;
    while (ptr) {
        res += ptr->v;
        ptr = ptr->p;
    }
    return res;
}
```

B. the sum of single link.
