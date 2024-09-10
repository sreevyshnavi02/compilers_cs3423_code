%{
#include<stdlib.h>
#include<stdio.h>  
int yyerror(char * s);
int yylex();
%}

%token LEFT
%token RIGHT
%token EOL

%%

input: pair EOL {printf("\nValid!\n"); exit(0);}
;
pair: LEFT pair RIGHT pair {;}
    |
    ;
%%



int yyerror( char* s){
    extern char *yytext;  // yytext is from the lexer
    printf("\nError: %s at symbol '%s'\n", s, yytext);
    // printf("%s\n",s);
    return 0;
}

int main(){
    yyparse();
    return 0;
}