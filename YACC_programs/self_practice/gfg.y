%{ 
#include <ctype.h> 
#include <stdio.h> 
#define YYSTYPE double /* double type for yacc stack */ 
%} 

%%
Lines : Lines S '\n' { printf("OK \n"); }
	    | S '\n'
	    | error '\n' {yyerror("Error: reenter last line:");
						yyerrok; };
S	 : '(' S ')'
	    | '[' S ']'
	    | ;
%% 

int yywrap() {return 1;}


yyerror( char* s){
    printf("%s\n",s);
}
 

int main() 
{
return yyparse();
} 
