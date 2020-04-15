/* This file is intended to check some basic C concepts which indeed can be used as interview questions. */

#include <stdio.h>
#include <stdlib.h>

/*
 * int main() {
 *     for (unsigned int a = 0; a < 10; a += 1) {
 *         printf("1: %d\t%d\t\t", a, ~a);
 *         printf("2: %d\t%d\n", a, !a);
 *     }
 * }
 */

/*
 * #include <stdbool.h>
 * int main() {
 *     bool a = 98;
 *     printf("%d\n", a);
 * }
 */


/*
 * #include <stdlib.h>
 * #include <assert.h>
 * 
 * #include <xkbcommon/xkbcommon-compose.h>
 * 
 * 
 * int main(void) {
 *     const char *locale = getenv("LC_ALL");
 *     if (!locale)
 *         locale = getenv("LC_CTYPE");
 *     if (!locale)
 *         locale = getenv("LANG");
 *     if (!locale) {
 *         locale = "C";
 *     }
 * 
 *     printf("locale: %s\n", locale);
 * 
 *     struct xkb_context *ctx = xkb_context_new(0);
 *     assert(ctx);
 *     struct xkb_compose_table *table = xkb_compose_table_new_from_locale(ctx, locale, 0);
 *     printf("table: %p\n", table);
 * 
 *     return 0;
 * }
 */


/*
 * #include <stdio.h>
 * #include <string.h>
 * 
 * #define WIDTH (100)
 * #define HEIGHT 200    
 * void main() {
 *     char *asdf;
 *     [> printf("%s\t%s\n",add_penguin(HEIGHT), add_penguin(WIDTH)); <]
 *     memset (asdf, 0, 100);
 * }
 */

/*
 * int main() {
 *     int count = 0;
 *     char *a = (char *)calloc(200, sizeof(char));
 *     snprintf(a, 200*sizeof(char), "Timer call %d", ++count);
 *     printf("a: %s\n", a);
 *     free(a);
 * }
 */

/*
 * #include <string.h>
 * int main() {
 *     char *s = "hello world!!!";
 *     char *ss = (char *)malloc(sizeof(char)*(strlen(s)+1));
 *     for (int i = 0; i < strlen(s); i += 1) {
 *         sprintf(ss+(2*i), "%02x", s[i]);
 *     }
 *     sprintf(ss+(2*strlen(s)+1), "%c", '\0');
 *     printf("%ld\t%ld\n", strlen(s), strlen(ss));
 * }
 */

/*
 * int main() {
 *     int a[3];
 *     for (int i = 0; i < 3; i += 1) {
 *         a[i] = i;
 *     }
 *     for (int i = 0; i < 16000; i += 1) {
 *         printf("%d  ", a[i]);
 *     }
 * }
 */

/*
 * #define a 10
 * int main() {
 *     printf("a: %d\n", a);
 * #define a 20
 *     printf("a new: %d\n", a);
 * }
 */


/*
 * #include "unistd.h"
 * 
 * #define f printf("\atum\n");
 * 
 * int main() {
 *     f
 *     usleep (2000000);
 *     f
 *     usleep (1500000);
 *     f
 *     sleep (2);
 *     f
 * }
 */

/*
 * int main() {
 *     u_int8_t data[31] = {0x04, 0x3e, 0x14, 0x02, 0x01, 0x00, 0x00, 0x96, 0x01, 0x9a, 0xbf, 0x71, 0x3c, 0x08, 0x02, 0x01, 0x06, 0x04, 0x09, 0x61, 0x62, 0x63, 0xe6};
 *     u_int8_t data_len = data[13];
 *     u_int8_t *data_ptr = &data[19]; 
 * 
 *     printf("data: ");
 *         printf("data_len: %d\n", data_len);
 *     for (u_int16_t i = 0; i < data_len-5; i++) {
 *         [> printf("%02x", *data_ptr++); <]
 *         printf("%c", *data_ptr++);
 *     }
 *     printf("\n");
 * }
 */

/*
 * int main () {
 *     u_int64_t data[] = {0x02, 0x01, 0x1a, 0x02, 0x0a, 0x0c, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x13, 0x1c, 0x35, 0x99, 0xd9};
 *     for (int i = 0; i < sizeof(data)/sizeof(data[0]); i += 1) {
 *         printf("%ld ", data[i]);
 *     }
 *     printf("\n");
 * }
 */

/*
 * #include "time.h"
 * char *foo() {
 *     srand(time(0));
 *     char *a = "Hello World!!!";
 *     if (rand()%2 == 0) {
 *         return a;
 *     } else {
 *         return NULL;
 *     }
 * }
 * 
 * int main() {
 *     (foo() == NULL) ? printf("true\n") : printf("false\n");
 * }
 */

