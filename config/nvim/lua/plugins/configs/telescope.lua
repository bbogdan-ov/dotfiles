local editor = require "core.editor"
local actions = require "telescope.actions"

local borders = {
	prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
}

require("telescope").setup {
	defaults = {
		prompt_prefix = " / ",
		prompt_title = "search",
		results_title = "results",
		borderchars	= borders,

		layout_config = {
			width = function(_, max_columns, _)
				return math.min(max_columns, 80)
			end,
			height = function(_, _, max_lines)
				return math.min(max_lines, 20)
			end,
		},

		file_ignore_patterns = { "node_modules", "target", "build", "dist" },

		mappings = {
			n = {
				["<C-c>"] = actions.close,
			}
		}
	},
	pickers = {
		find_files = {
			prompt_title = "find",
			previewer = false,
		},
		buffers = {
			prompt_title = "buffers",
			previewer = false,
			initial_mode = "normal",
		}
	}
}

local palette = _G["my_palette"]
editor.set_hls {
	TelescopeBorder   			= { fg=palette.gray },
	TelescopeMatching 			= { fg=palette.green },
	TelescopePromptPrefix 		= { fg=palette.green },
	TelescopeTitle 				= { link="Title" },
}
