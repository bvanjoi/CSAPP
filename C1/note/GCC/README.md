# GUN and GCC

GNU is short for GNU's Not Unix.

The GUN environment includes the EMACS editor, GCC compiler, GDB debugger, assembler, linker, utilities for manipulating binaries, and other components.

The GCC compiler has grown to support many different languages, with the ability to generate code for many different machines. Supported languages include C, C++, Fortran, Java, Pascal, Objective-C and Ada.

## usage

Firstly, you need enter `gcc --version` in Terminal to check is weather installed.

And the general usage is: `gcc(option) (parameters)`

option list;

```
-o: to specify the output filename
-E: only preprocessing
-S: translate .c to .s
-wall: show warnings
-c: do not linking, and only compiler
```

## instance

[GCC instance](../hello/hello.c)
