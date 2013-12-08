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

let priorite = function
  | Plus | Minus ->2
  | Times | Div -> 3
  | _ -> 1;;
