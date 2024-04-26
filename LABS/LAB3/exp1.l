%{
    #include<stdio.h>
%}

%option noyywrap
L[A-Za-z]
D[0-9]
DO [0-7]
HX [A-Fa-f0-9]

%%
int|if|else|return|float|char|const|static|while|do|void  {printf("keyword found\n"); return 1;}

{L}({L}|{D})*  {printf("identifier found\n"); return 1;}
{D}+ {printf("number obtained\n"); return 1;}
{D}*\.{D}+|{D}+.{D}*|{D}+ {printf("Decimal number found\n"); return 1;}
"<"|"<="|">"|">="|"=="|"!=" {printf("Relational Operator found \n"); return 1;}
"="|"+="|"-=" {printf("Assignment Operator found \n"); return 1;}
"("|"["|"{" {printf("Left parenthesis found \n");return 1;}
")"|"]"|"}" {printf("Right parenthesis found \n");return 1;}
";"|","|":"|"." {printf("Delimiter found \n");return 1;}
%%

int main() {
    while(yylex());
}