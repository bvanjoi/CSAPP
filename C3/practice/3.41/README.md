# 3.41

A.

- p: 0
- s.x: 8
- s.y: 12
- next: 16

B. 24.

C.

```cpp
void sp_init(struct prob *sp) {
    sp->s.x = sp->s.y;
    sp->p = &(sp->s.x);
    sp->next = sp;
}
```
