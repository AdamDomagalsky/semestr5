%{
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

%%

graph	{return GRAPH_START;}
digraph {return DIGRAPH_START;}

-\.	{return NODIR_DOTTED;}
-\.>	{return DIR_DOTTED;}
-	{return NODIR;}
>	{return DIR;}


\(	{return CIRCLE_START;}
\)	{return CIRCLE_END;}

\{	{return TRIANGLE_START;}
\}	{return TRIANGLE_END;}

\[	{return BOX_START;}
\]	{return BOX_END;}

TB|BT|RL|LR|TD	{
		yylval.string=strdup(yytext); 
		return RANKDIR;
}

\"[ a-zA-Z0-9]+\"	{
		yylval.string=strdup(yytext); 
		return TITLE;
}

[a-zA-Z0-9]+	{
		yylval.string=strdup(yytext);
		return ID;
	}


\n	/* ignore EOF*/;
[ \t]+	/* ignore whitespace */;
.	;

%%

int yywrap(void){
	return 1;
}

void mainLex(){
	yylex();
}