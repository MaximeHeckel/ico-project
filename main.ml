(* file: main.ml *)
open Graph

let main () =
  try
  let name = Sys.argv.(1) in
  let ic = open_in name in
    let lexbuf = Lexing.from_channel ic in
    while true do
      let parse = Pseudopascal.input Lexer.token lexbuf in
      let graph = make_call_graph parse in print_call_graph graph name;
      exit 0;
    done
  with End_of_file -> exit 0
;;

let _ = Printexc.print main ()
;;

main()
;;
