#!/bin/bash

calcAdd() {
  output=$((number1 + number2))
}
calcSub() {
  output=$((number1 - number2))
}
calcMulti() {
  output=$((number1 * number2))
}
calcDiv() {
  output=$((number1 / number2))
}
calcMod() {
  output=$((number1 % number2))
}

result() {
  echo "$number1 + $number2 = $output"
}

echo "Welcome to calculator."

read -p "Give number 1: " number1

echo "What do you want to do?"
echo "1) Addition (+)"
echo "2) Subtraction (-)"
echo "3) Multiplication (*)"
echo "4) Division (/)"
echo "5) Modulus (%)"
echo "6) Exit"
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
  6)
    echo "Goodbye!"
    break
    ;;
  *)
    echo "Invalid option, please try again!"
    echo
    ;;
esac

