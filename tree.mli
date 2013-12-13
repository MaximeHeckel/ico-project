open PPsyntax

type 'a arbrebin = Vide |  Feuille of 'a | Noeud of ('a arbrebin) * ('a arbrebin);;
