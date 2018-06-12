%{
#include <stdio.h>
int an=0;
int bn=0;
int cn=0;
%}

%%
a   an++;printf(yytext);
b   bn++;printf(yytext);
c   cn++;printf(yytext);

\n	/* ignore EOF*/;
[ \t]+	/* ignore whitespace */;

%%

int yywrap(void){
    return 1;
}

void main(){
    yylex();
    
    if(an==bn && bn==cn){
        printf(" OK\n");
    }else{
        printf(" Error\n");
    }
}