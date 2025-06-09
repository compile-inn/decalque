
(* The type of tokens. *)

type token = 
  | WORD of (string)
  | UMINUS
  | TIMES
  | REMOVE
  | PLUS
  | PHRASE of (string)
  | ODD
  | MOD
  | MINUS
  | INT of (int)
  | FLOAT of (float)
  | EVEN
  | EOF
  | DQUOTE
  | DIVIDE
  | CONCAT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.exp)
