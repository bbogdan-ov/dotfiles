function to-nvim-addr() {
	echo /tmp/$(echo "nvim$(pwd)" | sed -e 's/\//-/g' -e 's/ /-/g')
}
