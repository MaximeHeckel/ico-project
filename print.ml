open Printf
open Print
open Primitive
open PPsyntax

let rec typ() = function
  | TInt -> sprintf "integer"
  | TBool -> sprintf "boolean"
  | TArray -> sprintf "array of %a" typ t
