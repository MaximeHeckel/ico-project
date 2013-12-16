type token =
  | NEWLINE
  | SEMICOLON
  | LPAREN
  | RPAREN
  | NUM of (float)
  | PLUS
  | MINUS
  | MULTIPLY
  | DIVIDE
  | BEGIN
  | END

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  257 (* NEWLINE *);
  258 (* SEMICOLON *);
  259 (* LPAREN *);
  260 (* RPAREN *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* MULTIPLY *);
  265 (* DIVIDE *);
  266 (* BEGIN *);
  267 (* END *);
    0|]

let yytransl_block = [|
  261 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\000\000\002\000\001\000\002\000\002\000\001\000\003\000\003\000\
\003\000\003\000\002\000\003\000\005\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\003\000\000\000\006\000\000\000\000\000\
\002\000\000\000\000\000\011\000\000\000\000\000\004\000\005\000\
\000\000\000\000\000\000\000\000\012\000\000\000\014\000\000\000\
\000\000\009\000\010\000\000\000\013\000"

let yydgoto = "\002\000\
\003\000\009\000\010\000"

let yysindex = "\017\000\
\000\000\000\000\030\255\000\000\056\255\000\000\056\255\038\255\
\000\000\045\255\061\255\000\000\056\255\254\254\000\000\000\000\
\056\255\056\255\056\255\056\255\000\000\049\255\000\000\002\255\
\002\255\000\000\000\000\246\254\000\000"

let yyrindex = "\000\000\
\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\255\
\023\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\251\255"

let yytablesize = 70
let yytable = "\011\000\
\029\000\012\000\014\000\017\000\018\000\019\000\020\000\022\000\
\023\000\019\000\020\000\024\000\025\000\026\000\027\000\007\000\
\007\000\001\000\007\000\015\000\007\000\007\000\000\000\008\000\
\008\000\007\000\008\000\000\000\008\000\008\000\004\000\000\000\
\005\000\008\000\006\000\000\000\007\000\000\000\013\000\008\000\
\005\000\000\000\006\000\000\000\007\000\015\000\016\000\008\000\
\000\000\028\000\017\000\018\000\019\000\020\000\017\000\018\000\
\019\000\020\000\005\000\000\000\006\000\000\000\007\000\000\000\
\021\000\008\000\017\000\018\000\019\000\020\000"

let yycheck = "\005\000\
\011\001\007\000\008\000\006\001\007\001\008\001\009\001\013\000\
\011\001\008\001\009\001\017\000\018\000\019\000\020\000\001\001\
\002\001\001\000\004\001\000\000\006\001\007\001\255\255\001\001\
\002\001\011\001\004\001\255\255\006\001\007\001\001\001\255\255\
\003\001\011\001\005\001\255\255\007\001\255\255\001\001\010\001\
\003\001\255\255\005\001\255\255\007\001\001\001\002\001\010\001\
\255\255\001\001\006\001\007\001\008\001\009\001\006\001\007\001\
\008\001\009\001\003\001\255\255\005\001\255\255\007\001\255\255\
\004\001\010\001\006\001\007\001\008\001\009\001"

let yynames_const = "\
  NEWLINE\000\
  SEMICOLON\000\
  LPAREN\000\
  RPAREN\000\
  PLUS\000\
  MINUS\000\
  MULTIPLY\000\
  DIVIDE\000\
  BEGIN\000\
  END\000\
  "

let yynames_block = "\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 24 "pseudopascal.mly"
                   ( )
# 112 "pseudopascal.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 25 "pseudopascal.mly"
              ( )
# 120 "pseudopascal.ml"
               : unit))
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "pseudopascal.mly"
               ( )
# 126 "pseudopascal.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 28 "pseudopascal.mly"
               ( Printf.printf "\t%.10g\n" _1; flush stdout )
# 133 "pseudopascal.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 29 "pseudopascal.mly"
                 ( Printf.printf "\t%.10g\n" _1; flush stdout )
# 140 "pseudopascal.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 31 "pseudopascal.mly"
           ( _1 )
# 147 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 32 "pseudopascal.mly"
                 ( _1 +. _3 )
# 155 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 33 "pseudopascal.mly"
                  ( _1 -. _3 )
# 163 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 34 "pseudopascal.mly"
                    ( _1 *. _3 )
# 171 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 35 "pseudopascal.mly"
                  ( _1 /. _3 )
# 179 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 36 "pseudopascal.mly"
                       ( -. _2 )
# 186 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 37 "pseudopascal.mly"
                     ( _2 )
# 193 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    Obj.repr(
# 38 "pseudopascal.mly"
                                  ( _3 )
# 200 "pseudopascal.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 39 "pseudopascal.mly"
                  ( _2 )
# 207 "pseudopascal.ml"
               : 'exp))
(* Entry input *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let input (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
;;
# 42 "pseudopascal.mly"

# 234 "pseudopascal.ml"
