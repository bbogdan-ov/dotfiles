---@type MyPlugin[]
return {
	-- Syntax
	{
		"nvim-treesitter/nvim-treesitter",
		config = "treesitter",
		event = "BufEnter"
	},

	-- Lsp
	{
		"neovim/nvim-lspconfig",
		config = "lspconfig",
		event = "BufEnter"
	},
	{
		"hrsh7th/nvim-cmp",
		config = "cmp",
		deps = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			"L3MON4D3/LuaSnip"
		},
		event = { "InsertEnter", "CmdlineEnter" }
	},

	-- Quality of life
	{
		"nvim-telescope/telescope.nvim",
		config = "telescope",
		deps = { "nvim-lua/plenary.nvim" },
		cmd = { "Tel", "Telescope" },
		keys = {
			{ "<leader>f", "<cmd>Tel find_files<cr>",           desc = "Open file picker" },
			{ "<leader>e", "<cmd>Tel buffers<cr>",              desc = "Open buffers picker" },
			{ "<leader>D", "<cmd>Tel diagnostics<cr>",          desc = "Open diagnostics picker" },
			{ "<leader>s", "<cmd>Tel lsp_document_symbols<cr>", desc = "Open diagnostics picker" },
			{ "<leader>t", "<cmd>Tel treesitter<cr>", 			desc = "Open treesitter picker" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = "colorizer",
		event = "BufEnter"
	},
	{
		"mattn/emmet-vim",
		cmd = "Emmet",
		event = "BufEnter *.html, BufEnter *.css",
		keys = {
			{ "<leader>m", ":Emmet ", desc = "Start emmet" }
		}
	},
	{
		"lewis6991/gitsigns.nvim",
		config = "gitsigns"
	},
	{
		"junegunn/vim-easy-align",
		event = "BufEnter"
	},
	{
		"instant-markdown/vim-instant-markdown",
		config = "instantmarkdown",
		event = "BufEnter *.md"
	},
	{
		"folke/flash.nvim",
		config = "flash",
		event = "VeryLazy",
		keys = {
			{ "ss", mode = { "n", "v" }, function() require "flash".jump() end, desc = "Activate flash!" },
			{ "r",  mode = { "o" },      function() require "flash".remote() end, desc = "Activate remote flash" },
			{ "st", mode = { "n", "v" }, function() require "flash".treesitter() end, desc = "Activate flash treesitter" },
			{ "sT", mode = { "n", "v" }, function() require "flash".treesitter_search() end, desc = "Activate flash treesitter search" },
		}
	},
	{
		"nvimdev/indentmini.nvim",
		config = "indent",
		event = "BufEnter"
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		opts = {}
	},

	-- Custom
	-- This is custom theme
	{
		"custom",
		dir = "colors",
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd "colorscheme custom"
		end
	},
}
