type expression =
  | Econst of constant
  | EGetVar of string
  | EUnOp of unop * expression
  | EBinOp of expression * binop * expression
  | EArrayGet of expression * expression
  | EArrayAlloc of typ * expression

(* Manque l'appel de fonction *)

and constant =
  | ConstBool of bool
  | ConstInt of int32

(* and unop *)

and condition =
  | CExpression of expression
  | CNot of condition
  | CAnd of condition * condition
  | COr of condition * condition

and instruction =
  | IProcCall of call * expression list (* call par défaut je ne savais pas quoi mettre a voir*)
  | ISetVar of string * expression
  | ISetArray of expression * expression * expression (* Paramêtres : Tableau, index , éléments *)
  | IIf of condition * instruction * instruction
  | IWhile of condition * instruction
  | IBegin of expression list
