#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: ./argument.sh <myfile.txt> <copyfile.txt>"
  exit 1
fi

output_file="$1"
input_file="$2"

# Create a new file with the given name
touch "myfile.txt"

# Copy the content from the input file to the output file using redirection
cat "copyfile.txt" > "myfile.txt"

echo "File 'myfile.txt' created and filled with the content of 'copyfile.txt'."
