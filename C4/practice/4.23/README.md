# 4.23

```cpp
word aluB = [
    icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL, IPUSHQ, IRET, IPOQ } : valB;
    icode in { IRRMOVQ, IIRMOVQ } : 0;
]
```
