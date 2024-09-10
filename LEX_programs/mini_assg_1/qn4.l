/*
Qn4 ans:
The warning rule cannot be matched occurs when a rule is already covered by another rule specified before it.

For example, [A-Z]+ (line 11) is already covered in the previous rule [A-Za-z]+ (line 10).
Hence, this program throws a warning in line 11
*/

%%
[A-Za-z]+  {printf("string1: %s\n", yytext);}
[A-Z]+  {printf("string2: %s\n", yytext);}
.       ;
\n      ;
%%

int yywrap(){}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}
