PROMPT=" %{$fg[blue]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)$(git_commits_ahead)$(git_commits_behind)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}u%{$fg[white]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%})"

ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$fg[yellow]%}↑"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg[yellow]%}↓"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%} "
