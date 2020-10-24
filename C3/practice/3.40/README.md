# 3.40

```cpp
void fix_set_diag_opt(fix_martix A, int val) {
    int* Aptr = &A[0][0];
    int* Aend = &A[N][N];
    do {
      *Aptr = val;
      Aptr += N + 1;
    } while (Aptr != Aend);
}
```
