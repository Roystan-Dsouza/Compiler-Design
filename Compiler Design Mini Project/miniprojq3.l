%{
  #include<stdio.h>
  #include "y.tab.h"
  int k=0, i=0, o=0, n=0;
%}

%%
"int" {printf("\n%s is a keyword",yytext);k++;return DTYPE;}
"(" {return OP1;}
")" {return OP2;}
"main" {printf("\n%s is a keyword",yytext);k++;return MAIN;}
"begin" {printf("\n%s is a keyword",yytext);k++;return BEGINS;}
"end" {printf("\n%s is a keyword",yytext);k++;return END;}
"while" {printf("\n%s is a keyword",yytext);k++;return WHILE;}
"expr" {printf("\n%s is an identifier",yytext);i++;return EXPR;}
[a-zA-Z][a-zA-Z0-9_]*  {printf("\n%s is an identifier",yytext);i++;return ID;}
[0-9]+ {printf("\n%s is a digit",yytext);n++;return NUM;}
"="  {printf("\n%s is an operator",yytext);o++;return EQ;}
"+"|"-"|"*"|"/"  {printf("\n%s is an operator",yytext);o++;return OP;}
";" {return SC;}
"," {return CM;}
[ ] {return SP;}
[\t] {return TAB;}
[\n] {return NL;}
[.] {return yytext[0];}
%%

int yywrap()
{ 
  return 1;
}
