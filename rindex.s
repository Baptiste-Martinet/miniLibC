BITS 64

SECTION .text
GLOBAL rindex

; char *index(const char *s, int c);

rindex:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, 0                  ; int i = 0
    mov rax, 0                  ; ret = NULL
    cmp rdi, 0                  ; if s == NULL
    je .end                     ; return NULL
    jmp .loop

.loop:                          ; while
    cmp byte [rdi + rcx], sil   ; if s[i] == c
    je .setReturnAdress         ; ret = &s[i]
    cmp byte [rdi + rcx], 0     ; if s[i] == '\0'
    je .end                     ; return ret
    inc rcx                     ; i++
    jmp .loop                   ; loop

.setReturnAdress:
    lea rax, [rdi + rcx]        ; ret = &s[i]
    cmp sil, 0
    je .end
    inc rcx                     ; i++
    jmp .loop                   ; loop

.end:
    leave                       ; return (ret)
    ret