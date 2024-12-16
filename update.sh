#!/bin/bash

spinner="/-\|"

animate_spinner() {
    local message="$1"  
    local i=0
    while :; do
        printf "\r[%c] %s" "${spinner:i++%${#spinner}}" "$message"
        sleep 0.1
    done
}

run_with_spinner() {
    local message="$1"
    shift
    local cmd="$@"

    animate_spinner "$message" &
    local spinner_pid=$!

    eval "$cmd"

    kill "$spinner_pid" >/dev/null 2>&1
    wait "$spinner_pid" 2>/dev/null

    printf "\r%s\n" "$message... Done!"
}

# Functions for each task
update_brew() {
    run_with_spinner "Updating brew. " "brew update"
}

upgrade_brew() {
    run_with_spinner "Upgrading brew. " "brew upgrade && brew upgrade --cask"
}

cleanup_brew() {
    run_with_spinner "Cleaning up brew. " "brew cleanup"
}

doctor_brew() {
    run_with_spinner "Running brew doctor. " "brew doctor"
}

# Main script
echo ">>> Brew Maintenance"
update_brew
upgrade_brew
cleanup_brew
doctor_brew

echo ">>> All tasks completed!"
