#!/usr/bin/bash

file=$1
is_image=0

case $file in
	*.png) is_image=1;;
	*.jpg) is_image=1;;
	*.jpeg) is_image=1;;
esac

if [[ $is_image == 1 ]]; then
	# Preview image file

	width=$(tput cols)
	height=$(tput lines)

	# Enter alt screen
	tput smcup
	tput cup 0 0

	echo " loading..."

	# Print image
	tput cup 0 0 # Move cursor to the top left corner, so we clear the "loading" msg
	kitten icat \
		--align=left \
		--place="$((width - 2))x$((height - 4))@0x0" \
		$file

	# Wait for user input
	tput cup $height 0 	# Move cursor to bottom of the screen
	echo -en "\e[0m" 	# Clear all styles
	read -n 1 -p " press any key to exit"

	# Leave alt screen
	tput rmcup
else
	# Preview text file
	bat $file --plain --color=always | less
fi
