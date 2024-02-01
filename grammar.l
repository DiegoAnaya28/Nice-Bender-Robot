%{
#include "y.tab.h"
extern int yylval;

%}

%%


Robot	            { return ROBOT; }

porfi	            {  return MAGIC_WORD;}

move	            {  return MOVE;}

turn                {  return TURN;}

90|180|270|360      { yylval = atoi (yytext); return NO_DEGREES; }

[0-9]+              {  yylval = atoi (yytext); return NO_BLOCKS;}

block[s]?           { return BLOCKS;}

degree[s]?[,]?      {  return DEGREES;}

(and[ ])?then|and   { return CONJUNCTION;}

ahead[,]?           {  return DIRECTION;}



[a-z]+ ;		/* ignore other caracters */
[ \t]  ;	    	/* ignore whitespace */
\n     ;

. return yytext[0];

%%