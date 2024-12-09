#!/bin/bash

echo "What is the max value?"
read max

randomNumber=$((RANDOM % $max + 1)) 

inputNumber=0

echo "Guess a number between 1 and $max:"

counter=0
while [ "$inputNumber" -ne "$randomNumber" ]; do
  read inputNumber
  ((counter++))
  
  if [ "$inputNumber" -lt "$randomNumber" ]; then
    echo "Too low. Try again."
  elif [ "$inputNumber" -gt "$randomNumber" ]; then
    echo "Too high. Try again."
  fi
done

echo "Congratulations! You guessed it in $counter attempts."


