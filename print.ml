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
