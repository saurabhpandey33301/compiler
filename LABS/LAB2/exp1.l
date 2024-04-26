
%%
[ \t\n]

a*b  {printf("Token %s found \n", yytext); return 1;}
c+  {printf("Token %s found \n", yytext); return 1;}
. {printf("err\n"); return 3;}
%%
int yywrap() {
    return 1;
}

int main() {
    while(yylex());
}