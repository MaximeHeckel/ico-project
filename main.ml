open Graph

let main () =
  try
  let name = Sys.argv.(1) in
  (* Prend en argument le fichier à parser *)
  let ic = open_in name in
    let lexbuf = Lexing.from_channel ic in
    (* Appel du lexer*)
    while true do
      let parse = Pseudopascal.input Lexer.token lexbuf in
      (* Parsage du fichier selectionné *)
      let graph = make_call_graph parse in print_call_graph graph name;
      (* Création et exportation du graphe d'appel *)
      exit 0;
    done
  with End_of_file -> exit 0
;;

let _ = Printexc.print main ()
;;

main()
;;
