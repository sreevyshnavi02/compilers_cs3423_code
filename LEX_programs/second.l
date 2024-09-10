%%
^[ ]*\n
\n {ECHO; yylineno++;}
.* {printf("%d\t%s", yylineno,yytext);}
%%

yywarp(){}

main() {yylineno = 1; yylex();}