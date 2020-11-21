# 4.25

```cpp
word mem_data = [
    icode in { IRMMOVQ, IPUSHQ } : valA;
    icode == iCALL : valP;
]
