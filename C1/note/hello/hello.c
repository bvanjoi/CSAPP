#include <stdio.h>

int main() {
  printf("hello, world\n");
  return 0;
}

/**
 * hello pargram life:
 *                                                                                          printf.o --|
 *                pre-processor               compiler                      assembler                  |--> linker
 *    hello.c    -------------->   hello.i   ---------->     hello.s      -------------->    hello.o    ------------>   hello
 * (source file)                ( modified              (assembly program)               ( relocatable               ( executable
 *                               source file )                                            object programs )          object programs )
 *                                                                                           (binary)                   (binary)
 * 
 * - Preprocessing phase: modifies the original C program according to directives thar begin with the '#' character, and result is another C program, typically with the .i suffix.
 * 
 * - Compilation phase: translate .i to .s, which is an assembly-language program.
 *                      Assembly language is useful because it provides a common output language for different compilers for different hight-level languages.  
 *
 * - Assembly phase: translate .i to .o, which is mechine-language instructions, but it only contains main function(so hello.o contain gibberish text).
 *
 * - Linking phase: merging other .o files.
 * 
 * */ 


/**
 * GCC instance:
 * 
 * 1. -------------
 * gcc hello.c 
 * ---------------- default ouput an executable file named a.out
 *
 * 2. -------------
 * gcc hello.c -o hello
 * ---------------- output an executable file named hello
 * 
 * 3. -------------
 * gcc -E hello.c -o hello.i
 * ---------------- preprocessing and output a file named hello.i
 * 
 * 4. -------------
 * gcc -S hello.i
 * ---------------- translate hello.i to hello.s
 * 
 * 5. -------------
 * gcc -c hello.s
 * ---------------- translate hello.s to hello.o
 * 
 * 6. -------------
 * gcc hello.o -o hello2
 * ---------------- translate hello.o to an executable file named hello2
 * 
 * 7. -------------
 * gcc -O1 hello.c -o hello3
 * ---------------- open O1 optimizer
 * */
