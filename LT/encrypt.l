%{
	#include<stdio.h>
	#include<string.h>
	#include "y.tab.h"
	void yyerror(char* );
%}

alpha	[a-zA-Z]
digit	[0-9]

%%
[ \t]+		;/*Eat whitespaces*/
[\n]			return NEWLINE;
ENCRYPT		return ENC;
DECRYPT		return DEC;
QUIT			return EXIT;
{alpha}+		{yylval.word=strdup(yytext);return WORD;}
{digit}+		{yylval.num=atoi(yytext);return DIG;}
":"			return COL;
.				yyerror("Invaid character!");
%%

int yywrap(){return 1;}

