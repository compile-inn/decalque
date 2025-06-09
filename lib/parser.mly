%token EOF
%token <int> INT
%token <float> FLOAT
%token <string> WORD PHRASE
%token DQUOTE
%token PLUS MINUS
%token TIMES DIVIDE
%token UMINUS
%token MOD
%token CONCAT
%token REMOVE
%token EVEN 
%token ODD

%start<Ast.exp> main

%left PLUS MINUS
%left TIMES DIVIDE
%left CONCAT

%nonassoc UMINUS REMOVE MOD EVEN ODD

%{ open Ast %}

%%

(* Grammar *)

main: expr EOF { $1 }

expr:
| INT { Int $1 }
| FLOAT { Float $1 }
| expr PLUS expr { Add ($1, $3) }
| expr MINUS expr { Substract ($1, $3) }
| expr TIMES expr { Multiply ($1, $3) }
| expr DIVIDE expr { Divide ($1, $3) }
| MINUS expr %prec UMINUS { Negate $2 }
| expr MOD expr { Mod ($1, $3) }
| DQUOTE x = WORD DQUOTE { Word x }
| DQUOTE p = PHRASE DQUOTE { Phrase p }
| expr CONCAT expr { Concat ($1, $3) }
| expr REMOVE expr { Remove ($1, $3) }
| EVEN expr { Even $2 }
| ODD expr { Odd $2 }

%%