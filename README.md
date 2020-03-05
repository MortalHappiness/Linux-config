# Linux-config

 My personal linux configuration files(dotfiles) backup using git for quick reinstallation setup.
 
 ## Feature
 ### Structural links maintenance
 
 Clone this repository and put it *anywhere* in your linux system, modify `_links.conf`, and then execute
 ```sh
 bash setup.sh install
 ```
 This will create several symbolic links from your home directory to this directory based on the rules in `_links.conf`.  
 If there are files to be overwritten, then they will be moved into `.backup` folder.
 
 Type
 ```sh
 bash setup.sh revert
 ```
 can recover the backup files.
 
 To remove all symbolic links created, run
 ```sh
 bash setup.sh remove
 ```
 
 Example `_links.conf`
 ```
# Symbolic links to be created


# [TARGET]                   [LINK_NAME]
# (relative to $PWD)         (relative to $HOME)

git-config/gitconfig         .gitconfig            # This will create link "$HOME/.gitconfig -> $PWD/git-config/gitconfig"
 ```
