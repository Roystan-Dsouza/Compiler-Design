%{
   #include<stdio.h>
   #include<stdlib.h>
   extern int k, o, i, n, *yyin , *yyout;
   extern int yylex();
%}

%token DTYPE OP1 OP2 MAIN BEGINS END WHILE EXPR ID NUM EQ OP SC CM SP TAB NL

%%
stmt: DTYPE SP MAIN OP1 OP2 NL BODY {
        printf("\n");
        printf("\nValid input\n");
        printf("The number of keywords are: %d\n",k);
        printf("The number of identifiers are: %d\n",i);
        printf("The number of operators are: %d\n",o);
        printf("The number of digit are: %d\n",n);
        printf("\n"); exit(0);}
    ;
BODY: BEGINS NL TAB dec_stmt while_stmt END
    ;
dec_stmt: DTYPE SP list SC NL TAB 
        ;
list: ID CM SP ID SP EQ SP NUM CM SP ID
    ;
while_stmt: WHILE OP1 EXPR OP2 NL TAB BEGINS NL TAB TAB loopbody END NL  
          ;
loopbody: EXPR EQ EXPR OP EXPR SC NL TAB 
        ;
%%

int yyerror()
{
   printf("Invalid input!\n");
   exit(0);
}

int main(int argc,char *argv[])
{
   yyin=(int *)fopen(argv[1],"r");
   yyparse();
}
