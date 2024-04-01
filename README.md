# bogdanov's dotfiles

this is a little collection of my config files

## Screenshots

![image](https://github.com/bbogdan-ov/dotfiles/assets/165584864/dd6b6fb8-2c2d-41fa-aa75-c903e26ccaf3)
![image](https://github.com/bbogdan-ov/dotfiles/assets/165584864/d361e973-a4c0-4430-b26b-f3c9435a608f)

## How to use

**to define custom dotfiles path just put this line into your `.zshenv`:**
```bash
export DOTFILES=$HOME/mydotfiles/path
```

**hierarchy of dirs in `dotfiles` looks something like this:**
```
dotfiels
  linkall.sh
  link - this link won't work
  nvim
    link - link files must be one level below linkall.sh
  something
    subdir
      link - this link won't work either...
```

**syntax of link files:**

links `rc.zsh` *(relative to dir where link file is located)* to `~/.zshrc`:
```
rc.zsh = $HOME/.zshrc
```

links current dir to `~/.config/dir`:
```
. = $HOME/.config/dir
```

you can also use your env variables:
```
rc.zsh = $MY_ENV/.zshrc
```

also multilines are supported!
```
a.conf = $HOME/.a.conf
src/b.conf = $MY_ENV/.b.conf
```

## P.S.

*this repository is dedicated to my lost dotfiles*

*inspired by [this dotfiles](https://github.com/andrew8088/dotfiles)*
