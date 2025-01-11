#!/bin/bash

# VARIABLES
VAULT="Notes" # Obsidian vault name
DAYNOTE_DIR="$HOME/Notes/Daynotes"
ALIAS_NAME="dnote"

# COLORS
BOLD_YELLOW='\033[1;33m'
ITALIC_GREEN='\033[3;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RESET='\033[0m'



function cat_daynote() {
    local daynote_file="$1"
    if [[ -f "$daynote_file" ]]; then
        while IFS= read -r line; do
            line=$(echo "$line" | sed -E "s/\*\*([^*]+)\*\*/\\${BOLD_YELLOW}\1\\${RESET}/g")
            line=$(echo "$line" | sed -E "s/\*([^*]+)\*/\\${ITALIC_GREEN}\1\\${RESET}/g")
            line=$(echo "$line" | sed -E "s/^# (.+)/\\${RED}\1\\${RESET}/g")
            line=$(echo "$line" | sed -E "s/^## (.+)/\\${YELLOW}\1\\${RESET}/g")
            line=$(echo "$line" | sed -E "s/^### (.+)/\\${GREEN}\1\\${RESET}/g")
            printf "%b\n" "$line"
        done < "$daynote_file"
    else
        echo "Daynote does not exist."
    fi
}

function show_help() {
    echo "Usage: $ALIAS_NAME [OPTION]"
    echo "Open today's daynote in Obsidian."
    echo "  -p  print today's daynote"
    echo "  -p +1  print tomorrow's daynote"
    echo "  -p -1  print yesterday's daynote"
    echo "  +1  open tomorrow's daynote in Obsidian"
    echo "  -1  open yesterday's daynote in Obsidian"
    echo "  -h  display this help and exit"
}

function show_invalid_option() {
    echo "Invalid option: $1"
    echo "Try '$ALIAS_NAME -h' for more information."
}

if [ -z "$1" ]; then
  open "obsidian://advanced-uri?vault=$VAULT&daily=true"
elif [ "$1" = "+1" ]; then
  open "obsidian://open?vault=$VAULT&file=$(date -v +1d +'%Y-%m-%d')"
elif [ "$1" = "-1" ]; then
  open "obsidian://open?vault=$VAULT&file=$(date -v -1d +'%Y-%m-%d')"
elif [ "$1" = "-p" ]; then
  if [ "$2" = "+1" ]; then
    cat_daynote "$DAYNOTE_DIR/$(date -v +1d +'%Y-%m-%d').md"
  elif [ "$2" = "-1" ]; then
    cat_daynote "$DAYNOTE_DIR/$(date -v -1d +'%Y-%m-%d').md"
  else
    cat_daynote "$DAYNOTE_DIR/$(date +'%Y-%m-%d').md"
  fi
elif [ "$1" = "-h" ]; then
  show_help
else
    show_invalid_option "$1"
fi