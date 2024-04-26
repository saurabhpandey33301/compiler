%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern int yylval;
%}
letter [A-Za-z]
digit [0-9]
ws [ \t\n]
%%
"+" {return '+';}
"*" {return '*';}
{digit}+ {yylval = atoi(yytext);return NUM;}
%%
int yywrap(void){return 1;}