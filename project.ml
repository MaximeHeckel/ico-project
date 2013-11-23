(*Définition du type arbre binaire polymorphe*)

type 'a arbre = Vide | Feuille of 'a | Noeud of (
  'a arbre)*('a arbre);;

type programme =
  | Pvar of expression
  | Pfun of fonction
  | Pproc of procedure;;

type expression =
  | Const of int
  | Var of string
  | Bool of bool
  | Moinun of int
  | Add of operateur * expression * expression
  | Mul of operateur * expression * expression
  | Comp of comparaison * expression * expression
  (*| Earr of expression[expression]*)
  | Assign of string * expression;;

type operateur =  Plus | Moins | Mult | Div;;
type comparaison = Gt | Lt | Gte | Lte | Equals | NonEq;;


type instruction =
  | Iaff of expression
   ;;
(* cf page 91 de la bible faut en discuter*)