/*
 * typedef struct {
 *     char asdf;
 *     long int foo;
 * } tp;
 * #include "string.h"
 * int main() {
 *     char a[27];
 *     tp temp;
 *     memset(a, 0, sizeof(a));
 *     memset(&temp, 0, sizeof(temp));
 *     printf("size: %ld\ttp: %c\t%ld\n",sizeof(temp), temp.asdf, temp.foo);
 *     printf("a size: %ld\na: %s\n", sizeof(a), a);
 * }
 */

/*
 * void foo(int *a, int b)
 * {
 *     printf("arr: ");
 *     for (int i = 0;i < b; i += 1) {
 *         printf("%d ", a[i]);
 *     }
 *     printf("\n");
 * }
 */

/*
 * typedef struct {
 *     u_int8_t data_buf[1027];
 *     u_int16_t buf_len;
 * } host_rcv_data_t;
 * 
 * typedef struct {
 *     long int a;
 *     [> char hello[3]; <]
 *     [> int aasdf[3]; <]
 * }temp;
 * 
 * int main() {
 *     printf("%ld\n", sizeof(temp));
 * }
 */

/*
 * int main() {
 *     int a[] = {1, 2, 3, 4, 5, 6, 7, 8};
 *     int *b;
 *     b = a;
 *     printf("b: ");
 *     for (int i = 0; i < 8; i += 1) {
 *         printf("%d ", b[i]);
 *     }
 *     printf("\n");
 * }
 */

/*
 * int main() {
 *     u_int8_t a[] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09};
 *     u_int16_t b = 0x1234;
 *     a[3] = b >> 8;
 *     a[4] = b & 0x00ff;
 *     printf("a: ");
 *     for (int i = 0; i < 10; i += 1) {
 *         printf("0x%02x ", a[i]);
 *     }
 *     printf("\n$$$$\n");
 * }
 */

/*
 * int main () {
 *     for (int i = 0; i < 10; i += 1) {
 *         MAX(i)      i;
 *     }
 * #define MAX(x) MAX_ ## x
 *     int a[MAX(4)];
 *     printf("a: ");
 *     for (int i = 0; i < 10; i += 1) {
 *         printf("%d ", a[i]);
 *     }
 *     printf("\n");
 * }
 */

/*
 * typedef struct {
 *     char a;
 *     int b;
 * } st;
 * int main () {
 *     printf("sz: %ld\n", sizeof(st));
 * }
 */

/*
 * int main() {
 *     int a[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, *b;
 *     b = a;
 *     printf("b: ");
 *     for (int i = 0; i < 10; i += 1) {
 *         printf("%d ", b[i]);
 *     }
 *     printf("\n");
 * }
 */

/*
 * #include "assert.h"
 * void hw ()
 * {
 *     printf("Inside hw\n");
 *     for (int a = 0; a < 1; a += 1) {
 *         printf("a/a: %d\n", 4/a);
 *     }
 * }
 * 
 * int main()
 * {
 *     assert(0 && "Hi bro");
 *     hw();
 * }
 */

/*
 * void itoa(int n)
 * {
 *     while (n) {
 *         if (n & 1)
 *             printf("1");
 *         else
 *             printf("0");
 * 
 *         n >>= 1;
 *     }
 *     printf("\n");
 * }
 * 
 * int main()
 * {
 *   char buffer [33];
 *   int i = 0b1 ^
 *           0b1;
 *   itoa (i);
 * }
 */

/*
 * static void inline test_inline_func1(int a, int b) {
 *     printf ("a=%d and b=%d\n", a, b);
 * }
 * 
 * static int inline test_inline_func2(int x) {
 *     return x*x;
 * }
 * 
 * int main() {
 * 
 *     int tmp;
 * 
 *     test_inline_func1(2,4);
 *     tmp = test_inline_func2(5);
 * 
 *     printf("square val=%d\n", tmp);
 * 
 *     return 0;
 * }
 */

/*
 * typedef struct {
 *     int n;
 * } in;
 * 
 * int main() {
 *     in foo;
 *     (foo.n == NULL) ? printf("NULL is true\n") : printf("not NULL\n");
 * }
 */


/*
 * _Bool a;
 * int main() {
 *     printf("a: %d\n", a);
 * }
 */




/*
 * int main() {
 *     u_int16_t w = 0xaaaa;
 *     u_int16_t start = 4;
 *     u_int16_t width = 8;
 *     u_int16_t data = 0x56;
 * 
 *     u_int16_t c = (1 << (width)) - 1;
 *     w &= ~(c << start);
 *     w |= data << start;
 * 
 *     printf("w: 0x%04x\n", w);
 * }
 */


