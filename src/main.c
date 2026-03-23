#include <stdio.h>
#include "strutil.h"

int main(void) {
    char buf[] = "hello world";
    printf("original: %s\n", buf);
    printf("reversed: %s\n", str_reverse(buf));
    printf("count of 'l': %d\n", str_count_char(buf, 'l'));
    return 0;
}
