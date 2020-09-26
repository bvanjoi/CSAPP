/**
 * shows C code that uses casting to access and print the byte representations of different program objects.
 */
#include <stdio.h>

typedef unsigned char *byte_pointer;  // len: 8

/**
 * start: address of a sequence of bytes
 * len:
 */
void show_bytes( byte_pointer start, size_t len) {
    size_t i;
    for( i = 0; i < len; i++) {
        printf("%.2x", start[i]); // $.2x indicates that an interger should be printed in hex.
    }
    printf("\n");
}

void show_int(int x) {
    printf("show_int:\n");
    show_bytes((byte_pointer) &x, sizeof(int));
}

void show_float(float x) {
    printf("show_float:\n");
    show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void* x) {
    printf("show_void*:\n");
    show_bytes((byte_pointer) &x, sizeof(void*));
}

void test_show_bytes(int val) {
    int ival = val;            // len: 4
    float fval = (float) ival; // len: 4
    int* pval = &ival;         // len: 8
    show_int(ival);
    show_float(fval);
    show_pointer(pval);
}

int main() {
    test_show_bytes(0x12345678);
    // the output indicate the byte ordering of your computer.
    return 0;
}
