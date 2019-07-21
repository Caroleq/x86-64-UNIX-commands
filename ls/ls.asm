BITS 64

SECTION .text
    space db ' '
    lf db 10

GLOBAL _start
_start:
    mov rax, 2
    mov rdi, [rsp+8*2]          
    mov rsi, 0
    mov rdx, 0
    syscall
    
    mov rdi, rax
    mov rdx, 20000
    sub rsp, rdx
    mov rsi, rsp
    mov rax, 78
    syscall             
    
    mov r14, rax
    mov r13, rsp
    mov r15, 0        
    
.outer_loop:
    cmp r15, r14
    jge .after_outer_loop
    mov rbx, r13
    add rbx, r15
    add rbx, 16
    mov r12, [rbx] 
    and r12, 0x000000000000ffff
    add rbx, 2
    mov rdx, r12
    sub rdx, 20
    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    syscall

    add r15, r12
    
.after_cmp:
    mov rdx, 1             
    mov rax, 1
    mov rdi, 1
    mov rsi, lf
    syscall
    jmp .outer_loop

.after_outer_loop
    mov rax, 60             
    mov rdi, 0
    syscall
 
.fail
    mov rdi, r12
    mov rax, 60
    syscall    
