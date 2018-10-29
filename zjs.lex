%{
	#include <stdio.h>

int line_num = 1;

%}

%%

END	{return 0;}
;	{printf("END_STATEMENT \n");}
POINT		{printf("POINT ");}
CIRCLE		{printf("CIRCLE ");}
RECTANGLE	{printf("RECT ");}
SET_COLOR	{printf("SET_COLOR ");}
-?[0-9]+\.[0-9]+	{printf("FLOAT(%s) ", yytext);}
-?[0-9]+			{printf("INT(%s) ", yytext);}

\n			{line_num += 1;}
[\ \t]+		{printf("");}
[^\ \t\n]+	{printf("Error: %s, on line number %d\n", yytext, line_num);}

%%

int main(int argc, char** argv) {
	return yylex();
}
