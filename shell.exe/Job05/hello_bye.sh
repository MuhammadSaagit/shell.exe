#!/bin/bash

# Check if an argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: ./hello_bye.sh <argument>"
  exit 1
fi

argument="$1"

if [ "$argument" = "Hello" ]; then
  echo "Hello, I'm a script!"
elif [ "$argument" = "Bye" ]; then
  echo "Goodbye and have a nice day"
else
  echo "Invalid argument. Expected 'Hello' or 'Bye'."
fi
