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

setopt histignorealldups				# Do not save duplicates in history
setopt autopushd						# Save visited dirs
setopt pushdignoredups					## Don't save visited duplicates

########################################
# Autoload
########################################

fpath+=$ZSH

autoload -U compinit; compinit			# Enable competion
autoload -Uz prompt.zsh; prompt.zsh		# Load prompt

########################################
# Binds
########################################

bindkey -e 								# Enable emacs keybinds

bindkey '^[[Z' reverse-menu-complete 	# S-Tab - prev completion
bindkey '^[[1~' beginning-of-line		# Home - goto line start
bindkey '^[[4~' end-of-line				# End - goto line end

########################################
# Styles
########################################

zstyle ':completion:*' menu select		# Menu completion

########################################
# Init plugins and tools
########################################

plug zsh-autosuggestions
plug zsh-syntax-highlighting

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

source $ZSH/plugins.zsh
