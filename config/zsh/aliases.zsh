# Aliases
alias e='nvim --listen $(to-nvim-addr)'
alias h=helix

alias tnew="tmux new -s"
alias tat="tmux at"
alias tkill="tmux kill"
alias tls="tmux ls"

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

alias md="mkdir"
alias th="touch"
alias ls="eza --color=always --level=2"
alias ll="ls -l --no-user --no-permissions --time-style=relative --git --modified"
alias la="ls -A"
alias lla="ll -A"
alias tree="ls --tree"
alias cl="clear"
alias cd="z"

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

alias src-aliases="source $DOTFILES/config/zsh/aliases.zsh"

# Functions
function dots() {
	cd $DOTFILES/$1
}
function count-lines() {
	find $@ -type f | xargs wc -l
}
function count-files() {
	find $@ -type f | wc -l
}
