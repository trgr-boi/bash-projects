#!/bin/bash

# Set the trash path
trashPath="$HOME/.Trash"

# Check if a file path argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

# Get the file path from the first argument
selected_file="$1"

# Check if the file exists
if [ ! -e "$selected_file" ]; then
  echo "File does not exist: $selected_file"
  exit 1
fi

# Filan conformation 
echo "Are you sure you want to move $(basename "$selected_file") to trash? (y/n)"
read -r confirm
if [ "$confirm" != "y" ]; then
  echo "Cancelled."
  exit 1
fi

# Ensure the Trash directory exists
mkdir -p $trashPath

# Move the file to the trash
mv -f "$selected_file" "$trashPath"

if [ $? -eq 0 ]; then
  echo "Moved $(basename "$selected_file") to trash."
else
  echo "Failed to move $(basename "$selected_file") to trash."
  exit 1
fi