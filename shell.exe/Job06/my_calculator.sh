#!/bin/bash

# Check if three arguments are provided
if [ $# -ne 3 ]; then
  echo "Usage: ./my_calculator.sh <number1> <operation> <number2>"
  exit 1
fi

number1="$1"
operation="$2"
number2="$3"

case "$operation" in
  "+")
    result=$((number1 + number2))
    ;;
  "-")
    result=$((number1 - number2))
    ;;
  "*")
    result=$((number1 * number2))
    ;;
  "/")
    result=$(awk "BEGIN{printf \"%.2f\", $number1 / $number2}")
    ;;
  *)
    echo "Invalid operation. Expected '+', '-', '*', or '/'."
    exit 1
    ;;
esac

echo "Result: $result"
