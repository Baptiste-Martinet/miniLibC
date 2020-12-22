BITS 64

SECTION .text
GLOBAL strlen

; int strlen(const char *str)

strlen:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, 0                  ; int i = 0
    cmp rdi, 0                  ; if str == NULL
    je .end                     ; return 0
    jmp .loop

.loop:                          ; while
    cmp byte [rdi + rcx], 0     ; str[i] != '\0'
    je .end                     ; return i
    inc rcx                     ; i++
    jmp .loop                   ; loop

.end:
    mov rax, rcx
    leave                       ; return i
    ret

; nasm -f elf64 strlen.s
; gcc -shared strlen.o -o libasm.so
; gcc main.c -L./-lasm -fno-builtin
; LD_LIBRARY_PATH=$(pwd) LD_PRELOAD=libasm.so ./a.out