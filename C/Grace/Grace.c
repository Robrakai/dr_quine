#include <stdio.h>
#define FILENAME "Grace_kid.c"
#define SOURCE "#include <stdio.h>%1$c#define FILENAME %3$cGrace_kid.c%3$c%1$c#define SOURCE %3$c%4$s%3$c%1$c#define FT()%2$cint main(){ FILE *f = fopen(FILENAME, %3$cw%3$c); fprintf(f, SOURCE, 10, 9, 34, SOURCE); fclose(f); }%1$c/*%1$c%2$ccomment%1$c*/%1$cFT()%1$c"
#define FT()	int main(){ FILE *f = fopen(FILENAME, "w"); fprintf(f, SOURCE, 10, 9, 34, SOURCE); fclose(f); }
/*
	comment
*/
FT()
