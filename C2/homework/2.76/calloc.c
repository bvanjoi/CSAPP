#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <stdint.h>

void* calloc(size_t nmemb, size_t size) {
    if (!nmemb || !size) {
        return NULL;
    }
    if( nmemb == nmemb * size / size) {
        return memset(malloc(nmemb * size), 0, nmemb * size);
    }
    return NULL;
}

int main(){
    return 0;
}