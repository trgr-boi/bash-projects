#!/bin/bash

# Repositories to sync
repos=(
  # Path to repos you want to automatically commit and push
  "/Path/to/repo-1"
  "/Path/to/repo-2"
  "/Path/to/repo-3"
)

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

    printf "\r%s... Done!\n" "$message"
}

# Current date
date=$(date +"%Y-%m-%d")

# Function to sync a single repository
sync_repo() {
    local repo="$1"

    if [ -d "$repo/.git" ]; then
        echo ">>> Processing $repo..."
        cd "$repo" || exit

        run_with_spinner "Adding files to Git " "git add ."
        run_with_spinner "Committing changes " "git commit -m 'sync $date' || echo 'Nothing to commit'"
        run_with_spinner "Pushing to remote " "git push"
        echo
    else
        echo "Skipping $repo: Not a Git repo "
    fi
}

# Main script
echo ">>> Syncing repos"

for repo in "${repos[@]}"; do
    sync_repo "$repo"
done

echo ">>> Sync completed!"
