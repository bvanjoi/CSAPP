# 4.12

```HCL
word Median = [
    A <= B && B <= C : B;
    C <= B && B <= A : B;
    A <= C && C <= B : C;
    B <= C && C <= A : C;
    1                : A;
]
```
