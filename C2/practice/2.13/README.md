# 2.13

From above discuss, we know:

|x|m|bis|bic|
|-|-|  -|  -|
|0|0|  0|  0|
|0|1|  1|  0|
|1|0|  1|  1|
|1|1|  1|  0|

So:

A. bool_or: `result = bis(x,y)`.

B. bool_xor: `result = bis( bic(x,y), bic(y,x))`.
