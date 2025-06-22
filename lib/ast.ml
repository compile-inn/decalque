type exp =
  | Int of int
  | Float of float
  | Add of exp * exp
  | Substract of exp * exp
  | Multiply of exp * exp
  | Divide of exp * exp
  | Negate of exp
  | Mod of exp * exp 
  | Word of string 
  | Phrase of string
  | Concat of exp * exp (* concatenation of two strings *)
  | Remove of exp * exp (* removes a substring from a string *)
  | Even of exp
  | Odd of exp
