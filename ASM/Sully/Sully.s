section .data
align 16
	filename:
	db "Sully_%d.s", 0
	compiling:
	db "nasm -f elf64 Sully_%d.s -o Sully_%d.o && gcc Sully_%d.o -o Sully_%d -no-pie", 0
	executing:
	db "./Sully_%d", 0
	format:
	db "... all code %1$c %2$c ...", 0
	open_opt:
	db "w", 0

global main
extern fclose, fopen, snprintf, fprintf, system

main:
mov qword [i], 5
cmp qword [i], -1
jle .end

.namefile:
add rsp, -8
	mov rdi, buff
	mov rsi, buff_size
	mov rdx, filename
	mov rcx, qword [i]
	call snprintf

add rsp, 8
add rsp, -8

.open:
	mov rdi, buff
	mov rsi, open_opt
	call fopen
add rsp, 8
	push rax

.write:
add rsp, -8
	mov rdi, rax
	mov rsi, format
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	mov r9, format
add rsp, -8
	dec qword [i]
	push qword [i]
	call fprintf
	inc qword [i]
add rsp, 16

.close:
pop rax
add rsp, -8
	mov rdi, rax
	call fclose
add rsp, 8

.compile:
add rsp, -8
	mov rdi, buff
	mov rsi, buff_size
	mov rdx, compiling
	mov rcx, qword [i] 
	call snprintf
add rsp, 8
add rsp, -8
	mov rdi, buff
	call system
add rsp, 8

.execute:
add rsp, -8
	mov rdi, buff
	mov rsi, buff_size
	mov rdx, executing
	mov rcx, qword [i] 
	call snprintf
add rsp, 8
add rsp, -8
	mov rdi, buff
	call system
add rsp, 8

.end:
	mov rax, 0
	ret 

section .bss
buff:
	resb 1024
buff_size equ $ - buff
i:
	resq 1


