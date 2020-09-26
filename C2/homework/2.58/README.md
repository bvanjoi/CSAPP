# 2.58

You can run [is_little_endian](./is_little_endian.c)

```cpp
#include <stdio.h>

int main(){
    int num = 0x01;
    printf("%x", ((char*)&num)[0]);
    return ((char*)&num)[0];
}
```

If your computer is little-endian, then `num` insides of computer is `0x01 00 00 00`. else if is big-endian, it's `0x00 00 00 01`.

So we just need judge the first number in memory.
