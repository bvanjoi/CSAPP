# 3.51

| $T_x$   | $T_y$   | Instructions |
|  -      |   -     |      -       |
| `long`  | `double`| `vcvtsi2sdq %rdi, %xmm0`|
| `double`| `int`   | `vcvtsd2si %xmm0, %eax` |
| `double`| `float` | `vunpcklpd %xmm0, %xmm0, %xmm0`, `vcvtpd2ps %xmm0, %xmm0`|
| `long`  | `float` | `vcvtsi2ssq %rdi, %xmm0, %xmm0` |
| `float` | `long`  | `vcvtss2siq %xmm0, %rax`|
