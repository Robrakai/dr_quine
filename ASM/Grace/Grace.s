;comment
section .data
filename db "Grace_kid.s", 0
code db ";comment%1$csection .data%1$cfilename db %2$cGrace_kid.s%2$c, 0%1$ccode db %2$c%3$s%2$c, 0%1$csection .bss%1$cfd resq 1%1$csection .text%1$cglobal _start%1$cextern dprintf%1$c%1$c%%macro OPEN_FILE 0%1$cmov rax, 2%1$cmov rdi, filename%1$cmov rsi, 0x241%1$cmov rdx, 420%1$csyscall%1$c%%endmacro%1$c%1$c%%macro DPRINTF 5%1$cmov rdi, %%1%1$cmov rsi, %%2%1$cmov rdx, %%3%1$cmov rcx, %%4%1$cmov r8, %%5%1$cxor eax, eax%1$ccall dprintf%1$c%%endmacro%1$c%1$c%%macro CLOSE_FILE 1%1$cmov rax, 3%1$cmov rdi, %%1%1$csyscall%1$c%%endmacro%1$c%1$c_start:%1$cOPEN_FILE%1$cmov [fd], rax%1$cDPRINTF [fd], code, 10, 34, code%1$cCLOSE_FILE [fd]%1$cmov rax, 60%1$cxor rdi, rdi%1$csyscall", 0
section .bss
fd resq 1
section .text
global _start
extern dprintf

%macro OPEN_FILE 0
mov rax, 2
mov rdi, filename
mov rsi, 0x241
mov rdx, 420
syscall
%endmacro

%macro DPRINTF 5
mov rdi, %1
mov rsi, %2
mov rdx, %3
mov rcx, %4
mov r8, %5
xor eax, eax
call dprintf
%endmacro

%macro CLOSE_FILE 1
mov rax, 3
mov rdi, %1
syscall
%endmacro

_start:
OPEN_FILE
mov [fd], rax
DPRINTF [fd], code, 10, 34, code
CLOSE_FILE [fd]
mov rax, 60
xor rdi, rdi
syscall