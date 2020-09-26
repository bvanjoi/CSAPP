#include <stdio.h>

int main(){
    int num = 0x01;
    printf("%x", ((char*)&num)[0]);
    return ((char*)&num)[0];
}