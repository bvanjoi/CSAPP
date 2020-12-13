# 6.7

```cpp
int sumarray3d(int a[N][N][N]) {
    int i, j, k, sum = 0;
    for (k = 0; k < N; k++) {
        for (i = 0; i < N; i++) {
            for (j = 0; j < N; j++) {
                sum += a[k][i][j];
            }
        }  
    }
    return sum;
}
```
