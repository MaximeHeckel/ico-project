(* Fonction construction arbre et autre*)


let rec sametype arbre  = match arbre with
| Vide -> true
| Feuille(e) -> true
| Noeud(Vide,Vide)-> false
| Noeud(Vide, Noeud(b1,b2)) -> false
| Noeud(Noeud(b1,b2),Vide) -> false
| Noeud(Vide,Feuille(x))-> false
| Noeud(Feuille(x), Vide)-> false
| Noeud(Feuille(x),Noeud(b1,b2))-> false
| Noeud(Noeud(b1,b2),Feuille(x))-> false
| Noeud(Feuille(x1), Feuille(x2)) -> true
| Noeud(Noeud (b1,b2), Noeud(b3,b4) )-> sametype arbre ;;

let rec map (f, arbre) = match arbre with
| Vide -> Vide
| Feuille(x) -> Feuille(f x)
| Noeud(b1,b2)-> Noeud ( (map (f, b1)),(map(f,b2)));;
