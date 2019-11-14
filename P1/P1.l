%{
	#include <stdio.h>
	#include "P1.tab.h"
	#include <string.h>
  /* void yylex() */

%}

digit [0-9]
integer (0|([1-9]{digit}*))
space "\t"|"\n"|"\r"|"\f"|" "
identifier [_a-zA-Z][_a-zA-Z0-9]*

%%
"//".* {;}
"+" {return Plus;}
"-" {return Minus;}
";" {return Semicolon;}
"if" {return IF;}
"else" {return Else;}
"(" {return LeftRound;}
"=" {return Equalto;}
")" {return RightRound;}
"[" {return LeftSquare;}
"]" {return RightSquare;}
"{" {return LeftCurly;}
"}" {return RightCurly;}
"." {return Dot;}
"," {return Comma;}
"!" {return Exclamation;}
"||" {return Or;}
"&&" {return And;}
"*" {return Multiply;}
"/" {return Divide;}
"<=" {return LessEqualto;}
"!=" {return NotEqual;}
"true" {return True;}
"false" {return False;}
"this" {return This;}
"new" {return New;}
"class" {return Class;}
"static" {return Static;}
"void" {return Void;}
"main" {return Main;}
".length" {return DotLength;}
"while" {return While;}
"boolean" {return Bool;}
"public" {return Public;}
"extends" {return Extend;}
"return" {return Return;}
"String" {return String;}
"#" {return Hash;}
"define" {return Define;}
"int" {return Int;}
"System.out.println" {return Print;}
<<EOF>> {return End;}
{integer} {yylval.character=strdup(yytext);return Integer ;}
{identifier} {yylval.character=strdup(yytext);return Identifier;}
{space} {;}
%%

/* int yywrap(){} */

/* int main()
{
  printf("Enter the input:\n");
  yylex();
} */
