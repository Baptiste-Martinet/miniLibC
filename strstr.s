BITS 64

SECTION .text
GLOBAL strstr

; char *strstr(const char *haystack, const char *needle);

strstr:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, -1                 ; int i = -1
    mov rax, 0                  ; ret = NULL
    cmp rdi, 0                  ; if haystack == NULL
    je .end                     ; return ret
    cmp rsi, 0                  ; if needle == NULL
    je .end                     ; return ret
    jmp .loop

.loop:                          ; while
    inc rcx                     ; i++
    ;cmp byte [rdi + rcx], 0     ; if haystack[i] == '\0'
    ;je .end                     ; return NULL
    mov r8, rcx                 ; int j = i
    mov r9, 0                   ; int idx = 0
    jmp .loopSub

.loopSub:                       ; while
    mov r10b, byte [rdi + r8]
    mov r11b, byte [rsi + r9]
    cmp r11b, 0                 ; if needle[idx] == '\0'
    je .setAdress               ; return (&haystack[i])
    cmp r10b, 0                 ; if haystack[idx] == '\0'
    je .end                     ; return NULL
    cmp r10b, r11b              ; if haystack[j] != needle[idx]
    jne .loop                   ; break
    inc r8                      ; j++
    inc r9                      ; idx++
    jmp .loopSub                ; loopSub

.setAdress:
    lea rax, [rdi + rcx]        ; ret = &haystack[i]
    jmp .end

.end:
    leave                       ; return dest
    ret