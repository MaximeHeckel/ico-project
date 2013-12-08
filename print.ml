open PPsyntax;;
open Format;;

let rec typ() = function
  | Integer -> sprintf "integer"
  | Boolean -> sprintf "boolean"
  | Array t -> sprintf "array of %a" type_expr t

let binop op =
  printf "%s"
    begin match op with
      | Plus -> "+"
      | Minus -> "-"
      | Times -> "*"
      | Div ->  "/"
      | Ge -> ">="
      | Gt -> ">"
      | Le -> "<="
      | Lt -> "<"
      | Eq -> "="
      | Ne ->"<>"
      end
;;

let plusbas = 0;;
let plushaut = 4;;

let priorite = function
  | Plus | Minus -> 2
  | Times | Div -> 3
  | _ -> 1;;

let rec expr e = function
  | Int n -> printf "%d" n
  | Bool boo -> printf "%s" ( if boo then "true" else "false" )
  | Get s -> printf "%s" s;
  | Bin (op, e1, e2) ->
      let pop = priorite op in
      let b = p > pop in
      let p' = if b then 0 else pop in (* 0 = priorite plus basse *)
      if b then printf "(";
      expr p' e1;
      binop op;
      expr p' e2;
      if b then printf ")";
  | Get2 (e1, e2) ->
      expr plushaut e1;
      printf "[";
      expr plusbas  e2;
      printf "]";
  | Alloc (e, t) ->
      printf "alloc (";
      expr plusbas e;
      printf ":";
      type_expr t;
      printf ")";
  | Function_call(s,t) ->
      printf "%s(%a)" s(fun out t -> list ", " (expr plusbas) t) t;
;;

let expression p e =
  printf "[";
  expr p e;
  printf "]";;

(* let rec instruction *)
(* let definition s f *)
(* let program p *)
