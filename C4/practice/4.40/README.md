# 4.40

```python
bool E_bubble =
  (E_icode == IJXX && !e_Cnd) ||
  !(E_icode in { IMRMOVQ, IPOPQ } &&
    E_dstM in { d_srcA, d_srcB }
  );
```
