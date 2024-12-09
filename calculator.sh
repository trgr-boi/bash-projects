#!/bin/bash

calcAdd() {
  output=$((number1 + number2))
  method="+"
}
calcSub() {
  output=$((number1 - number2))
  method="-"
}
calcMulti() {
  output=$((number1 * number2))
  method="*"
}
calcDiv() {
  output=$((number1 / number2))
  method="/"
}
calcMod() {
  output=$((number1 % number2))
  method="%"
}

result() {
  echo "$number1 $method $number2 = $output"
}

echo "Welcome to calculator."

read -p "Give number 1: " number1

echo "What do you want to do?"
echo "1) Addition (+)"
echo "2) Subtraction (-)"
echo "3) Multiplication (*)"
echo "4) Division (/)"
echo "5) Modulus (%)"
read -p "Choose an option: " option

read -p "Give number 2: " number2

case $option in
  1)
    calcAdd
    result
    ;;
  2)
    calcSub
    result
    ;;
  3)
    calcMulti
    result
    ;;
  4)
    calcDiv
    result
    ;;
  5)
    calcMod
    result
    ;;
  *)
    echo "Invalid option, please try again!"
    echo
    ;;
esac

