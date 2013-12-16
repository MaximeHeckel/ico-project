#! /bin/sh

pascalDirectory="./exemples_call_graph"
dotDirectory="./export/exemples_call_graph"
OS=`uname`

make > /dev/null

if [ $# -eq 0 ] 
then
  echo "0 arguments given, nothing to do."
  exit 1
fi

for pascalProgram in $* 
do
  echo "Processing $pascalProgram..."
  ./pseudopascal ${pascalDirectory}/${pascalProgram} > ${dotDirectory}/${pascalProgram}.dot
  dot -Tpng ${dotDirectory}/${pascalProgram}.dot > ${dotDirectory}/${pascalProgram}.png
  if [[ $OS == "Darwin" ]]; then 
    open ${dotDirectory}/${pascalProgram}.png
  elif [[ $OS == "Linux" ]]; then
    display ${dotDirectory}/${pascalProgram}.png
  else
    echo "Unknown os. Cannot open image result."
  fi
  echo "Result here: $dotDirectory"
  echo "------------"
done
