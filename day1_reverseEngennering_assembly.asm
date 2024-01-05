global _start

section .text
_start:
      ;print hello world
     mov rax,1;write syscall
     mov rdi,1;fd->1(output)
     mov rsi,hello ;buf->hello world
     mov rdx,11 ;count->11
     syscall
     ;exit
     mov rax,60 ;exit syscall
     mov rdi,23 ;status code 23
     syscall 

section .data
   hello: db 'hello world'
