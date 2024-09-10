%{
#include <stdio.h>
%}

start \/\*
end \*\/

%%
\/\/.*              	{ /* This pattern matches C-style comments */ }
{start}([^*]|\*+[^/])*{end}  { /* This pattern matches C++-style comments */ }
.|\n                     	{ printf("%s", yytext); }
%%


int yywrap() {
	return 1;
}

int main(int argc, char **argv) {
	if (argc != 2) {
    	fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
    	return 1;
	}
	FILE *file = fopen(argv[1], "r");
	if (!file) {
    	perror("fopen");
    	return 1;
	}
	yyin = file;
	yylex();
	fclose(file);
	return 0;
}