%{
  #include "tokens.h"
  #include <stdio.h>
%}


digit [0-9]
integer {digit}+
alphabetic [a-zA-Z_]
especial_caracter [,!;:\(\)\[\]\{\}\+\-\|\?\@\*\/\<\>\=\&\%\#\.\$^~`]
alphanumeric {alphabetic}|{digit}

line_break [ \t\n\r\f\v]

exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?


identifier {alphabetic}+{alphanumeric}*
identifier_error {digit}+[{alphabetic}]+

char \'({alphanumeric}|{especial_caracter})\'
char_error (''|\'({alphanumeric}|{especial_caracter})+\')

double_quotes \"[{alphanumeric}{especial_caracter}]+\"

lines_comment \/\*.*{line_break}*\*\/
line_comment \/\/.*

sl \<\<
less_equal \<\=
or \|\|

%%

int { return TK_PR_INT; }
float { return TK_PR_FLOAT; }
bool { return TK_PR_BOOL; }
char { return TK_PR_CHAR; }
string { return TK_PR_STRING; }
if { return TK_PR_IF; }
then { return TK_PR_THEN; }
else { return TK_PR_ELSE; }
while { return TK_PR_WHILE; }
do { return TK_PR_DO; }
input { return TK_PR_INPUT; }
output { return TK_PR_OUTPUT; }
return { return TK_PR_RETURN; }
const { return TK_PR_CONST; }
static { return TK_PR_STATIC; }
foreach { return TK_PR_FOREACH; }
for { return TK_PR_FOR; }
switch { return TK_PR_SWITCH; }
case { return TK_PR_CASE; }
break { return TK_PR_BREAK; }
continue { return TK_PR_CONTINUE; }
class { return TK_PR_CLASS; }
private { return TK_PR_PRIVATE; }
public { return TK_PR_PUBLIC; }
protected { return TK_PR_PROTECTED; }
end { return TK_PR_END; }
default { return TK_PR_DEFAULT; }

{especial_caracter} {int caracter = *yytext; return caracter;}

{less_equal} {return TK_OC_LE;}
>= { return TK_OC_GE; }
== { return TK_OC_EQ; }
!= { return TK_OC_NE; }
&& { return TK_OC_AND; }
{or} { return TK_OC_OR; }
>> { return TK_OC_SR; }
{sl} { return TK_OC_SL; }

{integer} { return TK_LIT_INT; }
{real} { return TK_LIT_FLOAT; }
false { return TK_LIT_FALSE; }
true  { return TK_LIT_TRUE; }
{char} { return TK_LIT_CHAR;}
{double_quotes} {return TK_LIT_STRING;}

{identifier} { return TK_IDENTIFICADOR;}

{lines_comment} {}
{line_comment} {}

{identifier_error} {return TOKEN_ERRO;}
{char_error} {return TOKEN_ERRO;}

%%

int get_line_number() {
  return 1;
}