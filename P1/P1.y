%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	#include <stdbool.h>
	int yyerror ();
	int yylex(void) ;

	void removeSpaces(char *str){
    int count = 0;
    for (int i = 0; str[i]; i++)
        if (str[i] != ' ')
            str[count++] = str[i];
    str[count] = '\0';
	}

	struct Record {
		char * a;
		char * b[1000];
		char * c[1000];
		int bSize;
		int cSize;
	};



	char* copy(char * a){
		int x1=strlen(a);
		char * ans=malloc((x1+3)*sizeof(char));
		for(int i=1;i<=x1;++i)
			ans[i]=a[i-1];
		ans[0]=' ';
		ans[x1+1]=' ';
		ans[x1+2]='\0';
		return ans;
	}

  char * concatenate2(char *a,char *b)
  {
    int x1= strlen(a), x2 = strlen(b);
    char * ans= malloc((x1+x2+3)*sizeof(char));
    for(int i=1;i<=x1;++i)
      ans[i]=a[i-1];
    for(int i=x1+1;i<=x1+x2;++i)
      ans[i]=b[i-x1-1];
		ans[0]=' ';
		ans[x1+x2+1]=' ';
    ans[x1+x2+2]='\0';
    return ans;
  }

  char * concatenate3(char *a,char *b,char * c)
  {
    int x1= strlen(a), x2 = strlen(b), x3=strlen(c);
    char * ans= malloc((x1+x2+x3+3)*sizeof(char));
    for(int i=1;i<=x1;++i)
      ans[i]=a[i-1];
    for(int i=x1+1;i<=x1+x2;++i)
      ans[i]=b[i-x1-1];
    for(int i=x1+x2+1;i<=x1+x2+x3;++i)
      ans[i]=c[i-x1-x2-1];
    ans[x1+x2+x3+2]='\0';
		ans[x1+x2+x3+1]=' ';
		ans[0]=' ';
    return ans;
  }

	char * concatenate4(char *a,char *b,char * c,char *d)
  {
    int x1= strlen(a), x2 = strlen(b), x3=strlen(c),x4=strlen(d);
    char * ans= malloc((x1+x2+x3+x4+3)*sizeof(char));
    for(int i=1;i<=x1;++i)
      ans[i]=a[i-1];
    for(int i=x1+1;i<=x1+x2;++i)
      ans[i]=b[i-x1-1];
    for(int i=x1+x2+1;i<=x1+x2+x3;++i)
      ans[i]=c[i-x1-x2-1];
		for(int i=x1+x2+x3+1;i<=x1+x2+x3+x4;++i)
      ans[i]=d[i-x1-x2-x3-1];
    ans[x1+x2+x3+x4+2]='\0';
		ans[x1+x2+x3+x4+1]=' ';
		ans[0]=' ';
    return ans;
  }

	char * concatenate5(char *a,char *b,char * c,char *d,char* e)
  {
    int x1= strlen(a), x2 = strlen(b), x3=strlen(c),x4=strlen(d),x5=strlen(e);
    char * ans= malloc((x1+x2+x3+x4+x5+3)*sizeof(char));
    for(int i=1;i<=x1;++i)
      ans[i]=a[i-1];
    for(int i=x1+1;i<=x1+x2;++i)
      ans[i]=b[i-x1-1];
    for(int i=x1+x2+1;i<=x1+x2+x3;++i)
      ans[i]=c[i-x1-x2-1];
		for(int i=x1+x2+x3+1;i<=x1+x2+x3+x4;++i)
      ans[i]=d[i-x1-x2-x3-1];
		for(int i=x1+x2+x3+x4+1;i<=x1+x2+x3+x4+x5;++i)
      ans[i]=e[i-x1-x2-x3-x4-1];
		ans[x1+x2+x3+x4+x5+1]=' ';
    ans[x1+x2+x3+x4+x5+2]='\0';
		ans[0]=' ';

    return ans;
  }

	char * concatenate6(char *a,char *b,char * c,char *d,char* e,char * f)
  {
    int x1= strlen(a), x2 = strlen(b), x3=strlen(c),x4=strlen(d),x5=strlen(e),x6=strlen(f);
    char * ans= malloc((x1+x2+x3+x4+x5+x6+3)*sizeof(char));
    for(int i=1;i<=x1;++i)
      ans[i]=a[i-1];
    for(int i=x1+1;i<=x1+x2;++i)
      ans[i]=b[i-x1-1];
    for(int i=x1+x2+1;i<=x1+x2+x3;++i)
      ans[i]=c[i-x1-x2-1];
		for(int i=x1+x2+x3+1;i<=x1+x2+x3+x4;++i)
      ans[i]=d[i-x1-x2-x3-1];
		for(int i=x1+x2+x3+x4+1;i<=x1+x2+x3+x4+x5;++i)
      ans[i]=e[i-x1-x2-x3-x4-1];
		for(int i=x1+x2+x3+x4+x5+1;i<=x1+x2+x3+x4+x5+x6;++i)
      ans[i]=f[i-x1-x2-x3-x4-x5-1];
    ans[x1+x2+x3+x4+x5+x6+2]='\0';
		ans[x1+x2+x3+x4+x5+x6+1]=' ';
		ans[0]=' ';

    return ans;
  }

	struct Record RecordExpression[1000];
	int RecordExpressionSize=0,RecordStatementSize=0;
	struct Record RecordStatement[1000];

	void recordstatement(char* a,char *b,char *c){
			int x= RecordStatementSize,xb,xc;
			a=strdup(a);
			b=strdup(b);
			c=strdup(c);
			removeSpaces(a);
			removeSpaces(b);

			RecordStatement[x].a=a;
			xb=0;
			xc=0;
			char* token = strtok(b, ", ");
	    while (token != NULL) {
	     		RecordStatement[x].b[xb]=strdup(token);
	        token = strtok(NULL, ", ");
					xb++;
	    }

			token = strtok(c," ");
			while (token != NULL) {
	     		RecordStatement[x].c[xc]=strdup(token);
	        token = strtok(NULL, ", ");
					xc++;
	    }

			RecordStatement[x].bSize=xb;
			RecordStatement[x].cSize=xc;
			RecordStatementSize++;
	}

	void recordexpression(char* a,char *b,char *c){
		a=strdup(a);
		b=strdup(b);
		c=strdup(c);

		int x= RecordExpressionSize,xb,xc;
		removeSpaces(a);
		removeSpaces(b);
		RecordExpression[x].a=strdup(a);
		xb=0;
		xc=0;
		char* token = strtok(b, ", ");
		while (token != NULL) {
				RecordExpression[x].b[xb]=strdup(token);
				token = strtok(NULL, ", ");
				xb++;
		}
		token = strtok(c, " ");
		while (token != NULL) {
				RecordExpression[x].c[xc]=strdup(token);
				token = strtok(NULL, ", ");
				xc++;
		}
		RecordExpression[x].bSize=xb;
		RecordExpression[x].cSize=xc;
		RecordExpressionSize++;
	}

	char * findinrecordstatement(char * A,char *B){
		A=strdup(A);
		B=strdup(B);
		removeSpaces(A);
		removeSpaces(B);
		char * ans[1000];
		bool changed[1000];
		char* inputmacro[1000];
		int bsize=0,csize=0,length=0;

		bool fl=1;

		char * token = strtok(B, ", ");

		while (token != NULL) {
				inputmacro[bsize]=strdup(token);
				token = strtok(NULL, ", ");
				bsize++;
		}

		char arr[1000],brr[1000],j=0,k=0;
		for(int i=RecordStatementSize-1;i>=0;--i){
			if(strcmp(RecordStatement[i].a,A)==0){

				csize=RecordStatement[i].cSize;

				if(bsize != RecordStatement[i].bSize){
					fl=0;
					break;
				}

				for(int j=0;j<csize;++j){
					ans[j]=strdup(RecordStatement[i].c[j]);
					changed[j]=false;
				}

				for(int j=0;j<bsize;++j){
					for(int k=0;k<csize;++k){
						if(changed[k]==false && strcmp(RecordStatement[i].b[j],ans[k])==0){
								changed[k]=true;
								ans[k]=strdup(inputmacro[j]);
						}
					}
				}
				break;
			}
			if(i==0)
				fl=0;
		}

		if(!fl){
			yyerror();
			exit(0);
		}

		for(int i=0;i<csize;++i){
			length+=strlen(ans[i]);
		}

		char * fans=malloc((length+5+csize)*sizeof(char));
		int cons=0;
		for(int i=0;i<csize;++i){
			fans[cons]=' ';
			cons++;
			for(int j=0;j<strlen(ans[i]);++j){
				fans[cons]=ans[i][j];
				cons++;
			}
		}
		fans[cons]=' ';
		fans[cons+1]='\0';
		return fans;

	}

	char * findinrecordexpression(char * A,char *B){
		A=strdup(A);
		B=strdup(B);
		removeSpaces(A);
		removeSpaces(B);
		/* char * ans=malloc() */
		char * ans[1000];
		bool changed[1000];
		char* inputmacro[1000];
		int bsize=0,csize=0,length=0;

		char * token = strtok(B, ", ");

		while (token != NULL) {
				inputmacro[bsize]=strdup(token);
				token = strtok(NULL, ", ");
				bsize++;
		}

		bool fl=1;

		char arr[1000],brr[1000],j=0,k=0;
		for(int i=RecordExpressionSize-1;i>=0;--i){
			if(strcmp(RecordExpression[i].a,A)==0){

				csize=RecordExpression[i].cSize;

				for(int j=0;j<csize;++j){
					ans[j]=strdup(RecordExpression[i].c[j]);
					changed[j]=false;
				}

				if(bsize != RecordExpression[i].bSize){
					fl=0;
					break;
				}

				for(int j=0;j<bsize;++j){
					for(int k=0;k<csize;++k){
						if(changed[k]==false && strcmp(RecordExpression[i].b[j],ans[k])==0){
								changed[k]=true;
								ans[k]=strdup(inputmacro[j]);
						}
					}
				}
				break;
			}
			if(i==0)
				fl=0;
		}

		if(!fl){
			yyerror();
			exit(0);
		}

		for(int i=0;i<csize;++i){
			length+=strlen(ans[i]);
		}

		char * fans=malloc((length+5+csize)*sizeof(char));
		int cons=0;
		for(int i=0;i<csize;++i){
			fans[cons]=' ';
			cons++;
			for(int j=0;j<strlen(ans[i]);++j){
				fans[cons]=ans[i][j];
				cons++;
			}
		}
		fans[cons]=' ';
		fans[cons+1]='\0';
		return fans;

	}



