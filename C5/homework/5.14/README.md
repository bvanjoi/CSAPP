# 5.14

```cpp
void inner4_loop_unrolling(vec_ptr u, vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);

    data_t sum1 = (data_t) 0;
    data_t sum2 = (data_t) 0;
    data_t sum3 = (data_t) 0;
    data_t sum4 = (data_t) 0;
    data_t sum5 = (data_t) 0;
    data_t sum6 = (data_t) 0;

    for (i = 0; i < length; i+=6) {
        sum1 = sum1 + udata[i] * vdata[i];
        sum2 = sum2 + udata[i + 1] * vdata[i + 1];
        sum3 = sum3 + udata[i + 2] * vdata[i + 2];
        sum4 = sum4 + udata[i + 3] * vdata[i + 3];
        sum5 = sum5 + udata[i + 4] * vdata[i + 4];
        sum6 = sum6 + udata[i + 5] * vdata[i + 5];
    }

    for (; i < length; i++) {
        sum1 = sum1 + udata[i] * vdata[i];
    }

    *dest = sum1 + sum2 + sum3 + sum4 + sum5 + sum6;

}
```

A. Because the bound of CPE is 1.0

B. 
