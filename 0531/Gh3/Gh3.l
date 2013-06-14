numb [0-9]+
reg  S[0-9]
%%
{numb} {
            sscanf(yytext, "%d", &yylval);
            return NUMBER;
       }
{reg}  {
            sscanf(yytext, "S%d", &yylval);
            return REGISTER;
       }
\+     {return PLUS;}
\-     {return SUB;}
\*     {return MUL;}
\/     {return DIV;}
\<     {return LT;}
\<=    {return LTE;}
\>     {return GT;}
\>=    {return GTE;}
\(     {return LPAREN;}
\)     {return RPAREN;}
\=     {return AS;}
\==    {return EQ;}
\!=    {return NEQ;}
\n     {return EOLN; }
(\ |\t|\n)* {/* nop */}
%%

