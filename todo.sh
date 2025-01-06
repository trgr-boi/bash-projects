#!/bin/bash

# VARIABLES -----------------
TODO_DIR="$HOME/Notes/Todo"
TRASH_DIR="$HOME/.Trash"
FILE_TYPE="md"
EDITOR="nvim"
# ---------------------------

# COLORS
BOLD_YELLOW='\033[1;33m'
ITALIC_GREEN='\033[3;32m'
RESET='\033[0m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

function list_todos() {
    echo "Available todo lists:"
    for file in "$TODO_DIR"/*.$FILE_TYPE; do
        basename "$file" .md
    done
}

function edit_todo() {
    local todo_file="$TODO_DIR/$1.$FILE_TYPE"
    if [[ -f "$todo_file" ]]; then
        $TERM_EDITOR "$todo_file"
    else
        echo "Todo list '$1' does not exist."
    fi
}

function cat_todo() {
    local todo_file="$TODO_DIR/$1.$FILE_TYPE"
    if [[ -f "$todo_file" ]]; then
        while IFS= read -r line; do
            # Replace **text** with bold yellow text
            line=$(echo "$line" | sed -E "s/\*\*([^*]+)\*\*/\\${BOLD_YELLOW}\1\\${RESET}/g")
            # Replace *text* with italic green text
            line=$(echo "$line" | sed -E "s/\*([^*]+)\*/\\${ITALIC_GREEN}\1\\${RESET}/g")
            # Replace # text with red text
            line=$(echo "$line" | sed -E "s/^# (.+)/\\${RED}\1\\${RESET}/g")
            # Replace ## text with yellow text
            line=$(echo "$line" | sed -E "s/^## (.+)/\\${YELLOW}\1\\${RESET}/g")
            # Replace ### text with green text
            line=$(echo "$line" | sed -E "s/^### (.+)/\\${GREEN}\1\\${RESET}/g")
            printf "%b\n" "$line"
        done < "$todo_file"
    else
        echo "Todo list '$1' does not exist."
    fi
}

function create_todo() {
    local todo_file="$TODO_DIR/$1.$FILE_TYPE"
    if [[ -f "$todo_file" ]]; then
        echo "Todo list '$1' already exists."
    else
        touch "$todo_file"
        
        # template for todo list between `cat <<EOL > "$todo_file"` and `EOL`
        cat <<EOL > "$todo_file" 
# Todo $1
## URGENT
- [ ] 

## Soon
- [ ] 

## Sometime
- [ ] 

EOL
        echo "Todo list '$1' created."
    fi
}

function trash_todo() {
    local todo_file="$TODO_DIR/$1.$FILE_TYPE"
    if [[ -f "$todo_file" ]]; then
        mv "$todo_file" "$TRASH_DIR"
        echo "Todo list '$1' moved to trash."
    else
        echo "Todo list '$1' does not exist."
    fi
}

function show_help() {
    echo "Usage: todo <command> [<args>]"
    echo "Commands:"
    echo "  list                List all todo lists"
    echo "  <name>              View the specified todo list"
    echo "  edit <name>         Edit the specified todo list in $EDITOR"
    echo "  create <name>       Create a new todo list"
    echo "  trash <name>        Move the specified todo list to trash"
}

if [[ -z "$1" ]]; then
    show_help
    exit 0
fi

case $1 in
    list)
        list_todos
        ;;
    create)
        create_todo "$2"
        ;;
    trash)
        trash_todo "$2"
        ;;
    edit)
        edit_todo "$2"
        ;;
    *)
        cat_todo "$1"
        ;;
esac

