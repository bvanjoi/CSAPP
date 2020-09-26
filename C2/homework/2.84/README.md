# 2.84

```cpp
return (ux << 1 == 0 && uy << 1 == 0)
    || (sx && !sy)
    || (sx && sy && uxx >= uy)
    || (!sx && !sy && ux <= uy)
```
