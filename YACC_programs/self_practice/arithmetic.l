%{
#include "y.tab.h"    
%}

%%
[-+]?[0-9]+ {yylval = atoi(yytext); return NUM;}
[ \t] {}
\n {return EOL;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return '(';}
")" {return ')';}
.   {printf("Unexpected character: %s\n", yytext);}
%%

int yywrap() {
    return 1;
}