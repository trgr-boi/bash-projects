# Bash Projects
These are my scripts I made to make my (and maybe your) life easier!
## overview 
- [syncGit](#syncgit)
- [update dnf](#update-dnf)
- [update homebrew](#update-homebrew)
- [promodoro timer](#promodoro-timer)
- [daynote](#daynote)
- [braindump](#braindump) 
- [moveto-trash](#moveto-trash)
## SyncGit
With this script, I can easily commit and push the repos I want to push on a regular basis. I use github to view my obsidian notes on my phone since I don't need to edit them when I'm on the go. I pulls first so it will sync the changes you make on another device.   
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
## Promodoro Timer
A very simple promodoro timer where you can set focus and break time. On MacOS you get a notification when timer is finished. I have not tested if this gives an error on linux.  
Don't know how to do this on linux but you can remove the `osascript` lines. It will still work the same, just without the notifications. 
## Daynote
A simple script for people who like to take daynotes. It opens it in vs-code but you could easily change this to vim, nvim,... **You should change the notes location to yours before using!**
I might make another one to work the same as the braindump.
## Braindump
A script that allows you to make quick braindumps from the terminal. **Change the notes path before using!** You can make this for every type of note by changing *braindump* to the type of name you want. 
Unlike the Daynote script, this one does everything inside the same terminal window. With the downside of not being able to go back to the previous line after pressing `enter`.  
But for me that kinda is the point. I made it to quickly get stuff from my mind before I forget, so I can process it later in a better texteditor.  
It saves in Markdown so you can use all the markdown synthax. It won't show in terminal but it will in your editor!
## Moveto-trash
Moves the file that's been given as argument to the trash folder. Default `.Trash`. Change this to what you want.
### Usage
`./movetotrash.sh <file>`
### todo
- [ ] Add option to view trash
- [ ] Add option to empty trash
- [ ] Add option to undo trash item