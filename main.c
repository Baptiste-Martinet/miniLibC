/*
** EPITECH PROJECT, 2020
** main
** File description:
** main
*/

#include <stdio.h>
#include <stdlib.h>

//#include <string.h>

int strlen(const char *str);
char *strchr(const char *s, int c);
void *memset(void *s, int c, size_t n);
void *memcpy(void *dest, const void *src, size_t n);
int strcmp(const char *s1, const char *s2);
void *memmove(void *dest, const void *src, size_t n);
int strncmp(const char *s1, const char *s2, int n);
int strcasecmp(const char *s1, const char *s2);
char *rindex(const char *s, int c);
char *strstr(const char *haystack, const char *needle);
char *strpbrk(const char *s, const char *accept);
size_t strcspn(const char *s, const char *reject);

int main(void)
{
    char *str = malloc(sizeof(char) * 4);
    char *str2 = malloc(sizeof(char) * 4);

    memset(str, 'A', 4);
    memset(str2, 'B', 4);

    printf("-------------STRLEN-------------\n");
    printf("Gito len = %d\n", strlen("Gito"));
    //printf("NULL len = %d\n", strlen(NULL));

    printf("\n-------------STRCHR-------------\n");
    printf("FOUND = %s\n", strchr("Gito...", '.'));
    printf("NOT FOUND = %p\n", strchr("Gito...", 'a'));
    printf("NOT FOUND = %s\n", strchr("Gito...", '\0'));

    printf("\n-------------MEMSET-------------\n");
    printf("AAAA = %s\n", str);
    printf("BBBB = %s\n", str2);

    printf("\n-------------MEMCPY-------------\n");
    memcpy(str, "Gito", 5);
    printf("memcpy(\"Gito\") = %s\n", str);

    printf("\n-------------STRCMP-------------\n");
    printf("OK = %d\n", strcmp("GITO PD", "GITO PD"));
    printf("Result < = %d\n", strcmp("GITO PD", "GITO est pas PD"));
    printf("Result > = %d\n", strcmp("GITO est pas PD", "GITO PD"));
    //printf("Result > = %d\n", strcmp("GITO est pas PD", NULL));

    printf("\n-------------MEMMOVE-------------\n");
    memmove(str, str2, 2);
    printf("BBto = %s\n", str);
    printf("BBBB = %s\n", str2);

    printf("\n-------------STRNCMP-------------\n");
    printf("OK = %d\n", strncmp("GITO PD", "GITO PD", 4));
    printf("NOT OK = %d\n", strncmp("GITO PD", "GITO est pas PD", 9));

    printf("\n-------------STRCASECMP-------------\n");
    printf("OK (0)= %d\n", strcasecmp("GITO PD", "gito pda"));
    printf("NOT OK (12)= %d\n", strcasecmp("GITO PD", "GITO dst pas PD"));
    printf("OK (0)= %d\n", strcasecmp("GITO PD", "GITO PD"));
    printf("NOT OK (11)= %d\n", strcasecmp("GITO PD", "GITO est pas PD"));

    printf("\n-------------RINDEX-------------\n");
    printf("OK = %s\n", rindex("GITO PD", 'P'));
    printf("OK2 = %s\n", rindex("GITO PD OU PAS", 'P'));
    printf("NOT OK = %s\n", rindex("GITO PD", 'A'));
    //printf("NULL = %s\n", rindex(NULL, 'A'));
    printf("NOT OK = %s\n", rindex("GITO", '\0'));

    printf("\n-------------STRSTR-------------\n");
    printf("FOUND = %s\n", strstr("Gito", "Gito"));
    printf("FOUND = %s\n", strstr("Gito...", "to"));
    printf("NOT FOUND = %s\n", strstr("Gito...", "al"));
    printf("TOO LONG = %s\n", strstr("Gito...", "allllalalallalala"));
    printf("empty string = %s\n", strstr("",""));
    //printf("NULL1 = %s\n", strstr(NULL, "to"));
    //printf("NULL2 = %s\n", strstr("Gito...", NULL));

    printf("\n-------------STRPBRK-------------\n");
    printf("FOUND = %s\n", strpbrk("Gito...", ".to"));
    printf("NOT FOUND = %s\n", strpbrk("Gito...", "al"));
    printf("TOO LONG = %s\n", strpbrk("Gito...", "allllalalallalala"));
    //printf("NULL1 = %s\n", strpbrk(NULL, "to"));
    //printf("NULL2 = %s\n", strpbrk("Gito...", NULL));

    printf("\n-------------STRCSPN-------------\n");
    printf("Length = %d\n", strcspn("Gito...", "to"));
    //printf("NULL1 = %d\n", strcspn(NULL, "to"));
    //printf("NULL2 = %d\n", strcspn("Gito...", NULL));
    return 0;
}

/*
;; compiler
;; nasm -f elf64 strlen.s -Wall -Ox
;; gcc -shared strlen.o -o libasm.so
;; gcc main.c -L./-lasm -fno-builtin
;; LD_LIBRARY_PATH=$(pwd) LD_PRELOAD=./libasm.so ./a.out
 */ 