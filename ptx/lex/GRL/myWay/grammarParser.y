%{
#include <stdio.h>
#include <string.h>

char *prv="";
char *lineStyle="";
%}

%union {
    char *string;
}

%token NODIR_DOTTED DIR_DOTTED NODIR DIR 
%token CIRCLE_START CIRCLE_END TRIANGLE_START TRIANGLE_END BOX_START BOX_END
%token GRAPH_START DIGRAPH_START
%token <string> ID TITLE RANKDIR


%start programs

%%

programs: | programs graph ;

graph: graph_start rankdir path
    | digraph_start rankdir dipath
    ;

graph_start: GRAPH_START {printf("graph {");}
digraph_start: DIGRAPH_START {printf("digraph {");}

rankdir: RANKDIR {printf("\n\trankdir=%s;\n",$1);}; 

dipath: | dipath node diedge id {printf("%s;\n", lineStyle);};
path: | path node edge id {printf("%s;\n", lineStyle);};

diedge: DIR {printf("->");lineStyle="";}
    | DIR_DOTTED {printf("->");lineStyle="[style=\"dashed\"] ";}
    ;

edge: NODIR {printf("--");lineStyle="";}
    | NODIR_DOTTED {printf("--");lineStyle="[style=\"dashed\"]";}
    ;

	node: | node id
    |  node idCustom
    ;

shape: CIRCLE_START TITLE CIRCLE_END {printf("[label=%s shape=oval];\n%s",$2,prv);}
    | CIRCLE_START CIRCLE_END {printf("[shape=oval];\n%s",prv);}
    | TRIANGLE_START TITLE TRIANGLE_END {printf("[label=%s shape=triangle];\n%s",$2,prv);}
    | TRIANGLE_START TRIANGLE_END {printf("[shape=triangle];\n%s",prv);}
    | BOX_START TITLE BOX_END {printf("[label=%s shape=box];\n%s",$2,prv);}
    | BOX_START BOX_END {printf("[shape=box];\n%s",prv);}
    ;

id: ID {printf("%s",$1);prv=strdup(yylval.string);}
    ;

idCustom: ID TITLE {printf("%s[label=%s];\n %s",$1,$2,$1);}
    | id shape

%%

extern FILE *yyin;

main(){
    do {
        yyparse();
    }while (!feof(yyin));
    printf("}\n");
}

yyerror(s)
char *s;
{
    fprintf(stderr, "\n\t!!YYerror(): %s\n",s);
}

