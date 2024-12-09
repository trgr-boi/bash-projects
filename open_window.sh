#!/bin/bash

osascript <<EOF
tell application "iTerm"
    set newWindow to (create window with default profile)
    tell newWindow's current session
        write text "echo 'Hello from the new terminal!'"
    end tell
end tell
EOF

