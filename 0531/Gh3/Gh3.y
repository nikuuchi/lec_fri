%{
	int yyerror(){
		return 0;
	}
%}
%start S
%token EOLN NUMBER REGISTER PLUS MUL SUB DIV
%%
S : S PLUS T
  |
  ;

%%
#include "lex.yy.c"
