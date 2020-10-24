# 3.29

A. Will never stop.

B.

```cpp
long sum = 0;
long i;
while(i < 10) {
    if( i & 1) {
        goto update;
    }
    sum += i;
update:
    i++;
}
```
