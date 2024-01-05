global _start

section .text

_start:
     mov rax,1
     mov rdi,1
     mov rsi,welcome
     mov rdx,welcomelength
     syscall

user_input:
           
           mov rax,0
           mov rdi,0
           mov rsi,input
           mov rdx,100
           syscall
           mov rbx,rax

priting_hello:
             
             mov rax,1
             mov rdi,1
             mov rsi,hello
             mov rdx,hellolength
             syscall

priting_userintput:
                  
                  mov rax,1
                  mov rdi,1
                  mov rsi,input
                  mov rdx,rbx
                  syscall   

exit_program:
     mov rax,60
     mov rdi,23
     syscall



section .data
 welcome: db'Enter you name:'
 welcomelength: equ $-welcome
 hello:db' hello, '
 hellolength: equ $-hello


section .bss
   
   input:resb 100 ;resb(reverse 100  btyes)
