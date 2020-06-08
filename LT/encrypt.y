%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	void yyerror(char* );
	extern char *yytext;
	int status;
	//char str[1000];
%}

%union{
int num;
char *word;
}

%token ENC DEC COL <word>WORD NEWLINE <num>DIG EXIT

%%
START:	ACTION COL TEXT NEXT START		{ printf("\n"); }
			|
			ACTION COL TEXT NEXT	OUT			{ printf("\nComplete!!\n"); }
			;
			
ACTION:	ENC										{ status = 1; }
			| 
			DEC										{ status = 0; }
			;
	
TEXT:		WORD										{
															char *str=strdup($1);
															int s = 4;
															if(status == 1){
																for(int i=0; i<strlen(str); i++){
																	char ch = str[i];
																	ch += s;
																	if (ch > 'z') ch -= ('z'+1-'a');
																		printf("%c", ch);	
												  				}
															}
															else{
																char ch;
																for(int i=0; i<strlen(str); i++){
																	if((int)str[i] < 101){
																		ch = 'z'-(100 - str[i]);
																	}
																	else {
																		ch = str[i]-4;
																	}
																	printf("%c", ch);	
												  				}
												  				ch = '\0';	
															}
														}
			| DIG										{
			;												/*char *digit = strdup($1);
															int s = 4;
															if(status == 1){
																for(int i=0; i<strlen(digit); i++) {
																	int num = (int)digit[i];
																	num += s;
																	printf("%d", num);
																}
															}
															else {
																for(int i=0; i<strlen(digit); i++) {
																	int num = (int)digit[i];
																	num -= s;
																	printf("%d", num);
																}
															}*/
														}

NEXT:		NEWLINE									{ printf("\n"); }
			|											
			;											
														
OUT:		EXIT										{ printf("\nComplete!!\n"); exit(0); }
			;											
%%

void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}


int main(){
	yyparse();
	return 0;
}

