%{
	#include<stdio.h>
	int yyerror(){
		return 0;
	}
%}
%start S
%token EOLN NUMBER REGISTER PLUS MUL SUB DIV LPAREN RPAREN
%%
S : S PLUS T
  | S MUL  T
  | S SUB  T
  | S DIV  T
  | T
  ;
T : LPAREN S RPAREN
  | F
  ;
F : NUMBER { printf("Debug=%d;\n",$1);}
  | REGISTER
  ;
%%
#include "lex.yy.c"
