#!/bin/bash

# VARIABLES **CHANGE THESE**
FILE_TYPE="md"
BRAINDUMP_DIR="$HOME/Notes/Braindump/"

# Set color variables
Y='\033[1;33m' 
R='\033[1;31m'
G='\033[1;32m' 
NC='\033[0m' # No color (reset)

# Create folder if it doesn't exist
mkdir -p "$BRAINDUMP_DIR"

# Ask for note title
echo -ne "${Y}What would you like to dump: ${NC}"
read noteTitle

# Replace spaces with underscores and make lowercase
fileName=$(echo "$noteTitle" | tr '[:upper:]' '[:lower:]' | tr ' ' '_').$FILE_TYPE

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
echo -e "$content" > "$BRAINDUMP_DIR/$fileName"

# confirm to user
echo -e "${G}Note saved to $BRAINDUMP_DIR/$fileName${NC}"