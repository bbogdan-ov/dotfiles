prompt_git_status() {
	local ret=""
	local branch=$(command git branch --show-current 2> /dev/null)

	# Print git info if cur dir is repo
	if [[ $branch ]]; then
		local unpushed=$(command git rev-list --count @{upstream}..HEAD 2> /dev/null)
		local unpulled=$(command git rev-list --count HEAD..@{upstream} 2> /dev/null)
		local untracked=$(command git status --untracked-files=normal --porcelain 2> /dev/null | wc -l)
	
		# Print cur branch
		ret="%F{white}($branch "

		if [[ $untracked -gt 0 ]]; then
			ret+="%F{red}u"
		fi

		# Close branch bracket
		ret+="%F{white})%f "
	
		# Print the number of unpushed commits
		if [[ $unpushed -gt 0 ]]; then
			ret+="%F{yellow}↑${unpushed}%f "
		fi
		# Print the number of unpulled commits
		if [[ $unpulled -gt 0 ]]; then
			ret+="%F{yellow}↓${unpulled}%f "
		fi
	fi

	echo $ret
}
prompt_precmd() {
	PROMPT=" %(?.%F{blue}.%F{red})%c%f $(prompt_git_status)"
}
prompt_setup() {
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd prompt_precmd
}

prompt_setup
