#include <stdio.h>
#include <string.h>

void vulnerable_function() {
    char buffer[64];
    printf("Input: ");
    printf("buffer addr = %p\n", buffer);  
    gets(buffer);  /* 使用 gets 而不是 fgets */
    printf("Buffer = %s\n", buffer); 
}

int main() {
    vulnerable_function();
    return 0;
}