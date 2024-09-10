/*Definition Section*/
start \/\*
end \*\/

%%
\/\/(.*) ;
{start}(\n|.)*{end} ;
%%

yywrap(){}

int main(int argc, char* argv){
    //cmd line arg to take input from file
    yyin = fopen(argv[1], "r");
    yylex();
    return 0;
}