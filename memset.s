BITS 64

SECTION .text
GLOBAL memset

; void *memset(void *s, int c, size_t n);

memset:
    push rbp                ;PROLOGUE
    mov rbp, rsp            ;(== enter)

    mov rcx, 0              ; int i = 0
    cmp rdi, 0              ; if s == NULL
    je .end                 ; return NULL
    jmp .loop

.loop:                      ; while
    cmp rcx, rdx            ; if i >= size
    jge .end                ; return &s[i]
    mov [rdi + rcx], sil    ; s[i] = c
    inc rcx                 ; i++
    jmp .loop               ; loop

.end:
    mov rax, rdi
    leave           ; return s
    ret