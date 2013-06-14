%{
#include <stdio.h>
#include <string.h>
int s[10] = {0};

int yyerror(){
    printf("error\n");
    return 0;
}
%}
%start S
%token EOLN
%token NUMBER REGISTER
%left PLUS SUB EQ GTE GT LTE LT AS NEQ
%left MUL DIV LPAREN RPAREN
%%
S : EOLN
  | LINE EOLN
  | LINE EOLN S
  ;

LINE : EXPR   { printf("%d\n",$1); }
     | ASSIGN
     ;

ASSIGN : VAR AS EXPR      { s[$1] = $3; $$ = $3;printf("s[%d] = %d\n",$1,$3);}
       ;

EXPR : EXPR PLUS EXPR     { $$ = $1 + $3; }
     | EXPR MUL  EXPR     { $$ = $1 * $3; }
     | EXPR SUB  EXPR     { $$ = $1 - $3; }
     | EXPR DIV  EXPR     { $$ = $1 / $3; }
     | EXPR LT   EXPR     { $$ = $1 < $3; }
     | EXPR LTE   EXPR    { $$ = $1 <= $3; }
     | EXPR GT   EXPR     { $$ = $1 > $3; }
     | EXPR GTE   EXPR    { $$ = $1 >= $3; }
     | EXPR EQ   EXPR     { $$ = $1 == $3; }
     | EXPR NEQ   EXPR    { $$ = $1 != $3; }
     | LPAREN EXPR RPAREN { $$ = $2; }
     | VALUE              { $$ = $1; }
     | VAR                { $$ = s[$1]; }
     ;

VALUE : NUMBER            { $$ = $1; }
      ;
VAR   : REGISTER          { $$ = $1;}
      ;
%%
#include "lex.yy.c"

