export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/config/zsh
export ZSH_PLUGINS=$ZSH/plugins

########################################
# Source
########################################

source $ZSH/env.zsh
source $ZSH/aliases.zsh

########################################
# Options
########################################

export HISTFILE=$HOME/.zsh-history
export HISTSIZE=1000
export SAVEHIST=1000

# Ls colors
export ZLS_COLORS='no=0:fi=0:di=34:ln=36:pi=35:so=35:bd=43;30;1:cd=33:or=31;1:ex=32'

setopt histignorealldups	# Do not save duplicates in history
setopt autopushd			# Save visited dirs
setopt pushdignoredups		## Don't save visited duplicates

########################################
# Autoload
########################################

fpath+=$ZSH

zmodload zsh/complist

autoload -U compinit; compinit		# Enable competion
autoload -Uz prompt.zsh; prompt.zsh	# Load prompt

########################################
# Binds
########################################

# Remove first word (command)
function remove-cmd() {
	BUFFER=$(sed -e 's/[[:alpha:]]*//' <<< $BUFFER)
	CURSOR=0
}

zle -N remove-cmd

bindkey -e # Enable emacs keybinds

bindkey '^[[Z' 		reverse-menu-complete 	# S-Tab - prev completion
bindkey '^[[1~' 	beginning-of-line		# Home - goto line start
bindkey '^[[4~' 	end-of-line				# End - goto line end
bindkey	'^[[1;5C' 	forward-word			# C-Right - One word forward
bindkey	'^[[1;5D' 	backward-word			# C-Left - One word backward
bindkey	'^H' 		backward-delete-word	# C-Backspace - Delete one word backwards
bindkey '\e\e' 		remove-cmd				# Double Esc - Remove command

########################################
# Styles
########################################

zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' menu select				# Menu completion
zstyle ':completion:*' file-sort modification	# Sort completions by modification time

zstyle ':completion:*:*:*:*:commands' group-name '' 		# Group cmd types
zstyle ':completion:*' list-colors "${(s.:.)ZLS_COLORS}"	# Highlight files

# Messages formats
zstyle ':completion:*:*:*:*:descriptions' 	format ' %F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' 	format ' %F{magenta}-- %d --%f'
zstyle ':completion:*:messages' 			format ' %F{yellow}?- %d -?%f'
zstyle ':completion:*:warnings' 			format '%K{red}%F{black}%B !- no matches found -! %b%f%k'

########################################
# Init plugins and tools
########################################

plug zsh-autosuggestions
plug zsh-syntax-highlighting

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

source $ZSH/plugins.zsh
