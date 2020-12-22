BITS 64

SECTION .text
GLOBAL strpbrk

; char *strpbrk(const char *s, const char *accept);

strpbrk:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, -1                 ; int i = -1
    mov rax, 0                  ; int ret = NULL
    cmp rdi, 0                  ; if s == NULL
    je .end                     ; return ret
    cmp rsi, 0                  ; if accept == NULL
    je .end                     ; return ret
    jmp .loop

.loop:                          ; while
    inc rcx                     ; i++
    cmp byte [rdi + rcx], 0     ; if s[i] == '\0'
    je .end                     ; return ret
    mov r8, 0                   ; int idx = 0
    jmp .loopSub

.loopSub:                       ; while
    mov r10b, byte [rdi + rcx]
    mov r11b, byte [rsi + r8]
    cmp r11b, 0                 ; if accept[idx] == '\0'
    je .loop                    ; break
    cmp r10b, r11b              ; if s[i] == accept[idx]
    je .setAdress               ; ret = &s[i]
    inc r8                      ; idx++
    jmp .loopSub                ; loopSub

.setAdress:
    lea rax, [rdi + rcx]        ; ret = &s[i]
    jmp .end

.end:
    leave                       ; return dest
    ret