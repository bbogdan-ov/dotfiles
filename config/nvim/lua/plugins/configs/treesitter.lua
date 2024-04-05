require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"javascript",
		"typescript",
		"rust",
		"lua",
		"html",
		"css",
		"scss",
		"vim",
	},
	modules = {},
	ignore_install = {},

	sync_install = true,
	auto_install = false,

	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-o>",
			node_incremental = "<A-o>",
			scope_incremental = "grc",
			node_decremental = "<A-i>",
		},
	},
}
