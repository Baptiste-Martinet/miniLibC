BITS 64

SECTION .text
GLOBAL strncmp

; int strncmp(const char *s1, const char *s2, size_t n);

strncmp:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, 0                  ; int i = 0
    cmp rdi, 0                  ; if s1 == NULL
    je .endError                ; return 0
    cmp rsi, 0                  ; if s2 == NULL
    je .endError                ; return 0
    jmp .loop

.loop:                          ; while
    mov r9b, byte [rdi + rcx]
    mov r10b, byte [rsi + rcx]
    cmp rcx, rdx                ; if i >= n
    jge .end                    ; return s1[i] - s2[i]
    cmp r9b, 0                  ; if s1[i] == '\0'
    je .end                     ; return s1[i] - s2[i]
    cmp r10b, 0                 ; s2[i] == '\0'
    je .end                     ; return s1[i] - s2[i]
    cmp r9b, r10b               ; if s1[i] != s2[i]
    jne .end                    ; return s1[i] - s2[i]
    inc rcx                     ; i++
    jmp .loop                   ; loop

.endError:
    mov rax, 0
    leave                       ; return 0
    ret

.end:
    movsx rax, r9b
    movsx rbx, r10b
    sub rax, rbx                ; dest = s1[i] - s2[i]
    leave                       ; return dest
    ret