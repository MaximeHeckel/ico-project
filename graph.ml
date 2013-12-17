open Syntax;;

let rec call_graph_expr g =
  (* Fonction call_graph_expr qui match récursivement une expression
   * Si c'est un opérateur unaire on appelle la fonction sur e
   * Si c'est unopérateur binaire on appelle la fonction sur e1 et e2
   * Si c'est un appel de fonction on appelle la fonction sur e et sur l'appel de fonction de la séquence de la queue de la liste d'expression
   * On ajoute également la possibilité d'appeler un élément d'un tableau*)
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
  (* Fonction call_graph instruction qui match récursivement une instruction
   * Si c'est une séquence d'instruction sur la tête de la liste puis sur la séquence de la queue de la liste
   * Si on a un opérateur conditionnel on appelle la fonction sur les deux instructions ainsi que la fonction callgraph_expr sur l'expression conditionnelle
   * Pour l'affectation on applique call_graph_expr sur l'expression en question
   * Pour la boucle while on appelle callgraph_expr sur l'expression qui lance la boucle et call_graph_instruction sur l'instruction en question
   * Pour les séquences de procédure on fait de même qu'avec callgraph_expr sauf que l'on applique récursivement cette fois call_graph_instruction sur la queue de la liste
   * On appelle call_graph_expr lorsqu'il s'agit d'indexer une nouvelle valeur dans un tableau*)
  match g with
  | Sequence(i::l) -> (call_graph_instruction i) @ (call_graph_instruction(Sequence(l)))
  | Set(s,e) -> (call_graph_expr e)
  | If(e,i1,i2) -> (call_graph_expr e) @ (call_graph_instruction i1) @ (call_graph_instruction i2)
  | While(e,i) -> (call_graph_expr e) @ (call_graph_instruction i)
  | Procedure_call(s,e::e1) -> (call_graph_expr e) @ (call_graph_instruction (Procedure_call(s,e1))) @ [s]
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
  (* Fonction récursive call_graph_fonction qui va appliquer récursivement call_graph_instruction sur l'ensemble des
   * instructions de la fonction et renvoyer la table de hash correspondante*)
  match f with
  | Func_def(n, Definition(w,x,c,i))::r -> call_graph_fonction r call_graph;
    (List.iter (Hashtbl.add call_graph n) (remove_dups(call_graph_instruction i)))
  | _ -> ()
;;

let make_call_graph arbresyn =
  (* Fonction mettnt en place la table de hash associant la grammaire avec les différentes instructions *)
  let t_hash = Hashtbl.create 100 in
    match arbresyn with
    | Program(var_decl, fonctions, instructions) -> call_graph_fonction fonctions t_hash;
      (List.iter (Hashtbl.add t_hash "program") (remove_dups(call_graph_instruction instructions))) ;
      t_hash
;;

let print_call_graph_couple i f init =
  init^" "^i^" -> "^f^";\n"
;;

let print_call_graph graph name =
  (* Fonction permettant d'exporter le graph d'appel en .dot obtenu *)
  let dotfile = open_out(""^name^".dot") in
  print_string ("digraph diagprog\n{\n program;\n"^ (Hashtbl.fold print_call_graph_couple graph "") ^ "}\n");
  close_out dotfile
;;

