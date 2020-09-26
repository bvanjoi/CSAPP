# Data Size

Every computer has a word size, indicating the nominal size of pointer data.

Since a virtual address is encoded by such as word, **the most important system parameter determined by the word size is the maximum size of the virtual address space**. For example, for a machine with w-bit word size, the virtual address can range from 0 to $2^w - 1$, giving the program access to at most $2^w$ bytes.

The C language supports multiple data formats for both integer and floating-point data. And following chart shows the number of bytes typically allocated for different C data types.

| Signed |    Unsigned    | 32-bit | 64-bit|
| -      |    -           | -      | -     |
| [signed] char   | unsigned char  |   1    |   1   |
| short  | unsigned short |   2    |   2   |
| int    | unsigned int   |   4    |   4   |
| long   | unsigned long  |   4    |   8   |
| int32_t| unit32_t       |   4    |   4   |
| int64_t| unit64_t       |   8    |   8   |
| char*  | -              |   4    |   8   |
| float  | -              |   4    |   4   |
| double | -              |   8    |   8   |

Most of the data type encode signed values, unless prefixed by the keyword `unsigned` or using the specific unsigned declaration for fixed-size data types. The exception to this is data type *char*: in many contexts, the program's behavior is insensitive to whether data type *char* is signed or unsigned.

And the chart also shows that **a pointer uses the full word size of the program**.

## Representing Stings

A string in C is encoded by an array of characters terminated by the null(having value 0) character. Each character is represented by some standard encoding, with the most common being the ASCII character code.

There has a practice:[2.7](../../practice/2.7/README.md)
