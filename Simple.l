%{
  #include <stdio.h>
  #include <stdlib.h> 
  #include <string.h>
  #include "Simple.tab.h"
  int yylex();
  int yyparse();
%}

DIGIT [0-9]
ID [a-z][a-z0-9]*
CADENA  \"(\\.|[^"\\])*\"

%%
":=>"           { return(ASSGNOP); }
{DIGIT}+        { yylval.intval = atoi( yytext );return(NUMBER); }
Haz             { return(DO); }
siNo            { return(ELSE); }
fin             { return(END); }
fi              { return(FI); }
si              { return(IF); }
iniciar         { return(IN); }
entero          { return(INTEGER); }
establecer      { return(LET); }
leer            { return(READ); }
saltar          { return(SKIP); }
entonces        { return(THEN); }
ciclarMientras  { return(WHILE); }
escribirNumero        { return(WRITE); }
imprimir        { return(PRINT); }
{CADENA}        {yylval.id = strdup(yytext); return(STRING); }
{ID}            { yylval.id = (char *) strdup(yytext);return(IDENTIFIER); }
[\ \t\n]+       {}
.               { return(yytext[0]);}
%%

int yywrap(){return 0;}