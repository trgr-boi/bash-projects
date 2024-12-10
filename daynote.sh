#!/bin/bash

# script to create a new daynote. I set code to open vs-code. change to preffered editor.
# use 'osascript' to open in new window if you use a terminal texteditor like nvim.
# made on macos. I haven't tested it on linux yet.

current_datetime=$(date "+%Y-%m-%d_%H-%M")

file_path="$HOME/path/to/notes/$current_datetime.md"

code $file_path