%}

%union
{
		char * character;
}

%start Goal ;
%type <character> Goal
                  TypeIdentifierStar
                  TypeIdentifier
                  MethodInput
									MethodInput2
									MethodDecInput
									MethodDecInput2
                  MacroDefinitionStar
                  TypeDeclarationStar
                  MethodDeclarationStar
                  Expression
                  Integer
                  MacroDefinition
                  MainClass
                  TypeDeclaration
                  Identifier
                  Type
                  MethodDeclaration
                  Statement
                  StatementStar
                  PrimaryExpression
                  MacroDefStatement
                  MacroDefExpression
									MacroDecInput
									MacroDecInput2

%token String
       Return
       Equalto
       Print
       Public
       Static
       Void
       Main
       Define
       Class
       True
       False
       This
       New
			 Dot
       Comma
			 Hash
       Exclamation
       DotLength
       Or
       And
       Multiply
       Divide
       LessEqualto
       NotEqual
       Semicolon
       IF
			 Else
       While
       Int
       Bool
       Extend
       Integer
       Plus
       Minus
       End
       Identifier
       LeftCurly
       RightCurly
       LeftSquare
       RightSquare
       LeftRound
       RightRound
%%
Goal : MacroDefinitionStar MainClass TypeDeclarationStar End
{
  $$= concatenate2($2,$3);
	printf("%s",$$);
	return 0;

};


