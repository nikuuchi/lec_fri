%{
	int yyerror(){
		return 0;
	}
%}
%start
%token
%%
S :
  |
  ;

%%
#include "lex.yy.c"
