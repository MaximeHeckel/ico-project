open Printf
open Print
open Primitive
open PPsyntax

let rec typ() = function
  | TInt -> sprintf "integer"
  | TBool -> sprintf "boolean"
  | TArray -> sprintf "array of %a" typ t

let binop = function
  | OAdd -> sprintf "+"
  | OSub -> sprintf "-"
  | OMult -> sprintf "*"
  | ODiv -> sprintf "/"
  | OGe -> sprintf ">="
  | OGt -> sprintf ">"
  | OLe -> sprintf "<="
  | OLt -> sprintf "<"
  | OEq -> sprintf "="
  | ONeq -> sprintf "<>"

let constant() = function
  | ConstBool true -> sprintf "true"
  | ConstBool false -> sprintf "false"
  | ConstInt i -> sprintf "%ld" i

let fundef() (x, t) =
  sprintf "%s : %a" x typ t
