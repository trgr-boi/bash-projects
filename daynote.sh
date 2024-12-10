#!/bin/bash
# opens a new window and creates a new file named "daynote-YYYY-mm-dd". not created until saved
# change 'nvim' in osascript to change editor.
current_datetime=$(date "+%Y-%m-%d_%H-%M-%S")

file_path="$HOME/Documents/notes/daynote-$current_datetime.md"

osascript <<EOF
tell application "iTerm"
    set newWindow to (create window with default profile)
    tell newWindow's current session
        write text "nvim \"$file_path\""
    end tell
end tell
EOF
