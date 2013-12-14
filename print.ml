open PPsyntax;;
open Format;;

let rec type_expr = function
    Integer -> printf "Integer"
  | Boolean -> printf "Boolean"
  | Array t -> printf "Array (%a)" (out type_expr) t
;;

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
  | Geti (e1, e2) ->
      expr plushaut e1;
      printf "[";
      expr plusbas  e2;
      printf "]";
  | Alloc(e, t) ->
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
let rec instruction = function
  | Set(s,e) -> printf "%s := %a" s(fun out -> expression plusbas) e;
  | Sequence[i] -> instruction i;
  | If(e,t1,t2) ->
      printf "If";
      expression plusbas e;
      printf "Then";
      instruction t1;
      printf "Else";
      instruction t2;

  | While(e,i) ->
      printf "While";
      expression plusbas e;
      printf "do";
      instruction i;
  | Procedure_call(s, l) ->
      printf "%s (" s;
      list ", " (expression plusbas) l;
      printf ")"
  | Seti(e1, e2, e3) ->
      expression plushaut e1;
      printf "[";
      expression plusbas e2;
      printf "] := ";
      expression plusbas e3;
  | Write_int n -> instruction(Procedure_call("write", [n]));
  | Writeln_int n -> instruction(Procedure_call("writeln", [n]));
  | Read_int x -> instruction(Procedure_call("read", [Get x]));
;;

let definition(s,f) =
  printf "%s %s" (match f.result with
    | None -> "Procedure"
    | _ -> "function"
  ) s;
  printf "[(";
  list (fun x -> printf "var "; var x) f.arguments;
  printf ")";
  option (fun t -> (printf " : "; type_expr t)) f.result;
  printf " ]";
  declarations f.local_vars;
  instruction f.body;
  printf "; ";;

let definitions list =
  List.iter definition list;;

let program p =
  printf "Program ";
  declarations p.global_vars;
  printf " ";
  definitions p.definitions;
  instruction p.main;
  printf " ;;";
  print_newline();
;;
