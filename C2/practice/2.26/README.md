# 2.26

```cpp
size_t strlen(const char *s);

int strlonger(char *s, char *t) {
  return strlen(s) - strlen(t) > 0;
}
```

`size_t` is defined via `typeof` to be `unsigned`. Find bug of the function `strlonger`.

A.  when `strlen(s) < strlen(t)`.
B.  the sub of type `unsgned` is always greater or equally 0.
C.

```cpp
int strlonger(char *s, char *t) {
  return strlen(s) > strlen(t);
}
```
