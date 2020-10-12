# Chapter3: Machine-Level Representation of Programs

Even though compilers do most of the work in generating assembly code, being able to read and understand it is an important skill for serious programmers.

Some reasons:

- get a sense of how efficiently the program will run.
- when writing concurrent programs using a thread package, it's important to understand how program data are shared or kept private by the different threads and precisely how and where shared data are accessed.
- how to guard against malware.

sections:

- [Program Encodings](./encodings/README.md)
- [Data Formats](./formats/README.md)
- [Operations](./operations/README.md)
