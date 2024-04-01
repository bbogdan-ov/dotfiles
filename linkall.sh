#!/usr/bin/bash

DOTFILES=$(realpath .)

links_found=0
links_created=0

# Funcs
echo_trivia() {
	echo -e "\e[37m$1\e[0m"
}
echo_success() {
	echo -e "\e[32m$1\e[0m"
}
echo_warn() {
	echo -e "\e[33m$1\e[0m"
}
echo_err() {
	echo -e "\e[31m$1\e[0m"
}

# Creating links
# Iterate through all files one level below
for file in */*; do
	# We need only files named "link"
	if [[ -f $file && $file == *'link' ]]; then
		dir=$(dirname $(realpath $file))
		content=$(cat $file | tr -d ' ')

		for line in $content; do

			target_is_dir=0

			target=$(eval echo $line | cut -d '=' -f1)
			target_path=$dir/$target
			dest_path=$(eval echo $line | cut -d '=' -f2)
			dest_dir_path=$(dirname $dest_path)

			link_path_pretty="./$(realpath --relative-to=$DOTFILES $dir/link)"
			target_path_pretty="./$(realpath --relative-to=$DOTFILES $target_path)"
			dest_path_pretty="~${dest_path#$HOME}"

			if [[ ! -d $dest_dir_path ]]; then
				echo_success "- dir created $dest_dir_path"
				mkdir -p $dest_dir_path
			fi

			if [[ $target == '.' ]]; then
				target_path=$dir
				target_is_dir=1
			elif [[ ! -f $target_path ]]; then
				# Target file not found
				echo_err "- target file $target_path_pretty not found, skip\n  in $link_path_pretty"
				continue
			fi

			if [[ -h $dest_path ]]; then
				# Destination file is a symlink and it is already exists, just skip
				echo_trivia "- symlink $dest_path_pretty for $target_path_pretty exists, skip"
			elif [[ -f $dest_path ]]; then
				# Oh no! Destination is a file
				echo_warn "- file $dest_path_pretty already exists, skip\n  in $link_path_pretty"
			else
				echo_success "- created a symlink $dest_path_pretty for $target_path_pretty"
				
				ln -s $target_path $dest_path
				((links_created++))
			fi

			((links_found++))
		done
	fi
done

# Log stats
if [[ $links_found == 0 ]]; then
	echo_warn "No links found"
else
	echo ""
	echo_success "Done!"
	echo "Links found: $links_found"
	echo "Links created: $links_created"
fi
