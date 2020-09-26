# 2.90

```cpp
// compute 2^x.
float fpwr2(int x) {
    unsigned exp, frac;
    unsigned u;

    if( x < -149) {
        // to small
        exp = 0;
        frac = 0;
    } else if( x < -126) {
        exp = 0;
        frac = 1 << (23 + x + 126);
    } else if ( x < 128) {
        exp = x + 127;
        frac = 0;
    } else {
        exp = 255;
        frac = 0;
    }

    u = exp << 23 | frac;
    return u2f(u);
}
```
