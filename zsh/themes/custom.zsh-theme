PROMPT=" %{$fg[blue]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}) %{$fg[green]%}%1{~%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%})"
