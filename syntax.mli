type expression =
  | Econst of constant
  | EGetVar of string
  | EUnOp of unop * expression
  | EBinOp of expression * binop * expression
  | EArrayGet of expression * expression
  | EArrayAlloc of typ * expression

and constant =
  | ConstBool of bool
  | ConstInt of int32
