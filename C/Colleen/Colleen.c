#include <stdio.h>
/*
    wrong comment synthax
*/
void quine(void) {}
int main()
{
	char *s = "#include <stdio.h>%1$c//first%1$cvoid quine(void) {}%1$cint main()%1$c{%1$c%2$cchar *s = %3$c%4$s%3$c;%1$c%2$cprintf(s, 10, 9, 34, s);%1$c%2$cquine();%1$c%2$c//second%1$c}%1$c";
	printf(s, 10, 9, 34, s);
	quine();
	/*
        second
    */
}
