(* file: main.ml *)
open Graph

let main () =
  try
    let name = Sys.argv.(1) in
    let ic = open_in name in

      let lexbuf = Lexing.from_channel stdin in
      while true do
        let output = Pseudopascal.input Lexer.token lexbuf in
        let graph = call_graph output in print_call_graph graph_appel name;
      done
    with End_of_file -> exit 0
;;

let _ = Printexc.print main ()
;;

main()
;;
