# 3.66

```
%r8 <- 4n + 1
%rax <- 3n
n <- %rax;
if (n <= 0) {
  return 0;
} else {
  %r8 <- %r8<<3
  %rcx <- 8j + A
  res <- 0
  i <- 0
  while ( n != i) {
    res <- res + *%rcx
    i <- i + 1
    %rcx <- %rcx + %r8
  }
  return res;
}
```

- NR: `3n`
- NC: `4n+1`
