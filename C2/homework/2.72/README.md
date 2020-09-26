# 2.72

A. Because `maxbytes-sizeof(val)` always return `unsigned` type, so the `memcpy` will exe anytime.

B. `if(maxbytes - int(sizeof(val)) >= 0)`
