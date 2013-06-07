%{
    #include<stdio.h>
    int yyerror(){
        return 0;
    }
%}
%start S
%token EOLN
%token NUMBER REGISTER
%left PLUS SUB EQ
%left MUL DIV LPAREN RPAREN
%%
S : EOLN
  | LINE EOLN
  | LINE EOLN S
  ;

LINE : EXPR { printf("%d\n",$1); }
     ;

EXPR : EXPR PLUS EXPR     { $$ = $1 + $3; }
     | EXPR MUL  EXPR     { $$ = $1 * $3; }
     | EXPR SUB  EXPR     { $$ = $1 - $3; }
     | EXPR DIV  EXPR     { $$ = $1 / $3; }
     | LPAREN EXPR RPAREN { $$ = $2; }
     | VALUE              { $$ = $1; }
     ;

VALUE : NUMBER            { $$ = $1; }
      | REGISTER
      ;
%%
#include "lex.yy.c"

