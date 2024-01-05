global _start
section .text

_start:
    jmp main

main:
    mov rax, 0        
    mov rdi, 0       
    mov rsi, user_key 
    mov rdx, 64       
    syscall

    ; Compare the keys
    mov rsi, og_key   
    mov rdi, user_key 
    mov rcx, og_key_length 
    repe cmpsb        
    jne access_denied 

access_granted:
    mov rax, 1       
    mov rdi, 1        
    mov rsi, access_granted_msg 
    mov rdx, access_granted_length 
    syscall
    jmp exit      

access_denied:
    mov rax, 1       
    mov rdi, 1        
    mov rsi, access_denied_msg 
    mov rdx, access_denied_length 
    syscall

exit:
    mov rax, 60    
    xor rdi, rdi      
    syscall

section .data
    access_granted_msg: db "Access granted", 10
    access_granted_length: equ $ - access_granted_msg

    access_denied_msg: db "Access denied", 10
    access_denied_length: equ $ - access_denied_msg

    og_key: db 'youdonthavetoknow'
    og_key_length: equ $ - og_key

section .bss
    user_key: resb 64
