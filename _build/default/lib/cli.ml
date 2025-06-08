type value = 
   | VInt of int
   | VFloat of float
   | VWord of string
   | VBool of bool

type ope =
   | Plus
   | Subs
   | Mul
   | Div

let value_to_string = function
   | VInt n -> string_of_int n
   | VFloat f -> string_of_float f
   | VWord v -> v
   | VBool b -> string_of_bool b

let rec eval = function
  | Ast.Int n -> VInt n 

  | Float f -> VFloat f

  | Add (a, b) -> 
    eval_bop Plus a b
      
  | Substract (a, b) -> 
    eval_bop Subs a b 

  | Multiply (a, b) -> 
    eval_bop Mul a b

  | Divide (a, b) -> 
    eval_bop Div a b
  
  | Negate e -> 
    (match eval e with
    | VInt n -> VInt (- n)
    | VFloat f -> VFloat (-. f)
    | _ -> failwith "Cannot negate expression")
  
  | Mod (a, b) ->
    (match (eval a, eval b) with
    | VInt na, VInt nb -> VInt (na mod nb)
    | _, _ -> failwith  "Mod operands needs to be int.")

  | Word v -> VWord v
  | Ast.Phrase p -> VWord p
  
  | Concat (a, b) -> 
    (match (eval a, eval b) with
    | VWord wa, VWord wb -> VWord (wa ^ wb)
    | _, _ -> failwith "Can only add text")

  | Ast.Remove (a, b) ->
    (match (eval a, eval b) with
    | VWord wa, VWord wb -> 
      let reg = Str.regexp wb in let templ = "" in VWord (Str.global_replace reg templ wa)
    | _, _ -> failwith "Cannot remove, use substract instead."
      )

and eval_bop op e1 e2 =  match eval e1, eval e2 with
    | VInt na, VInt nb -> i_operate op na nb
    | VFloat fa, VInt nb -> f_operate op fa (float nb)
    | VInt na, VFloat fb -> f_operate op (float na) fb
    | VFloat fa, VFloat fb -> f_operate op fa fb    
    | _, _ -> failwith "Cannot operate on text" 

and f_operate op a b = match op with
    | Plus -> VFloat (a +. b)
    | Subs -> VFloat (a -. b)
    | Mul -> VFloat (a *. b)
    | Div -> 
        if b <> 0.0 then VFloat (a /. b) 
        else failwith "division by zero"

and i_operate op a b = match op with
    | Plus -> VInt (a + b)
    | Subs -> VInt (a - b)
    | Mul -> VInt (a * b)
    | Div -> 
      if b <> 0 then VInt (a / b) 
      else failwith "division by zero"

let info = Cmdliner.Cmd.info "decalque"

let eval_lb lb =
  try
    let expr = Parser.main Lexer.token lb in
    let v = eval expr in
    Printf.printf "%s\n" (value_to_string v)
  with Parser.Error ->
    Printf.printf "parse error near character %d" lb.lex_curr_pos

let repl () =
  while true do
    Printf.printf "<decalque>> %!";
    let lb = Lexing.from_channel Stdlib.stdin in
    eval_lb lb
  done

let term =
  let open Cmdliner.Term.Syntax in
  let+ expr_opt =
    let open Cmdliner.Arg in
    value & opt (some string) None & info [ "e" ]
  in
  match expr_opt with
  | Some s -> eval_lb (Lexing.from_string s)
  | None -> repl ()

let cmd = Cmdliner.Cmd.v info term
let main () = Cmdliner.Cmd.eval cmd |> Stdlib.exit