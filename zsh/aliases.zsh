# Aliases
alias dots="cd $HOME/dotfiles"

alias e=nvim
alias h=helix

alias tnew="tmux new -s"
alias tat="tmux at"
alias tkill="tmux kill"
alias tls="tmux ls"

alias gadd="git add"
alias gstat="git status"
alias gcom="git commit -m"
alias gcom="git commit -m"
alias gpush="git push"
alias gpull="git pull"
alias gres="git reset"

alias pinfo="pacman -Si"
alias psync="sudo pacman -S"
alias pquery="pacman -Qi"
alias premove="sudo pacman -Rs"

alias g="grep"
alias gi="grep -i"
alias l="less"
alias x="xargs"
alias f="find"

alias md="mkdir"
alias th="touch"
alias ll="ls -l"
alias la="ls -A"
alias lla="ls -Al"
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

# Functions
function count_lines() {
	find $1 | xargs wc -l
}
