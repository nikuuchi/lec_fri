numb [0-9]+
reg  S[0-9]
%%
{numb} {
            sscanf(yytext, "%d", &yylval);
            return NUMBER;
       }
{reg}  {
            sscanf(yytext, "%d", &yylval);
            return REGISTER;
       }
\+     {return PLUS;}
\-     {return SUB;}
\*     {return MUL;}
\/     {return DIV;}
\(     {return LPAREN;}
\)     {return RPAREN;}
(\ |\t|\n)* {/* nop */}
%%
