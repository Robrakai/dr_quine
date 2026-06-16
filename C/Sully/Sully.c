#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
	int i = 5;
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$cint main()%1$c{%1$c%2$cint i = %5$d;%1$c%2$cchar *s = %3$c%4$s%3$c;%1$c%2$cchar filename[10];%1$c%2$cchar cmd[50];%1$c%2$csprintf(filename, %3$cSully_%%d.c%3$c, i);%1$c%2$cif (i >= 0) {%1$c%2$c%2$cFILE *f = fopen(filename, %3$cw%3$c);%1$c%2$c%2$cprintf(%3$c%%s%3$c, filename);%1$c%2$c%2$cfprintf(f, s, 10, 9, 34, s, i - 1);%1$c%2$c%2$cfclose(f);%1$c%2$c%2$csprintf(filename, %3$cSully_%%d%3$c, i);%1$c%2$c%2$csprintf(cmd, %3$cgcc %%s.c -o %%s%3$c, filename, filename);%1$c%2$c%2$csystem(cmd);%1$c%2$c%2$csprintf(cmd, %3$c./%%s%3$c, filename);%1$c%2$c%2$csystem(cmd); }%1$c%2$c%2$creturn(0);%1$c}";
	char filename[20];
	char cmd[50];
	sprintf(filename, "Sully_%d.c", i);
	if (i >= 0) {
		FILE *f = fopen(filename, "w");
		printf("%s", filename);
		fprintf(f, s, 10, 9, 34, s, i - 1);
		fclose(f);
		sprintf(filename, "Sully_%d", i);
		sprintf(cmd, "gcc %s.c -o %s", filename, filename);
		system(cmd);
		sprintf(cmd, "./%s", filename);
		system(cmd); }
		return(0);
}