global main
extern printf
;first
section .text

print:
lea rdi, [rel format]
mov rsi, 10
mov rdx, 34
lea rcx, [rel format]
xor rax, rax
add rsp, -8
call printf
add rsp, 8
ret

main:
add rsp, -8
call print
add rsp, 8
; second
mov rax, 0
ret

format:
db "global main%1$cextern printf%1$c;first%1$csection .text%1$c%1$cprint:%1$clea rdi, [rel format]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel format]%1$cxor rax, rax%1$cadd rsp, -8%1$ccall printf%1$cadd rsp, 8%1$cret%1$c%1$cmain:%1$cadd rsp, -8%1$ccall print%1$cadd rsp, 8%1$c; second%1$cmov rax, 0%1$cret%1$c%1$cformat:%1$cdb %2$c%3$s%2$c, 0%1$c", 0
