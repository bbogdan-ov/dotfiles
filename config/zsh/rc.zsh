# Theme
ZSH_THEME="custom"

# Zsh config
DISABLE_AUTO_TITLE=true
CASE_SENSITIVE=true
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

# Define plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# Init zoxide
eval "$(zoxide init zsh)"
# Init fzf
eval "$(fzf --zsh)"
