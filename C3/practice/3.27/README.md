# 3.27

```cpp
long fact_for_goto(long n) {
    long i = 2;
    long result = 1;
    if (n <= 1) {
        goto done;
    }
loop:
    result = result * i;
    i++;
    if (i <= n) {
        goto loop;
    }
done:
    return result;
}
```
