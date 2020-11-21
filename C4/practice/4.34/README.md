# 4.34

```python
word d_valB = [
    d_srcB == e_dstE : e_valE;  # Forward valE from execute
    d_srcB == M_dstM : m_valM;  # Forward valM from memory
    d_srcB == M_dstE : M_valE;  # Forward valE from memory
    d_srcB == W_dstM : W_valM;  # Forward valM from write back
    d_srcB == W_dstE : W_valE;  # Forward valE from write back
    1 : d_rvalB;
]
```
