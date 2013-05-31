numb [0-9]+
reg  S[0-9]
%%
{numb} {return NUMBER;}
{reg}  {return REGISTER;}
\+     {return PLUS;}
\-     {return SUB;}
\*     {return MUL;}
\/     {return DIV;}
\(     {return LPAREN;}
\)     {return RPAREN;}
(\ |\t|\n)* {/* nop */}
%%
