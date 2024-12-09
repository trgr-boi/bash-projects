# /bin/bash

echo "Enter your name:"
read name

echo "How old are you?"
read age

echo "Hello $name! You are $age years old."

birthYear=$(( $(date +%Y) - $age))
echo "You were born in $birthYear."
