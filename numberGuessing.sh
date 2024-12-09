#!/bin/bash

echo "What is the max value?"
read maxValue

randomNumber=$((RANDOM % $maxValue + 1)) 

inputNumber=0

echo "Guess a number between 1 and $maxValue:"

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


