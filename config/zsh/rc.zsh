export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/config/zsh
export ZSH_PLUGINS=$ZSH/plugins

########################################
# Source
########################################

source $ZSH/env.zsh
source $ZSH/aliases.zsh
source $ZSH/git.zsh

########################################
# Options
########################################

export HISTFILE=$HOME/.zsh-history
export HISTSIZE=1000
export SAVEHIST=1000

setopt HIST_SAVE_NO_DUPS				# Do not save duplicates in history
setopt AUTO_PUSHD						# Save visited dirs
setopt PUSHD_IGNORE_DUPS				## Don't save visited duplicates

########################################
# Autoload
########################################

fpath+=$ZSH

autoload -U compinit; compinit			# Enable competion
autoload -Uz prompt.zsh; prompt.zsh		# Load prompt

########################################
# Binds
########################################

bindkey -e # Enable emacs keybinds

########################################
# Init plugins and tools
########################################

plug zsh-autosuggestions
plug zsh-syntax-highlighting

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

source $ZSH/plugins.zsh
