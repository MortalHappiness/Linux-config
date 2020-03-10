# Linux-config

 My personal linux configuration files.
 
 #### Goal: Keyboard driven workflow, lightweight system mainly for coding
 #### Distribution: Arch Linux
 #### Device: Notebook
 
 ## Dependencies
 
| Package | Description |
| ------- | ----------- |
| [bspwm](https://github.com/baskerville/bspwm) | A tiling window manager |
| [sxhkd](https://github.com/baskerville/sxhkd) | Dependency of bspwm, hotkey control |
| [termite](https://github.com/thestinger/termite) | Terminal emulator with Vim-like hotkeys |
| [dzen2](https://github.com/robm/dzen) | To create popup windows |
| unclutter | To hide cursor when touchpad locked |
| scrot | Screenshot |
| brightnessctl | Backlight control |
| amixer | Sound control |
| [clipmenu](https://github.com/cdown/clipmenu/) | Clipboard manager allow us to select previously clipped text into CLIPBOARD buffer |
| Cousine | Font |

## Screenshots

### System Information popup window
I use a hotkey to open this window instead of using bar to track system information.
![info\_popup](/images/info_popup.png)

### Screenshot popup window
This will show up when `prt sc sysrq` key is pressed.
![screenshot\_popup](/images/screenshot_popup.png)

### Backlight changed popup window
When fn keys are pressed, laughch events related to backlight, sound, touchpad and show this popup window.
![backlight\_popup](/images/backlight_popup.png)

### Clipmenu
![clipmenu](/images/clipmenu.png)

### Visual selection in termite terminal
![selection](/images/selection.png)
 
 ## Installation
 
 Clone this repository, modify `_links.conf` if your want to make some different links, and then execute
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

bash-config/bashrc           .bashrc                # This will create link "$HOME/.bashrc -> $PWD/bash-config/bashrc"
X11-config/bspwm             .config/bspwm          # This will create link "$HOME/.config/bspwm -> $PWD/X11-config/bspwm"
git-config/gitconfig         .gitconfig             # This will create link "$HOME/.gitconfig -> $PWD/git-config/gitconfig"
 ```

## Current Hotkeys

| Key | Function |
| ----| -------- |
| fn keys | Function as expected(backlight,sound,touchpad) |
| prt sc sysrq | Take Screenshot |
| super + Return | Open termite terminal |
| super + ctrl + i | Show system information (workspace,battery,volume,backlight,touchpad,date,time) |
| super + ctrl + g | Open Google-chrome |
| super + ctrl + c | Open clipmenu |
| bspwm related keys | See sxhkdrc for details |
| termite related keys | See termite(1) for details |

## Note:
For Google-Chrome, I install [Vimium](https://github.com/philc/vimium) for keyboard driven.

