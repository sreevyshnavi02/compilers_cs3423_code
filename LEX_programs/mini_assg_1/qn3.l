%{
    int count = 0;
    int sum = 0;
    int x = 0;
%}

%%
[0-9]+  {
            x = atoi(yytext);
            printf("integer: %d\n", x);
            count++;
            sum += x;
        }
.       ;
\n      ;
%%

int yywrap(){}

int main(int argc, char *argv[]) {
    //cmd line arg to take input from file
    yyin = fopen(argv[1], "r");

    yylex();
    printf("count = %d, sum = %d\n", count, sum);
    float avg = (float)sum/(float)count;
    printf("\nAverage of the integers = %f\n", avg);

    return 0;
}
