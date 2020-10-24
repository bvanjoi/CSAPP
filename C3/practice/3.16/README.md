# 3.16

A.

```cpp
void cond(long a, long *p) {
    if (p) {
        goto calc;
    }
    else if ( a > *p) {
        goto calc;
    }
    return ;
calc:
    *p = a;
    return ;
}
```

B. Because we used `&&` to combine two condition statements.
