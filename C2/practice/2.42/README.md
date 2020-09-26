# 2.42

```cpp
int div16(int x){
    int sign = (x >> 31) ; // if x < 0 then sign is 0xFFFFFFFF;
    int bias = sign & 0xF;
    return (x + bias) >> 4;
}
```
