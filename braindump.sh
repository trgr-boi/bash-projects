#!/bin/bash

# Set color variables
Y='\033[1;33m' 
R='\033[1;31m'
G='\033[1;32m' 
NC='\033[0m' # No color (reset)

# Set braindump location
notesFolder="$HOME/notes"

# Create folder of it doesn't exist
mkdir -p "$notesFolder"

# Ask for note title
echo -ne "${Y}What would you like to dump: ${NC}"
read noteTitle

# Replace spaces with underscores and make lowercase
fileName=$(echo "$noteTitle" | tr '[:upper:]' '[:lower:]' | tr ' ' '_').md

# Ask for note content
echo -e "${Y}Enter the content of the dump (type '${R}EOF${Y}' on a new line to finish):${NC}"
content=""
while IFS= read -r line; do
    if [ "$line" == "EOF" ]; then
        break
    fi
    content="$content$line\n"
done

# Add the date
dateTime=$(date '+%Y-%m-%d %H:%M:%S')
content="$content\n---\nCreated on: $dateTime"

# Save note to the .md file
echo -e "$content" > "$notesFolder/$fileName"

# confirm to user
echo -e "${G}Note saved to $notesFolder/$fileName${NC}"