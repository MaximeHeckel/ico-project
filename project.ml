(*Définition du type arbre binaire polymorphe*)

type 'a arbre = Vide | Feuille of 'a | Noeud of (
  'a arbre)*('a arbre);;

