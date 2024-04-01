#!/usr/bin/bash

telegram=' telegram'
librewolf='󰖟 librewolf'
kitty=' kitty'

output="$telegram\n$librewolf\n$kitty"

choosed=$(echo -e $output | wofi -S dmenu)

case $choosed in
	$telegram) 		echo "telegram!";;
	$librewolf)		echo "librewolf!";;
	$kitty)			echo "kitty!";;
	*) 		   		echo "nothing!";;
esac
