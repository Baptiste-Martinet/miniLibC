BITS 64

SECTION .text
GLOBAL strcasecmp

; int strcasecmp(const char *s1, const char *s2);

strcasecmp:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, 0                  ; int i = 0
    cmp rdi, 0                  ; if s1 == NULL
    je .endError                ; return 0
    cmp rsi, 0                  ; if s2 == NULL
    je .endError                ; return 0
    jmp .loop

.loop:                          ; while
    mov r9b, byte [rdi + rcx]   ; r9b = s1[i]
    mov r10b, byte [rsi + rcx]  ; r10b = s2[i]
    cmp r9b, 0                  ; s1[i] == '\0'
    je .end                     ; return s1[i] - s2[i]
    cmp r10b, 0                 ; s2[i] == '\0'
    je .end                     ; return s1[i] - s2[i]
    cmp r9b, r10b               ; s1[i] != s2[i]
    jne .end                    ; return
    inc rcx                     ; i++
    jmp .loop                   ; loop

.toLowerCaseR9:
    sub r9b, 'a' - 'A'
    jmp .end

.toLowerCaseR10:
    sub r10b, 'a' - 'A'
    jmp .end

.endError:
    mov rax, 0
    leave                       ; return 0
    ret

.end:
    cmp r9b, 'a'                ; if s1[i] >= 'a'
    jge .toLowerCaseR9          ; s1[i] -= 'a' - 'A'
    cmp r10b, 'a'               ; if s2[i] >= 'a'
    jge .toLowerCaseR10         ; s2[i] -= 'a' - 'A'
    movzx rax, r9b
    movzx rbx, r10b
    sub rax, rbx
    leave           ; return s1[i] - s2[i]
    ret