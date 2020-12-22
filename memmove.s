BITS 64

SECTION .text
GLOBAL memmove

; void *memmove(void *dest, const void *src, size_t n);

memmove:
    push rbp                    ;PROLOGUE
    mov rbp, rsp                ;(== enter)

    mov rcx, 0                  ; int i = 0
    cmp rdi, 0                  ; if dest == NULL
    je .endError                ; return 0
    cmp rsi, 0                  ; if src == NULL
    je .endError                ; return 0
    lea r10, [rsi]
    jmp .loop

.loop:                          ; while
    cmp rcx, rdx                ; if i == size
    jge .end                     ; return src
    cmp byte [r10 + rcx], 0     ; if src[i] == '\0'
    je .end                     ; return src
    cmp byte [rdi + rcx], 0     ; if dest[i] == '\0'
    je .endError                ; return NULL
    mov r9b, [r10 + rcx]        ; temp = src[i]
    mov [rdi + rcx], r9b        ; dest[i] = temp
    inc rcx                     ; i++
    jmp .loop                   ; loop

.endError:
    mov rax, 0
    leave                       ; return NULL
    ret

.end:
    mov rax, rdi
    leave                       ; return dest
    ret