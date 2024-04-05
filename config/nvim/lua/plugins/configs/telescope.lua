local editor = require "core.editor"

local borders = {
	prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
}

require("telescope").setup {
	defaults = {
		borderchars	= borders,
		file_ignore_patterns = { "node_modules", "target", "build", "dist" }
	},
}

local palette = _G["my_palette"]
editor.set_hls {
	TelescopeBorder   = { fg=palette.gray },
	TelescopeMatching = { fg=palette.green },
}
