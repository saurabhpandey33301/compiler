%{
#include<stdio.h>
int key=0,id=0,real=0,ox=0,hex=0,integer=0,relop=0,assignpop=0,leftpar=0,rightpar=0,del=0;









%}
%option noyywrap

DIGIT [0-9]
LETTERS [a-zA-Z]
KEYWORD (int|if|else|return)
ID ({LETTERS}({DIGIT}|{LETTERS})*)
INTEGERS ({DIGIT}+|"-"{DIGIT}+)
REAL ({DIGIT}+"."{DIGIT}*|"-"{DIGIT}+"."{DIGIT}*)
OCT ("0o"[0-7]+)
HEX ("0x"({DIGIT}|[a-fA-F])+)
EXP (({REAL}|{INTEGERS})"e"({REAL}|{INTEGERS}))
RELOP ("<"|"<="|">"|">="|"=="|"!=")
ASSIGNPOP ("="|"+="|"-=")
LEFTPAR ("("|"{"|"[")
RIGHTPAR (")"|"}"|"]")
DELIMITER (","|";")
SPACE ("\t"|"\n"|" ")

%%
{KEYWORD} {printf("TOKEN KEYWORD : Lexeme : %s\n",yytext);key++;}
{ID}      {printf("TOKEN IDENTIFIER : Lexeme : %s\n",yytext);id++;}


{REAL}|{EXP}    {printf("TOKEN FLOAT : Lexeme : %s\n",yytext);real++;}
{OCT} {printf("TOKEN OCT : Lexeme : %s\n",yytext);ox++;}
{HEX} {printf("TOKEN HEX : Lexeme : %s\n",yytext);hex++;}
{INTEGERS} {printf("TOKEN INTEGERS : Lexeme : %s\n",yytext);integer++;}
{RELOP} {printf("TOKEN RELOP : Lexeme : %s\n",yytext);relop++;}
{ASSIGNPOP} {printf("TOKEN ASSIGNPOP : Lexeme : %s\n",yytext);assignpop++;}
{LEFTPAR} {printf("TOKEN LEFTPAR : Lexeme : %s\n",yytext);leftpar++;}
{RIGHTPAR} {printf("TOKEN RIGHTPAR : Lexeme : %s\n",yytext);rightpar++;}
{DELIMITER} {printf("TOKEN DELIMITER : Lexeme : %s\n",yytext);del++;}
{SPACE} {}

%%

int main(){
    while(yylex());
printf("Total keyword is %d\n",key);
printf("Total id is %d\n",id);
printf("Total real no is %d\n",real);
printf("Total octal no is %d\n",ox);
printf("Total hex no is %d\n",hex);
printf("Total integer is %d\n",integer);
printf("Total relop is %d\n",relop);
printf("Total assignpoop is %d\n",assignpop);
printf("Total left para is %d\n",leftpar);
printf("Total right para is %d\n",rightpar);
printf("Total delimiter is %d\n",del);

   return 0;
}
