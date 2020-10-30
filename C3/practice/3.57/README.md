# 3.57

```cpp
double funct3(int* ap, double b, long c, float *dp) {
  // ap in %rdi, b in %xmm0, c in %rsi, dp in %rdx
  if (b >= *ap) {
    return *dp * 2 + c;
  } else {
    return *dp * c;
  }
}
```
