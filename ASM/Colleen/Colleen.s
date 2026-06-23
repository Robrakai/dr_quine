global main
extern printf
;first
section .text
main:
push rbx
lea rdi, [rel format]
mov rsi, 10
mov rdx, 34
lea rcx, [rel format]
xor rax, rax
call printf
xor eax, eax
pop rbx
; second
ret

format:
db "global main%1$cextern printf%1$c;first%1$csection .text%1$cmain:%1$cpush rbx%1$clea rdi, [rel format]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel format]%1$cxor rax, rax%1$ccall printf%1$cxor eax, eax%1$cpop rbx%1$c; second%1$cret%1$c%1$cformat:%1$cdb %2$c%3$s%2$c, 0%1$c", 0
