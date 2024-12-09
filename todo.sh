#!/bin/bash

# File to store tasks
TODO_FILE="todo.txt"

# Create the file if it doesn't exist
if [ ! -f "$TODO_FILE" ]; then
    touch "$TODO_FILE"
fi

# Function to display tasks
view_tasks() {
    echo "Your To-Do List:"
    if [ -s "$TODO_FILE" ]; then
        nl -w2 -s". " "$TODO_FILE"  # Numbered list
    else
        echo "No tasks found!"
    fi
    echo
}

# Function to add a task
add_task() {
    read -p "Enter the task: " task
    echo "$task" >> "$TODO_FILE"
    echo "Task added!"
    echo
}

# Function to remove a task
remove_task() {
    view_tasks
    read -p "Enter the task number to remove: " task_num

    # Validate input to ensure it's a number
    if [[ "$task_num" =~ ^[0-9]+$ ]]; then
        # Use sed with a backup file for compatibility
        sed -i.bak "${task_num}d" "$TODO_FILE" && echo "Task removed!" || echo "Invalid task number."
        rm -f "${TODO_FILE}.bak"  # Remove the backup file
    else
        echo "Invalid input. Please enter a valid task number."
    fi
    echo
}

# Menu loop
while true; do
    echo "To-Do List Manager"
    echo "-------------------"
    echo "1) View tasks"
    echo "2) Add a task"
    echo "3) Remove a task"
    echo "4) Exit"
    read -p "Choose an option: " option
    echo

    case $option in
        1)
            view_tasks
            ;;
        2)
            add_task
            ;;
        3)
            remove_task
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option, please try again."
            echo
            ;;
    esac
done

