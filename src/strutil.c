#include "strutil.h"

/* BUG: missing #include <string.h> for strlen() */
/* BUG: missing #include <stddef.h> for size_t */

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
