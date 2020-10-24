# 3.46

Type in string: `0123456789012345678901234`.

A.

| diagram | description|
| - | - |
|00 00 00 00 00 40 00 76| return address|
|01 23 45 67 89 AB CD EF|               |
|00 00 00 00 00 00 00 00|               |
|00 00 00 00 00 00 00 00| %rsp          |

B.

| diagram | description|
| - | - |
|00 00 00 00 00 40 00 34| return address|
|33 32 31 30 39 38 37 36|               |
|35 34 33 32 31 30 39 38|               |
|37 36 35 34 33 32 31 30| %rsp          |

C. `0x400034`.

D. `%rbx`.

E. `result = malloc(strlen(buf));` ->`result = malloc(strlen(buf) + 1);`
