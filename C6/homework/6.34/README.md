# 6.34

> hits:
>
> b1 : src[0][] src[2][] dst[0][] dst[2][]
>
> b2 : src[1][] src[3][] dst[1][] dst[3][]

`dst` array:

|       | Col.0 | Col.1 | Col.2 | Col.3 |
| -     | -     | -     |  -    |   -   |
| Row 0 |  m    | m     |  m    |   m   |
| Row 1 |  m    | m     |  m    |   m   |
| Row 2 |  m    | m     |  m    |   m   |
| Row 3 |  m    | m     |  m    |   m   |

`src` array:

|       | Col.0 | Col.1 | Col.2 | Col.3 |
| -     | -     | -     |  -    |   -   |
| Row 0 |  m    | m     |  h    |   m   |
| Row 1 |  m    | h     |  m    |   h   |
| Row 2 |  m    | m     |  h    |   m   |
| Row 3 |  m    | h     |  m    |   h   |
