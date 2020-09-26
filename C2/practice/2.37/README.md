# 2.37

Illustration of code vulnerability similar to that found in XDR library.

And `size_t` and `int` are 32 bits.

```cpp
void* copy_elements( void *ele_src[], int ele_cnt, size_t ele_size) {
    /**
     * Allocate buffer for ele_cnt objects, each of ele_size bytes
     * and copy from locations designated by ele_src
     */
     void *result = malloc(ele_cnt * ele_size);
     if (result == NULL) {
         /* malloc failed */
         return NULL;
     }
     void *next = result;
     int i;
     for ( i = 0; i < ele_cnt; i++) {
         /* Copy object i to destination */
         memcpy(next, ele_src[i], ele_size);
         /* Move pointer to next memory region */
         next += ele_size;
     }
     return result;
}
```

And your replace the original call to `malloc` as floows:

```cpp
uint64_t asize = ele_cnt * (uint64_t) ele_size;
void *result = malloc(asize);
```

A. No, because the `malloc` return `size_t` which is 32-bits.

B. add check overflow code:

```cpp
uint64_t asize = ele_cnt * (uint64_t) ele_size;
if( asize != (size_t)asize) {
  return NULL;
}
void *result = malloc(asize);
```