TypeDeclarationStar :
{
		$$ =copy("");
}
  |	TypeDeclaration TypeDeclarationStar
{
	$$= concatenate2($1,$2);
};

MethodDeclarationStar : MethodDeclaration MethodDeclarationStar
{
		$$= concatenate2($1,$2);
}
  |
{
		$$ =copy("");
};

TypeIdentifierStar :TypeIdentifierStar TypeIdentifier
{
		$$=concatenate2($1,$2);
}
  |
{
		$$ =copy("");
};

TypeIdentifier : Type Identifier Semicolon
{
	$$=concatenate3($1,$2,";");
};

StatementStar : Statement StatementStar
{
	$$=concatenate2($1,$2);
}
  |
{
		$$ =copy("");
};

MethodDecInput :
{
	$$ =copy("");
}
  | Type Identifier MethodDecInput2
{
	$$=concatenate3($1,$2,$3);
};

MethodDecInput2:
{
		$$ =copy("");
}
  | Comma Type Identifier MethodDecInput2
{
		$$=concatenate4(", ",$2,$3,$4);
};

MethodInput :
{
		$$ =copy("");
}
  | Expression MethodInput2
{
		$$ =concatenate2($1,$2);
};

MethodInput2:
{
		$$ =copy("");
}
  | Comma Expression MethodInput2
{
	$$=concatenate3(" , ",$2,$3);
};

