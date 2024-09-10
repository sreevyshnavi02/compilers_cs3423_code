%{ 
#include "y.tab.h" 
%}

%%

"(" {return LEFT;}
")" {return RIGHT;}
" " {}
. {printf("unexpected character");}

%%

yywrap() {}
