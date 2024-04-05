# bogdanov's dotfiles

this is a little collection of my config, script and other files

## Screenshots

![image](https://github.com/bbogdan-ov/dotfiles/assets/165584864/13f467d6-50aa-49c7-9580-5efc99c64237)

![image](https://github.com/bbogdan-ov/dotfiles/assets/165584864/8368e9dc-353d-41f8-a1ba-682bfbac8e9b)

## How to use

**To define custom dotfiles path just put this line into your `~/.zshenv`:**
```bash
export DOTFILES=$HOME/mydotfiles/path
```

**Syntax of link files:**

links `rc.zsh` *(relative to dir where link file is located)* to `~/.zshrc`:
```
rc.zsh = $HOME/.zshrc
```

links current dir to `~/.config/dir`:
```
. = $HOME/.config/dir
```

you can use your own env variables:
```
rc.zsh = $MY_ENV/.zshrc
```

also multiline files are supported!
```
a.conf = $HOME/.a.conf
src/b.conf = $MY_ENV/.b.conf
```

**After you are done creating config files, run `linkall.sh` to link all files:**
```bash
./linkall.sh
```

**Hooray!**

## P.S.

*this repository is dedicated to my lost dotfiles*

*inspired by [this dotfiles](https://github.com/andrew8088/dotfiles)*