MainClass : Class Identifier LeftCurly Public Static Void Main LeftRound String LeftSquare RightSquare Identifier RightRound LeftCurly Print LeftRound Expression RightRound Semicolon RightCurly RightCurly
{
		$$=concatenate2("class",concatenate6($2," {public static void main ( String[] ",$12," ) { System.out.println( ",$17," ) ;}} "));
};

TypeDeclaration : Class Identifier LeftCurly TypeIdentifierStar MethodDeclarationStar RightCurly
{
	$$= concatenate6("class ",$2," { ",$4,$5," } ");
}
  | Class Identifier Extend Identifier LeftCurly TypeIdentifierStar MethodDeclarationStar RightCurly
{
	$$=concatenate3("class ",$2, concatenate6(" extends ",$4," { ",$6,$7," } "));

};

MethodDeclaration : Public Type Identifier LeftRound MethodDecInput RightRound LeftCurly TypeIdentifierStar StatementStar Return Expression Semicolon RightCurly
{
	$$=concatenate6("public",$2,$3,"(",$5,concatenate6(" ) { ",$8,$9," return ",$11," ;} "));
};

Type: Int LeftSquare RightSquare
{
	$$=copy("int[]");
}
  | Int
{
	$$=copy("int");
}
  | Bool
{
	$$=copy("boolean");
}
  | Identifier
{
		$$=copy($1);
};

Statement : LeftCurly StatementStar RightCurly
{
		$$=concatenate3(" { ",$2," } ");
}
  | Print LeftRound Expression RightRound Semicolon
{
		$$=concatenate3(" System.out.println( ",$3," ); ");
}
  | IF LeftRound Expression RightRound Statement
{
  	$$ = concatenate4(" if ( ",$3," ) ",$5);
}
	| Identifier Equalto Expression Semicolon
{
		$$ = concatenate4($1," = ",$3," ; ");
}
	| Identifier LeftSquare Expression RightSquare Equalto Expression Semicolon
{
		$$= concatenate6($1," [ ", $3," ] = ",$6 ," ; ");
}
	| IF LeftRound Expression RightRound Statement Else Statement
{
		$$= concatenate6(" if ( ",$3," ) ", $5," else ",$7);
}
	| While LeftRound Expression RightRound Statement
{
		$$= concatenate4(" while ( ",$3," ) ",$5);
};
	| Identifier LeftRound MethodInput RightRound Semicolon
{
		$$= concatenate3("{ ",findinrecordstatement($1,$3)," }");
};



