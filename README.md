#Compilation project
[Homepage](http://www.ensiie.fr/~guillaume.burel/compilation/)

##Prerequisites
You need to have `ocaml`, `ocamlyacc` and `ocamllex` installed.

##Use
To compile the project, type:

	make

###Interactive mode

To launch it:
	
	./pseudopascal

This launches an interactive interpretation mode. For example if you type
	
	1+2;

It prints:
	
	3	

###From a file

	cat my_file | ./pseudopascal

For example if the file `test/begin_exp_end` contains:

	begin 1+2 end
	
And I type:
	
	cat test/begin_exp_end | ./pseudopascal
	
It prints:
	
	3
	
##Clean
To clean the directory, type 

	make clean