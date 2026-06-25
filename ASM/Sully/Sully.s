section .data
align 16
	filename:
	db "Sully_%d.s", 0
	compiling:
	db "nasm -f elf64 Sully_%1$lld.s -o Sully_%1$lld.o && gcc Sully_%1$lld.o -o Sully_%1$lld -no-pie", 0
	executing:
	db "./Sully_%d", 0
	format:
	db "section .data%1$calign 16%1$c	filename:%1$c	db %2$cSully_%%d.s%2$c, 0%1$c	compiling:%1$c	db %2$cnasm -f elf64 Sully_%%1$lld.s -o Sully_%%1$lld.o && gcc Sully_%%1$lld.o -o Sully_%%1$lld -no-pie%2$c, 0%1$c	executing:%1$c	db %2$c./Sully_%%d%2$c, 0%1$c	format:%1$c	db %2$c%3$s%2$c, 0%1$c	open_opt:%1$c	db %2$cw%2$c, 0%1$c%1$csection .text%1$cglobal main%1$cextern fclose, fopen, snprintf, fprintf, system%1$c%1$cmain:%1$cmov qword [i], %5$d%1$ccmp qword [i], -1%1$cjle .end%1$c%1$c.namefile:%1$cadd rsp, -8%1$c	mov rdi, buff%1$c	mov rsi, buff_size%1$c	mov rdx, filename%1$c	mov rcx, qword [i]%1$c	call snprintf%1$cadd rsp, 8%1$c%1$c.open:%1$cadd rsp, -8%1$c	mov rdi, buff%1$c	mov rsi, open_opt%1$c	call fopen%1$cadd rsp, 8%1$c	push rax%1$c%1$c.write:%1$cadd rsp, -8%1$c	mov rdi, rax%1$c	mov rsi, format%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, format%1$c	dec qword [i]%1$c	push qword [i]%1$c	call fprintf%1$c	inc qword [i]%1$cadd rsp, 16%1$c%1$c.close:%1$cpop rax%1$cadd rsp, -8%1$c	mov rdi, rax%1$c	call fclose%1$cadd rsp, 8%1$c%1$c.compile:%1$cadd rsp, -8%1$c	mov rdi, buff%1$c	mov rsi, buff_size%1$c	mov rdx, compiling%1$c	mov rcx, qword [i]%1$c	call snprintf%1$cadd rsp, 8%1$cadd rsp, -8%1$c	mov rdi, buff%1$c	call system%1$cadd rsp, 8%1$c%1$c.execute:%1$cadd rsp, -8	%1$cmov rdi, buff%1$c	mov rsi, buff_size%1$c	mov rdx, executing%1$c	mov rcx, qword [i]%1$c	call snprintf%1$cadd rsp, 8%1$cadd rsp, -8%1$c	mov rdi, buff%1$c	call system%1$cadd rsp, 8%1$c%1$c.end:%1$c	mov rax, 0%1$c	ret%1$c%1$csection .bss%1$cbuff:%1$c	resb 1024%1$cbuff_size equ $ - buff%1$ci:%1$c	resq 1", 0
	open_opt:
	db "w", 0

section .text
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

.open:
add rsp, -8
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
	mov rcx, 34
	mov r8, format
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
