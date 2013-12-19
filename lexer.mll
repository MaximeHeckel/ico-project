(* Analyseur lexical *)
(* On associe à chaque opérateur et chaque mots clés un tocken *)
{
  open Pseudopascal
}
let digit = ['0'-'9']

rule token = parse
 | [' ' '\t' '\n']        { token lexbuf }
  | ['{']([^'}'])*['}'] { token lexbuf }
  | digit+ as num { NUM (int_of_string num) }
  | ';'   { SEMICOLON }
  | "("   { LPAREN }
  | ")"   { RPAREN }
  | "["   { LBRACKET }
  | "]"   { RBRACKET }
  | ":="  { COLONEQ }
  | ":"   { COLON }
  | ","   { COMMA }
  | "." { DOT }
  | "<"   { LT }
  | "<="  { LE }
  | ">"   { GT }
  | ">="  { GE }
  | "="   { EQ }
  | "<>"  { NE }
  | '+'   { PLUS }
  | '-'   { MINUS }
  | '*'   { TIMES }
  | '/'   { DIV }
  | "var"  { VAR }
  | "false" { BOOL false }
  | "true"  { BOOL true }
  | "readln" { READLN }
  | "read"    { READ }
  | "write"   { WRITE }
  | "writeln" { WRITELN }
  | "program"  { PROGRAM }
  | "begin"  { BEGIN }
  | "end"  { END }
  | "procedure"  { PROCEDURE }
  | "function" { FUNCTION }
  | "integer"  { INTEGER }
  | "boolean"  { BOOLEAN }
  | "if"  { IF }
  | "then"  { THEN }
  | "else"  { ELSE }
  | "array" { ARRAY }
  | "of"    { OF }
  | "while" { WHILE }
  | "do"    { DO }
  | "or"    { OR }
  | "and"   { AND }
  | "not" { NOT}
  | "type" { TYPE }
  | "new" { NEW }
  | ['A'-'Z''a'-'z']['A'-'Z''a'-'z''0'-'9']* as id { ID (id) }
  | eof                { raise End_of_file }
