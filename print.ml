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

let constant() = function
  | ConstBool true -> sprintf "true"
  | ConstBool false -> sprintf "false"
  | ConstInt i -> sprintf "%ld" i

let fundef() (x, t) =
  sprintf "%s : %a" x typ t
