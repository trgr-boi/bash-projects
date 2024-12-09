# /bin/bash

read -p "Enter your name: " name

read -p "Enter your age: " age

echo "Hello $name! You are $age years old."

birthYear=$(( $(date +%Y) - $age))
echo "You were born in $birthYear."
