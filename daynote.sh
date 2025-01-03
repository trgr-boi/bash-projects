#!/bin/bash

current_datetime=$(date "+%Y-%m-%d_%H-%M")

# VARIABLES **CHANGE THESE**
FILE_TYPE="md"
EDITOR="nvim"
DAYNOTE_DIR="$HOME/Notes/Daynotes/"
DAYNOTE_FILE="$DAYNOTE_DIR/$current_datetime.$FILE_TYPE"

# Create folder if it doesn't exist
mkdir -p "$DAYNOTE_DIR"

$EDITOR $DAYNOTE_FILE