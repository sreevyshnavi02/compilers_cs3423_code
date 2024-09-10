%{
#include<stdlib.h>
#include<stdio.h>    
%}

%token LEFT
%token RIGHT

%%

pair: LEFT pair RIGHT pair {printf("Valid!");}
| 
    ;
%%


int yywrap(){return 1;}

yyerror( char* s){
    printf("%s\n",s);
}

int main(){
    yyparse();
    return 0;
}