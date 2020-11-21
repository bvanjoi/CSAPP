# 4.20

```cpp
word srcB = [
    icode in { IMRMOVQ, IRMMOVQ, IOPQ } : rB;
    icode in { IPUSH, IPOP, ICALL, IRET } : RRSP;
    1: RNONE;
]
```
