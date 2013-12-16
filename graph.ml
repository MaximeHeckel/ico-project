open Syntax;;

let rec call_graph_expr g =
  match g with
  | Un(u,e) -> call_graph_expr e
  | Bin(b,e1,e2) -> (call_graph_expr e1) @ (call_graph_expr e2)
  | Function_call(s,e::e1)-> (call_graph_expr e) @ (call_graph_expr (Function_call(s,e1))) @ [s]
  | Function_call(s, _) -> [s]
  | Geti(e1,e2) -> (call_graph_expr e1) @ (call_graph_expr e2)
  | Readln -> ["READLN"]
  | _ -> []
;;

let rec call_graph_instruction g =
  match g with
  | Sequence(i::l) -> (call_graph_instruction i) @ (call_graph_instruction(sequence(l)))
  | Set(s,e) -> (call_graph_expr e)
  | If(e,i1,i2) -> (call_graph_expr e) @ (graph_instruction i1) @ (graph_instruction i2)
  | While(e,i) -> (call_graph_expr e) @ (call_graph_instruction i)
  | Procedure_call(s,e::e1) -> (call_graph_expr e) @ (call_graph_instruction (Procedure_call(s,e1))) @ [s]
  | Procedure_call(s,_) -> [s]
  | Seti(e1,e2,e3) -> (call_graph_expr e1) @ (call_graph_expr e2) @ (call_graph_expr e3)
  | Write(e) -> ["WRITE"] @ (call_graph_expr e)
  | Writeln(e) -> ["WRITELN"] @ (call_graph_expr e)
  | _ -> []
;;

let rec call_graph_fonction
