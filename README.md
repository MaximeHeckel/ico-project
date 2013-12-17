#Compilation project
[Homepage](http://www.ensiie.fr/~guillaume.burel/compilation/)

This project is an pseudo-pascal syntax analizer. It processes a file written in pseudo-pascal, analizes its structure and syntax and outputs the call graph.

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

For example to process the file `input/find.p`:
	
	./pseudopascal input/find.p
	
It outputs the result in `dot` syntax.

###Normal use

	./pseudopascal.sh my_file.p
	
For example to process the `input/find.p` file:
	
	./pseudopascal.sh find.p
	

It compiles the project, analyzes the file, saves the result in the `my_file.p.dot` file in `dot` syntax, executes the `dot` command to obtain `my_file.p.png`, and eventually opens it.

Notes:

- Only give to the script the name of the file, not the location. It automatically searches in the `input` directory.
- The results (`dot` file and `png` file) are created in the `output` directory
- It opens the `png`result with a command depending on your os.
- It can process multiple files at once:

		./pseudopascal.sh find.p hanoi.p