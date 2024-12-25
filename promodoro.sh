#!/bin/bash

# Simple Pomodoro Timer

# set color vaiables
GREEN='\033[1;32m' 
YELLOW='\033[0;33m' 
NC='\033[0m'

read -p "How long do you want to focus? " workMinutes
read -p "How long do you want to take a break? " breakMinutes

# function to display a countdown timer
countdown() {
    local seconds=$(( $1 * 60 ))  # Convert minutes to seconds
    while [ $seconds -gt 0 ]; do
        printf "\rTime left: %02d:%02d" $((seconds / 60)) $((seconds % 60))
        sleep 1
        ((seconds--))
    done
    echo ""
}

# start Pomodoro
echo -e "${YELLOW}Starting Pomodoro: $workMinutes minutes of focused work.${NC}"
countdown $workMinutes
osascript -e 'display notification "Take a break!" with title "Pomodoro Timer"'

# start Break
echo -e "${YELLOW}Break time: $breakMinutes minutes. Relax!${NC}"
countdown $breakMinutes
osascript -e 'display notification "Break is over" with title "Cycle complete"'

echo -e "${LIGHT_GREEN}Pomodoro cycle complete. Run the script again for another round!${NC}"
