# 2.30

```cpp
/* Determine whether arguments can be added without overflow */
int tadd_ok(int x, int y) {
    if (x > 0 && y > 0 && x + y < x ) {
      return 0;
    } else if( x < 0 && y < 0 && x + y > x) {
      return 0;
    }
    return 1;
}
```
