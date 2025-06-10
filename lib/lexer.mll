let space = [' ' '\r' '\t']+

let digit = ['0'-'9']

let word = ['a'-'z' 'A'-'Z']*


(* Because of 'precedence' [space] and [digit] cannot be tokenized as WORD when
    they are passed as singletons. *)
rule token = 
    parse
    | space { token lexbuf }
    | '\n' { Parser.EOF }
    | '+' { Parser.PLUS }
    | '-' { Parser.MINUS } 
    | '*' { Parser.TIMES }
    | '/' { Parser.DIVIDE }
    | '(' { Parser.LPAREN }
    | ')' { Parser.RPAREN }
    | '"' { Parser.DQUOTE }
    | '^' { Parser.CONCAT }
    | '#' { Parser.REMOVE }
    | ":mod" { Parser.MOD }
    | ":is_even" { Parser.EVEN }
    | ":is_odd" { Parser.ODD }
    | digit+ '.' digit* { Parser.FLOAT (float_of_string (Lexing.lexeme lexbuf))}
    | digit+ { Parser.INT (int_of_string (Lexing.lexeme lexbuf)) }
    | word { WORD (Lexing.lexeme lexbuf) }
    | (word (space word)*) { PHRASE (Lexing.lexeme lexbuf) }
    | eof { Parser.EOF }