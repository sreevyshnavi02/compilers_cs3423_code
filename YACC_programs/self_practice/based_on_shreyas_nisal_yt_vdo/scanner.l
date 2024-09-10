%%
[a-z0-9]{3, 10}@[a-z]+\.[a-z]+ {printf("%s is email id", yytext);}
[6-9][0-9]{9} {printf("%s is Mobile number", yytext);}
[a-zA-Z_][a-zA-Z_0-9]* {printf("%s is identifier", yytext);}
.+  {printf("No regexp matched");}
\n {return 0;}
%%

yywrap() {}

int main(){
    yylex();
    return 0;
}