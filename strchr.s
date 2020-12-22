BITS 64

SECTION .text
GLOBAL strchr

; char *strchr(const char *s, int c);

strchr:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, 0                  ; int i = 0
    cmp rdi, 0                  ; if str == NULL
    je .endNotFound             ; return 0
    jmp .loop

.loop:                          ; while
    cmp byte [rdi + rcx], sil   ; if str[i] == character
    je .end                     ; return &str[i]
    cmp byte [rdi + rcx], 0     ; if str[i] == '\0'
    je .endNotFound             ; return NULL
    inc rcx                     ; i++
    jmp .loop                   ; loop

.endNotFound:
    mov rax, 0
    leave                       ; return NULL
    ret

.end:
    lea rax, [rdi + rcx]
    leave                       ; return &s[i]
    ret