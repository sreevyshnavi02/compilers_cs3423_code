%{
#include <stdio.h>
%}
%token INTEGER
%%
program:
	program expr '\n' { printf("%d\n", $2); }
	|
	;
expr: term
	| expr '*' term { $$ = $1 * $3; }
	| expr '+' term { $$ = $1 + $3; }
	| expr '-' term { $$ = $1 - $3; }
	;
term: 
	INTEGER { $$ = $1; }
;
%%
int yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
	return 0;
}
int main(void) {
	yyparse();
	return 0;
}
