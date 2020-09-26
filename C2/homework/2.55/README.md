# 2.55

First, you should look at [show_bytes](../../note/storage/show_bytes.c).

And then:

`uname -mr` is `19.6.0 x86_64`

compile `gcc show_bytes.c -o show_bytes`.

run `./show_bytes`.

output:

```
show_int:
78563412
show_float:
b4a2914d
show_void*:
38050deafe7f0000
```

My computer is *Little endian*.
