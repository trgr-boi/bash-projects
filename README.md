# Bash Projects
These are my scripts I made to make my (and maybe your) life easier!
## overview 
- [syncGit](#syncgit)
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
- [ ] Add pull command

## Update Homebrew
A script to update homebrew. This uses the `brew update`, `brew upgrade`, `brew cleanup` and `brew doctor` commands.  
Can easily be changed to work with other package managers. Just change the commands like this:
```bash
update_brew() {
    run_with_spinner "Updating brew. " "brew update"
}
```
can become:
```bash
update_dnf() {
    run_with_spinner "Updating dnf. " "sudo dnf update"
}
```
I haven't tested this with dnf or anything but you get the point.  
I added a loading animation for some eye candy :)
