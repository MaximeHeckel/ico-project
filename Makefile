TARGET = pseudopascal

pseudopascal: lexer.cmo pseudopascal.cmo graph.cmo main.cmo
	ocamlc -o $@ lexer.cmo pseudopascal.cmo graph.cmo main.cmo

depend:
	ocamldep *.ml *.mli > .depend

clean:
	rm -rf *.cmi *.cmo $(TARGET)
	rm -rf pseudopascal.ml pseudopascal.mli lexer.ml lexer.mli

depend:
	ocamldep .mli .mli .mll .mly .cmo .cmi

.SUFFIXES: .ml .mli .mll .mly .cmo .cmi

.ml.cmo:
	ocamlc -c $<
.mli.cmi:
	ocamlc -c $<
.mll.ml:
	ocamllex $<
.mly.ml:
	ocamlyacc $<
.mly.mli:
	ocamlyacc $<

include .depend
