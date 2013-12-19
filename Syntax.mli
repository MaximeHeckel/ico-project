(* Définition du type type_expr en accord avec l'énoncé contenant les int les bool et les tableaux de type_expr *)
type type_expr =
    Integer
  | Boolean 
  | Array of type_expr;;

type var_list = ((string list) * type_expr) list;;

type program =Program of var_list * (func_def list) * instruction

and func_def = Func_def of string * definition

and definition = Definition of var_list * type_expr option * var_list * instruction

and expression =
  (* Définition du type expression en accord avec l'énoncé contenant les éléments suivants : *)
  | Int of int | Bool of bool
    (* Constantes *)
  | Un of unop * expression
    (* Moins unaire*)
  | Bin of binop * expression * expression
    (* Expressions arithétiques *)
  | Get of string
    (* Accès à une variable *)
  | Function_call of string * expression list
    (* Appel de fonction *)
  | Geti of expression * expression
    (* Accès dans un tableau à une position *)
  | Alloc of expression * type_expr
    (* Création d'un tableau d'une certaine taille *)
  | New of type_expr
    (* Création objet*)
  | Read
  | Readln

and binop =
  (* Définition du type opérateur binaire donnant les opération arithmétiques basiques ainsi que les opérateur de comparason *)
  | Plus
  | Minus
  | Times
  | Div
    (* Arithmétique *)
  | Or
  | And
  | Lt
  | Le
  | Gt
  | Ge
  | Eq
  | Ne
    (* Comparaisons *)

and unop =
  | UMinus | Not

and instruction =
  (* Définition du type instruction en accord avec l'énoncé contenant les éléments suivants : *)
  | Set of string * expression
    (* Affectation d'une variable *)
  | Sequence of instruction list
    (* Suite d'instructions *)
  | If of expression * instruction * instruction
  | While of expression * instruction
  | Procedure_call of string * expression list
    (* Appel de procédure *)
  | Write of expression
  | Writeln of expression
    (* Ecriture d'un entier sans ou avec retour à la ligne *)
  | Seti of expression * expression * expression
