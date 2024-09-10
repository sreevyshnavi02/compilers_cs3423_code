%{
    #include <stdio.h>

    void yyerror(char *s);
    int yylex();
%}

%token NUM
%token EOL
%left '+' '-' '*' '/'

%%
line: exp EOL {printf("%d", $1);}
| EOL;
exp: exp '+' exp {$$ = $1 + $3;}
| exp '-' exp {$$ = $1 - $3;}
| exp '*' exp {$$ = $1 * $3;}
| exp '/' exp {if($3 != 0){
                $$ = $1 / $3;
                } else{
                    yyerror("Divide by 0 error");
                }
    }
| '(' exp ')' {$$ = $2;}
| NUM {$$ = $1;}
;

%%

int main(){
    printf("Enter arithmetic expression: \n");
    yyparse();
    return 0;
}

void yyerror(char* s){
    fprintf(stderr, "Error: %s\n", s);
}