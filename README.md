# Bash Projects
These are my scripts I made to make my (and maybe your) life easier!
## overview 
- [syncGit](#syncgit)
- [update dnf](#update-dnf)
- [update homebrew](#update-homebrew)
## SyncGit
With this script, I can easily commit and push the repos I want to push on a regular basis. I use github to view my obsidian notes on my phone since I don't need to edit them when I'm on the go. I might add a pull command so I can also use this to pull changes I made on a different computor.  
The commit message will always be "sync YYY-mm-ddd" so it is not that handy if you really want to now what was synced. I don't know if I would use it for larger projects because of this.  
  
The path to the repos should be added and is the only one that should be changed. It uses a loop that checks how many paths there are. I placed some example paths:  
```bash
# Repositories to sync
repos=(
  # Path to repos you want to automatically commit and push
  "/Path/to/repo-1"
  "/Path/to/repo-2"
  "/Path/to/repo-3"
)
```
##### TODO
- [x] Add pull command

## Update DNF
A script to update dnf. Uses `dnf check-update`, `dnf upgrade -y`, `dnf upgrade -y` & `dnf clean all`. To my knowledge is that all I need to update.  
Change the commands for your packagemanager.
I added colors for eyecandy. No loading animation on this one because it didn't really work with how dnf shows downloading.
## Update Homebrew
A script to update homebrew. This uses the `brew update`, `brew upgrade`, `brew cleanup` and `brew doctor` commands.  
Can easily be changed to work with other package managers. Just change the commands to the ones yours uses.  
I added colors and a loading animation for some eye candy :)
