#Compilation project
[Homepage](http://www.ensiie.fr/~guillaume.burel/compilation/)

##Prerequisites
You need to have `ocaml`, `ocamlyacc` and `ocamllex` installed.

##Compile
To compile the project, type:

	make

To clean it:
	
	make clean

##Use
###Basic use

	 ./pseudopascal my_directory/my_file.p

For example to process the file `exemples_call_graph/find.p`:
	
	./pseudopascal exemples_call_graph/find.p
	
It outputs the result in `dot` syntax.

###Normal use

	./pseudopascal.sh my_file.p
	
For example to process the `exemples_call_graph/find.p` file:
	
	./pseudopascal.sh find.p
	

It analyzes the file, saves the result in the `my_file.p.dot` file in `dot` syntax, executes the `dot` command to obtain `my_file.p.png`, and eventually opens it.

Notes:

- Only give the script the name of the file, not the location. It automatically searches in the `exemples_call_graph` directory.
- The results (`dot` file and `png` file) are created in the `export/exemples_call_graph` directory
- It opens the `png`result with a different command, depending on your os.