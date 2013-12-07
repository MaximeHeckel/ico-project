type primitive =
  | Write (*Affichage entier*)
  | Writeln (*Affichage entier + retour a la ligne*)
  | Readln (*Lecture entier*)
  | Alloc (*Allocation*)

type calle =
  | CUserFunction of string (*Procédure ou fonction définie par l'utilisateur*)
  | CPrimitiveFunction of primitive (*Opération primitive*)
