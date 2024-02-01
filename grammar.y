%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
FILE *asmFile;
extern int yylex();
extern int yyparse();
extern FILE *yyin;
%}


%token ROBOT MAGIC_WORD MOVE TURN DEGREES NO_DEGREES NO_BLOCKS BLOCKS CONJUNCTION DIRECTION
%%

program : /*empty*/| program sentence;

sentence: ROBOT MAGIC_WORD predicate             {printf("----------PASS----------\n");}
;

predicate : verbs 
| verbs conjunction_use;

verbs : moving_actions
| turning_actions;


conjunction_use: CONJUNCTION predicate;

moving_actions: MOVE NO_BLOCKS BLOCKS DIRECTION	{fprintf(asmFile, "MOV, %d\n", $2); printf("MOV, %d\n", $2);}
| MOVE NO_DEGREES BLOCKS DIRECTION		{fprintf(asmFile, "MOV, %d\n", $2); printf("MOV, %d\n", $2);}
;

turning_actions: TURN NO_DEGREES DEGREES        {fprintf(asmFile, "TURN, %d\n", $2); printf("TURN, %d\n", $2);}
;

%%

int main(int argc, char* argv[]){
  // opening our file and storing the value in "testfile":
  FILE *testFile = fopen(argv[1], "r");

  asmFile = fopen("instructions.asm", "w");

  // validating the file:
  if (!testFile) {
    printf("file could not be opened");
    return -1;
  }

  if(!asmFile){
    printf("file could not be opened");
    return -1;
  }
  //lex reads from it instead of defaulting to STDIN:
  yyin = testFile;

  // lex through the input:
	do {
		yyparse();
	} while (!feof(yyin));

  fclose(testFile);
}

void yyerror(const char *s) {
    printf("FAIL\n");
}