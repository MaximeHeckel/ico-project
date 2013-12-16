#! /bin/sh

pascalDirectory="./input"
dotDirectory="./output"
OS=`uname`

make > /dev/null

if [ $# -eq 0 ] 
then
  echo "Usage: $0 file.p"
  echo "  where file.p is the pseudo-pascal file to analyze, located in the input directory"
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
  echo "Result here: ${dotDirectory}/${pascalProgram}.dot, ${dotDirectory}/${pascalProgram}.png"
  echo "------------"
done
