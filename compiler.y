%{
	int yylex(void);
	void yyerror(char*);
%}

%token tMAIN tPRINTF tIF tWHILE tINT tFLOAT tDOUBLE tACC_L tACC_R tID tOR tAND tEQUALS tDIFF tPLUS tMINUS tMULT tDIV tAFFECT tPAR_L tPAR_R tCOMA tBRK_PT tNUMBER

%%

start: tMAIN;

