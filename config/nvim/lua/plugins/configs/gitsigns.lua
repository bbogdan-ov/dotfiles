local editor = require "core.editor"

local function on_attach(bufnr)
	local function map(m)
		m.opts = m.opts or {}
		m.opts.buffer = bufnr
		editor.keymap(m)
	end

	map({ "n", "]g", "<cmd>Gitsigns next_hunk<cr>" })
	map({ "n", "[g", "<cmd>Gitsigns prev_hunk<cr>" })
	map({ "n", "<leader>gg", "<cmd>Gitsigns blame_line<cr>" })
	map({ "n", "<leader>gc", "<cmd>Gitsigns preview_hunk<cr>" })
end

require "gitsigns".setup {
	signs = {
		add          = { text = "│" },
		change       = { text = "│" },
		delete       = { text = "▁" },
		topdelete    = { text = "▔" },
		changedelete = { text = "~" },
		untracked    = { text = "┆" },
	},
	sign_priority = 100,
	auto_attach = true,
	attach_to_untracked = true,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 500,
	},
	preview_config = {
		border = "single",
		style = "minimal",
		relative = "cursor",
		title = " diff ",
		title_pos = "center",
		col = 0,
		row = 1,
	},

	on_attach = on_attach
}
