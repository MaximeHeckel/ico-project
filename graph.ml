open Syntax;;

let rec call_graph_expr g =
  match g with
  | Un(u,e) -> call_graph_expr e
  | Bin(b,e1,e2) -> (call_graph_expr e1) @ (call_graph_expr e2)
  | Function_call(s,e::e1)-> (call_graph_expr e) @ (call_graph_expr (Function_call(s,e1))) @ [s]
  | Function_call(s, _) -> [s]
  | Geti(e1,e2) -> (call_graph_expr e1) @ (call_graph_expr e2)
  | Readln -> ["Readln"]
  | _ -> []
;;
