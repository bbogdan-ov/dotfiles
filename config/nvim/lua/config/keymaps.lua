local utils = require "core.utils"
local c = utils.call

return {
	{ "nvi", "<C-c>",			"<esc>",							"Escape" },
	{ "n",   "<Tab>",			"<cmd>bn<cr>",						"Next buffer" },
	{ "n",   "<S-Tab>",			"<cmd>bp<cr>",						"Prev buffer" },
	{ "n",   "<leader>w",		"<cmd>bd<cr>",						"Delete buffer" },
	{ "n",   "<leader>W",		"<cmd>bufdo bd<cr>",				"Delete all buffers" },
	{ "nv",  "<C-l>",			"$",								"Goto line end" },
	{ "nv",  "<C-h>",			"^",								"Goto line start" },
	{ "nv",  "U",				"<C-r>",							"Redo" },
	{ "nv",  "]<space>",		"<cmd>norm o<cr>",					"Add line below" },
	{ "nv",  "[<space>",		"<cmd>norm O<cr>",					"Add line above" },
	{ "v",   "s",               ":s/",								"Replace in selection" },
	{ "n",   "dc",              "0D",								"Clear line" },
	{ "nv",  "mm",				"%",								"Goto pair" },
	{ "n",   "dm",				"d%",								"Delete till pair" },
	{ "n",   "cm",				"c%",								"Change till pair" },
	{ "n",   "<leader>xh",		"<cmd>split<cr><C-w>j",				"Horizontal split" },
	{ "n",   "<leader>xx",		"<cmd>vsplit<cr><C-w>l",			"Vertical split" },
	{ "i",   "jj",				"<esc>",							"Leave insert mode" },
	{ "n",   "<leader>c/",		"<cmd>noh<cr>", 					"Hide search hl" },

	{ "n",	 "<leader>k",		c(vim.lsp.buf.hover),				"Open lsp hover" },
	{ "n",	 "<leader>a",		c(vim.lsp.buf.code_action),			"Open lsp code actions" },
	{ "n",	 "gd",				c(vim.lsp.buf.definition),			"Goto definition" },
	{ "n",	 "gr",				c(vim.lsp.buf.references),			"Goto references" },
	{ "n",	 "<leader>r",		c(vim.lsp.buf.rename),				"Rename" },
	{ "n",	 "<leader>d",		c(vim.diagnostic.open_float),		"Open diagnostic float" },
	{ "n",	 "]d",				c(vim.diagnostic.goto_next),		"Goto next diagnostic" },
	{ "n",	 "[d",				c(vim.diagnostic.goto_prev),		"Goto prev diagnostic" },

	{ "v",   "R",				'"_d""P',							"Delete and paste" },
	{ "n",   "R",				'"_x""P',							"Delete and paste" },
	{ "n",   "<leader>p",       '"+p',								"Paste after from sys clipboard" },
	{ "n",   "<leader>P",       '"+P',								"Paste before from sys clipboard" },
	{ "nv",  "<leader>y",       '"+y',								"Yank to sys clipboard" },
	{ "v",   "<leader>R",       '"+p',								"Delete and paste from sys clipboard" },
	{ "nv",  "<A-d>",			'"_d',								"Delete without yunking" },
	{ "nv",  "<A-c>",			'"_c',								"Change without yunking" },
	{ "n",   "x",				'"_x',								"Delete one char without yunking" },

	{ "i",   "<C-e>",			"<cmd>norm $<cr>" },
	{ "i",   "<C-a>",			"<cmd>norm ^<cr>" },

	-- Unbind
	{ "nv", "<left>",  "" },
	{ "nv", "<up>",    "" },
	{ "nv", "<right>", "" },
	{ "nv", "<down>",  "" },
}
