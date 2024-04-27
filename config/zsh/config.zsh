# Hightlight config
ZSH_HIGHLIGHT_STYLES[comment]='fg=white'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=white'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=white'

# Fzf config
FZF_COMPLETION_TRIGGER='//'
FZF_COMPLETION_OPTS='--border --info=inline'

_fzf_comprun() {
	local command=$1
	shift

	case "$command" in
		cd)           fzf --preview 'ls -1 {} | head -200'   "$@" ;;
		export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
		*)            fzf --preview 'bat -n --color=always {}' "$@" ;;
	esac
}

