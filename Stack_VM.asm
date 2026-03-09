%include "io.inc"

section .bss
    stack resd 100001
    a resd 1           ; stack pointer    
    char resd 1


section .text
global main

main:

while:
    GET_CHAR [char]

    mov ecx, '.'
    cmp [char], ecx
    je number

    ; ---- +
    mov ecx, '+'
    cmp [char], ecx
    je add_op

    ; ---- -
    mov ecx, '-'
    cmp [char], ecx
    je sub_op

    ;---- * 
    mov ecx, '*'
    cmp [char], ecx
    je mul_op

    ;---- /
    mov ecx, '/'
    cmp [char], ecx
    je div_op

    ;---- %
    mov ecx, '%'
    cmp [char], ecx
    je mod_op

    ;----  =
    mov ecx, '='
    cmp [char], ecx
    je print
    
    
    ; dup
    mov ecx,'#'
    cmp [char],ecx
    je dup
    
    ;------end
    mov ecx, ':'
    cmp [char], ecx
    je end

    jmp while

number:
    GET_DEC 4, eax
    call push_stack
    jmp while
    
    
; operations 

push_stack:
    mov ecx, [a]
    mov [stack + ecx*4], eax
    inc ecx
    mov [a], ecx
    ret

pop_stack:
    mov ecx, [a]
    dec ecx
    mov [a], ecx
    mov eax, [stack + ecx*4]
    ret
    
dup:    
    mov ecx, [a]
    dec ecx
    mov eax, [stack + 4*ecx]
    call push_stack
    call push_stack
    jmp while


add_op:
    call pop_stack
    mov ebx, eax
    
    call pop_stack
    add eax, ebx
    
    call push_stack
    jmp while

sub_op:
    call pop_stack
    mov ebx, eax
    
    call pop_stack
    sub eax, ebx
    
    call push_stack
    jmp while

mul_op:
    call pop_stack
    mov ebx, eax
    
    call pop_stack
    mul ebx
    
    call push_stack
    jmp while

div_op:
    call pop_stack
    cmp eax, 0
    je eror_div_zero
    mov ebx, eax
    call pop_stack

    xor edx, edx
    div ebx
    call push_stack
    jmp while

mod_op:
    call pop_stack
    cmp eax, 0
    je eror_mod_zero
    mov ebx, eax
    
    call pop_stack
    mov edx, 0
    
    div ebx
    mov eax, edx
    call push_stack
    jmp while

print:
    call pop_stack
    PRINT_DEC 4, eax
    NEWLINE
    jmp while

; ------

eror_div_zero:
    PRINT_STRING 'DIV BY ZERO'
    jmp end

eror_mod_zero:
    PRINT_STRING 'MOD BY ZERO'
;-------

end:
    xor eax, eax
    ret