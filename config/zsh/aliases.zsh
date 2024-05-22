# Aliases
alias e='nvim --listen $(to-nvim-addr)'
alias h=helix

alias tnew="tmux new -s"
alias tat="tmux at"
alias tkill="tmux kill"
alias tls="tmux ls"

alias files="lf -command 'three' -print-selection"

alias ga="git add"
alias gaa="git add --all"
alias gs="git status"
alias gl="git log"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias grs="git reset"
alias gf="git fetch"

alias pi="pacman -Si"
alias psy="sudo pacman -S"
alias pqu="pacman -Qi"
alias prm="sudo pacman -Rs"

alias g="grep"
alias gi="grep -i"
alias l="less"
alias x="xargs"
alias f="find"
alias c="cat"
alias b="bat"
alias d="dirs -v"

alias md="mkdir"
alias mf="touch"
alias ls="ls --color=always -t -h -p"
alias ll="ls -l"
alias la="ls -A"
alias lla="ll -A"
alias cl="clear"
alias cd="z"
alias copy="wl-copy"
alias img="kitten icat"

alias wifi="nmcli d wifi"
alias wcon="nmcli d wifi connect"
alias wdis="nmcli d wifi disconnect"
alias wlist="nmcli d wifi list"
alias wscan="nmcli d wifi rescan"

alias blt="bluetoothctl"
alias bcon="bluetoothctl connect"
alias bdis="bluetoothctl disconnect"

alias vol-set="pactl set-sink-volume @DEFAULT_SINK@"
alias vol-toggle="pactl set-sink-mute @DEFAULT_SINK@ toggle"

alias src="source"
alias src-zsh="src ~/.zshrc"
alias src-aliases="src $ZSH/aliases.zsh"

# Functions
# Source plugin
function plug() {
	source $ZSH_PLUGINS/$1/$1.zsh
}
# Goto dotfiles dir
function dots() {
	cd $DOTFILES/$1
}
# Count lines in all files
function count-lines() {
	find $@ -type f | xargs wc -l
}
# Count all files in dir
function count-files() {
	find $@ -type f | wc -l
}
# Convert cur dir to nvim server address
function to-nvim-addr() {
	addr=nvim-$(pwd)
	addr="${addr//\//-}"
	addr="${addr// /-}"
	addr="${addr//./-}"
	echo /tmp/$addr.sock
	unset addr
}
