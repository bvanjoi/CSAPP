# 2.7

First, please read the c file: [show_bytes](../../note/storage/show_bytes.c)

```cpp
const char* s = "abcdef";
show_bytes( (byte_pointer) s, strlen(s));
```

output: 0x61 62 63 64 65 66.

Recall that the library routine `strlen` dose not count the terminating null character, and so `show_bytes` printed only through the character 'f'.
