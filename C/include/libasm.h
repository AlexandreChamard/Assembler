#ifndef LIBASM_H_
#define LIBASM_H_
typedef unsigned int size_t;

int _atoi(const char *);

int _strcmp(const char *s1, const char *s2);
int _strncmp(const char *s1, const char *s2, size_t n);
int _memcmp(const void *ptr1, const void *ptr2, size_t n);
int _wordcmp(const char *str, const char *word);

int _isblank(char c);
int _isnum(char c);
int _isalpha(char c);
int _islower(char c);
int _isupper(char c);
int _isalphanum(char c);

char *_trim(char *str);
char *_ltrim(char *str);
char *_rtrim(char *str);

int _printf(char *, ...);
void _puts(char *);
void _putstr(char *);
void _putnbr(int);
void _putchar(char);

char *_strcpy(char *dest, const char *src);
char *_strncpy(char *dest, const char *src, size_t n);

size_t _strlen(const char *str);

void _putstr_computed(char *, int);

#endif
