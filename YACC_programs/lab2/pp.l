%{ 
#include "y.tab.h" 
%}

%%

"(" {printf("LEFT "); return LEFT;}
")" {printf("RIGHT "); return RIGHT;}
" " {}
\n {return EOL; }
. {printf("unexpected character");}

%%

yywrap(){}
