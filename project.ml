(*Définition du type arbre binaire polymorphe*)

type 'a arbre = Vide | Feuille of 'a | Noeud of (
  'a arbre)*('a arbre);;

type expression =
  | Evar of int
  | Evarb of bool
  | Emoinun of int
  | Eadd of expression * expression
  | Emul of expression * expression
  | Ecomp of expression * expression
  | EAssign of string * expression;;


