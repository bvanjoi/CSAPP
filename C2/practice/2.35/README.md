# 2.35

```cpp
/* Determine whether arguments can be multiplied without overflow */
int tmult_ok(int x, int y) {
    int p = x * y;
    return !x || p/x == y;
}
```

1. For x and y such that $TMin \le x,y \le TMax$: $x *y = U2T(( x* y ) mod 2^w) = p + t * 2^w$, if positive overflow, $ t = -1$, else if negative overflow, $t = 1$.
2. $r$ is remainder.
3. if $q$ equal $y$, then $x*y - t*2^w = x *y + r$, then $r + t*w^ = 0$, And $|r|< |x| < 2^w$, so $t=0$, then $r=0$.
