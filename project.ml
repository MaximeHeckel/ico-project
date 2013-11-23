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
  (*| Earr of expression[expression]*)
  | EAssign of string * expression;;

type programme =
  | Pvar of expression
  | Pfun of fonction
  | Pproc of procedure

type instruction =
  | Iaff of expression
   ;;
(* cf page 91 de la bible faut en discuter*)
