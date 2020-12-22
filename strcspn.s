BITS 64

SECTION .text
GLOBAL strcspn

; size_t strcspn(const char *s, const char *reject);

strcspn:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rax, -1                 ; int i = -1
    cmp rdi, 0                  ; if s == NULL
    je .endError                ; return NULL
    cmp rsi, 0                  ; if reject == NULL
    je .endError                ; return NULL
    jmp .loop

.loop:                          ; while
    inc rax                     ; i++
    cmp byte [rdi + rax], 0     ; if s[i] == '\0'
    je .end                     ; return i
    mov r8, 0                   ; int idx = 0
    jmp .loopSub

.loopSub:                       ; while
    mov r10b, [rdi + rax]
    mov r11b, [rsi + r8]
    cmp r11b, 0                 ; if reject[idx] == '\0'
    je .loop                    ; break
    cmp r10b, r11b              ; if s[i] == reject[idx]
    je .end                     ; return i
    inc r8                      ; idx++
    jmp .loopSub                ; loopSub

.endError:
    mov rax, 0
    leave                       ; return 0
    ret

.end:
    leave                       ; return dest
    ret