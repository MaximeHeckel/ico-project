open PPsyntax

type a = Feuille of type_expr | Noeud of a * a;;
