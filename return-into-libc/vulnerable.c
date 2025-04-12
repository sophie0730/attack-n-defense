#include <stdio.h>
#include <string.h>

void vulnerable_strcat(char *input1, char *input2) {
    char buffer[64];
    buffer[0] = '\0';

    strcat(buffer, input1);
    strcat(buffer, input2);

    printf("Combined input: %s\n", buffer);
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <input1> <input2>\n", argv[0]);
        return 1;
    }

    vulnerable_strcat(argv[1], argv[2]);
    return 0;
}