PrimaryExpression : Integer
{
	$$=copy($1);
}
	| True
{
		$$=copy(" true ");
}
 | False
{
		$$=copy(" false ");
}
	| Identifier
{
	$$ = copy($1);
}
	| This
{
		$$=copy(" this ");
}
 | New Int LeftSquare Expression RightSquare
{
		$$=concatenate3(" new int [ ",$4," ] ");
}
	| New Identifier LeftRound RightRound
{
		$$=concatenate3(" new ",$2," () ");
}
	| Exclamation Expression
{
		$$=concatenate2(" ! ",$2);
}
	| LeftRound Expression RightRound
{
		$$=concatenate3(" ( ",$2," ) ");
};


Expression: PrimaryExpression And PrimaryExpression
{
		$$=concatenate3($1," && ",$3);
}
	| PrimaryExpression Or PrimaryExpression
{
		$$=concatenate3($1," || ",$3);
}
	| PrimaryExpression NotEqual PrimaryExpression
{
		$$=concatenate3($1," != ",$3);
}
	| PrimaryExpression LessEqualto PrimaryExpression
{
		$$=concatenate3($1," <= ",$3);
}
	| PrimaryExpression Plus PrimaryExpression
{
		$$ = concatenate3($1," + ",$3);
}
	| PrimaryExpression Minus PrimaryExpression
{
		$$=concatenate3($1," - ",$3);
}
	| PrimaryExpression Multiply PrimaryExpression
{
		$$=concatenate3($1," * ",$3);
}
	| PrimaryExpression Divide PrimaryExpression
{
		$$=concatenate3($1," / ",$3);
}
	| PrimaryExpression LeftSquare PrimaryExpression RightSquare
{
		$$=concatenate4($1,"[ ",$3," ]");
}
	| PrimaryExpression DotLength
{
		$$=concatenate2($1,".length");
}
	| PrimaryExpression
{
		$$= copy($1);
}
	|  PrimaryExpression Dot Identifier LeftRound MethodInput RightRound
{
		$$ = concatenate6($1," . ",$3," ( ",$5," ) ");

};
	| Identifier LeftRound MethodInput RightRound
{
		$$= concatenate3("( " ,findinrecordexpression($1,$3)," )" );
};



MacroDecInput :
{
	$$=copy("");
}
	| Identifier MacroDecInput2
{
		$$=concatenate2($1,$2);
};

MacroDecInput2:
{
	$$=copy("");
}
	| Comma Identifier MacroDecInput2
{
	$$=concatenate3(", ",$2,$3);
};

MacroDefinition : MacroDefExpression
{
	$$=copy("");
}
	| MacroDefStatement
{
	$$=copy("");
}
;

MacroDefStatement: Hash Define Identifier LeftRound MacroDecInput RightRound LeftCurly StatementStar RightCurly
{
	$$= copy("");
	recordstatement($3,$5,$8);
};

MacroDefExpression : Hash Define Identifier LeftRound MacroDecInput RightRound LeftRound Expression RightRound
{
		$$=copy("");
		recordexpression($3,$5,$8);
};

MacroDefinitionStar :  MacroDefinitionStar MacroDefinition
{
		$$=copy("");
}
  |
{
		$$=copy("");
};


%%

int yyerror()
{
	printf ("// Failed to parse macrojava code.\n");
	return 0;
}
int main ()
{
	yyparse();
	return 0;
}
