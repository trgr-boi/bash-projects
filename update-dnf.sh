#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' 

run_task() {
    local message="$1"
    shift
    local cmd="$@"

    echo -e "${message}..."
    eval "$cmd"
    echo -e "${message}... ${GREEN}Done!${NC}"
}

check_updates() {
    run_task "${GREEN}Checking for updates${NC}" "sudo dnf check-update"
}

upgrade_system() {
    run_task "${GREEN}Upgrading system${NC}" "sudo dnf upgrade -y"
}

remove_unused() {
    run_task "${GREEN}Removing unused packages${NC}" "sudo dnf autoremove -y"
}

clean_cache() {
    run_task "${GREEN}Cleaning cache${NC}" "sudo dnf clean all"
}

echo -e "${YELLOW}>>> DNF Maintenance${NC}"
check_updates
upgrade_system
remove_unused
clean_cache

echo -e "${YELLOW}>>> All tasks completed!${NC}"