/*
 * #include "assert.h"
 * int main() {
 *     printf("\n\n@@@@@@@@@@@@@@@@@ Hello World @@@@@@@@@@@@@@@@@\n\n\n");
 *     assert(0);
 *     printf("\n\n@@@@@@@@@@@@@@@@@ Hi @@@@@@@@@@@@@@@@@\n\n\n");
 * }
 */

/*
 * int main() {
 *     printf("Hello world \
 *             how are you \
 *             [>commented yes<]I'm good\n");
 * }
 */

/*
 * #define ASDF 1
 * int main() {
 * #if 0
 *     compilation error
 * #endif
 * #if !1
 *         printf("error 2\n");
 * #endif
 * #if !3
 *         printf("error 3\n");
 * #endif
 * #if !3
 *         printf("error 4\n");
 * #endif
 * #ifndef ASDF
 *         printf("asdf\n");
 *         asdf
 * #endif
 *         printf("Hello World\n");
 * 
 * }
 */

/*
 * int main() {
 *     u_int64_t b = 0xfedcba9876543210;
 *     u_int32_t a;
 *     a = b;
 *     printf("0x%x\n", a);
 * }
 */

/*
 * #include "string.h"
 * int main() {
 *     int a[4], b[4];
 *     printf("before:\n");
 *     printf("a: ");
 *     for (int i = 0; i < 4; i += 1) {
 *         printf("%d ", a[i]);
 *     }
 *     printf("\nb: ");
 *     for (int i = 0; i < 4; i += 1) {
 *         printf("%d ", b[i]);
 *     }
 *     for (int i =0; i < 4; i += 1) {
 *         memcpy(a+i, b+i, sizeof(int));
 *     }
 *     printf("\nafter:\n");
 *     printf("a: ");
 *     for (int i = 0; i < 4; i += 1) {
 *         printf("%d ", a[i]);
 *     }
 *     printf("\nb: ");
 *     for (int i = 0; i < 4; i += 1) {
 *         printf("%d ", b[i]);
 *     }
 *     printf("\n");
 * }
 */

/*
 * int main() {
 *     int *a, b, c, *d;
 *     b = 2000;
 *     a = &b;
 *     *d = 3000;
 *     c = *d;
 *     printf("a: %d\tb: %d\tc: %d\td: %d\n", *a, b, c, *d);
 * }
 */

/*
 * #include <execinfo.h>
 * 
 * void foo(void) {
 *     printf("foo\n");
 * }
 * 
 * int main(int argc, char *argv[]) {
 *     void *funptr = &foo;
 * 
 *     {
 *         backtrace_symbols_fd(&funptr, 1, 1);
 *     }
 * 
 *     return 0;
 * }
 */

/*
 * int main(void)
 * {
 *     int a[3] = {
 *         [2] = 3,
 *         [1] = 2,
 *         [0] = 1,
 *     };
 *     for (int i = 0; i < 3; i += 1) {
 *         printf("%d\t", a[i]);
 *     }
 *     printf("\n");
 * }
 */
/*
 * int main(void)
 * {
 *     int a[] = {0, 1, 2};
 *     printf("%d\n", a[-1]);
 * }
 */

/*
 * int main(void)
 * {
 *     printf("Hello\rWorld\n");
 * }
 */

/*
 * #define hi(a)
 * 
 * int main(void)
 * {
 *     printf("1\n");
 *     hi(2)
 *     printf("2\n");
 * }
 */

/*
 * #include "string.h"
 * 
 * int main(void)
 * {
 *     const char *a = "hello";
 *     char *b = "hello";
 *     printf("%d\n%s\n", strncmp(a, b, 10), b);
 * }
 */

/*
 * int f2(void)
 * {
 *     return 2;
 * }
 * #define func()                      \
 *     do {                            \
 *         int a;             \
 *         a = f2()
 * 
 * #define func2()                     \
 *         f2()                        \
 *     } while(0)
 * 
 * int main(void)
 * {
 *     func();
 * }
 */

/*
 * inline int foo(int a)
 * {
 *     return (a+1);
 * }
 * 
 * int main(void)
 * {
 *     int b;
 *     b = foo(3);
 *     printf("%d\n", b);
 * }
 */

/*
 * int main(void)
 * {
 *     char *a[] = {
 *         [0] = "Hello",
 *         [1] = "World",
 *         [6] = "Five"
 *     };
 *     printf("%s\t%s\t%s\t%s\t%s\t%s\n", a[0], a[1], a[2], a[5], a[7], a[4]);
 * }
 */

#include "stdlib.h"

int main(void)
{
    char *command = "pwd\ncd /home\nls";
    system (command);
}
