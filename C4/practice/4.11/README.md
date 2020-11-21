# 4.11

```HCL
word Min = [
    A <= B && A <= C : A;
    B <= C           : B;
    1                : C;
]
```
