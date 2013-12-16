open Syntax;;

let rec call_graph_expr g =
  match g with
  | Un(u,e) -> call_graph_expr e
  | Bin(b,e1,e2) -> (call_graph_expr e1) @ (call_graph_expr e2)
  | Function_call(s,e::e1)-> (call_graph_expr e) @ (call_graph_expr (Function_call(s,e1))) @ [s] (* cf Joris *)
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
  | Procedure_call(s,e::e1) -> (call_graph_expr e) @ (call_graph_instruction (Procedure_call(s,e1))) @ [s] (* cf Joris*)
  | Procedure_call(s,_) -> [s]
  | Seti(e1,e2,e3) -> (call_graph_expr e1) @ (call_graph_expr e2) @ (call_graph_expr e3)
  | Write(e) -> ["WRITE"] @ (call_graph_expr e)
  | Writeln(e) -> ["WRITELN"] @ (call_graph_expr e)
  | _ -> []
;;

let rec remove_dups lst = match lst with
  | [] -> []
  | h::t -> h::(remove_dups (List.filter (fun x -> x<>h) t))
;;

let rec call_graph_fonction f call_graph =
  match f with
  | Func_def(n, Definition(w,x,c,i))::r -> call_graph_fonction r call_graph;
  (*(List.iter (Hashtbl.add graph_appel n) (remove_dups(make_call_graph_instr i))) Merci Joris \o/*)
;;

let make_call_graph arbresyn = (*cf Joris*)
  let t_hash = Hashtbl.create 100 in
    match arbresyn with
    | Program(var_decl, fonctions, instructions) -> call_graph_fonction r graph_appel;
      (List.iter (Hashtbl.add t_hash "program") (remove_dups(make_call_graph_instr instructions))) ;
      t_hash
;;

let print_call_graph_couple i f init =
  init^" "^i^" -> "^f^";\n"
;;

let print_call_graph graph name =
  let dotfile = open_out("export/"^name^".dot") in
  output_string dotfile("digraph "^name^"\n {");
  output_string dotfile(Hashtbl.fold print_call_graph_couple graph);
  output_string dotfile "}\n";
  close_out dotfile
;;

