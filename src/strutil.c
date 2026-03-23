#include "strutil.h"
#include <string.h>

char *str_reverse(char *s) {
    size_t len = strlen(s);
    for (size_t i = 0; i < len / 2; i++) {
        char tmp = s[i];
        s[i] = s[len - 1 - i];
        s[len - 1 - i] = tmp;
    }
    return s;
}

int str_count_char(const char *s, char c) {
    int count = 0;
    while (*s) {
        if (*s == c)
            count++;
        s++;
    }
    return count;
}
