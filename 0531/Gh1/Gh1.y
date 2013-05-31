%{
	int yyerror(){
		return 0;
	}
%}
%start S
%token EOLN NUMBER REGISTER PLUS SUB MUL DIV LPAREN RPAREN
%%
S : S PLUS T
  | T
  ;
T : F
  ;
F :NUMBER
  |REGISTER
  ;
%%
#include "lex.yy.c"
