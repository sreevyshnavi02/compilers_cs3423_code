
%%
[A-Z]+	{ECHO; printf("\n");}
.|\n	;
%%

int yywrap() {}
int main(){
    yylex();
    return 0;
}

/* input */
//abcdefghIJKLmnop;
