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
		event = "VeryLazy"
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
		event = "BufEnter"
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
		"brenoprata10/nvim-highlight-colors",
		event = "BufEnter",
		opts = {
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
		}
	},
	{
		"lewis6991/gitsigns.nvim",
		config = "gitsigns",
		event = "VeryLazy"
	},
	{
		"junegunn/vim-easy-align",
		keys = {
			{ "ga",	mode = { "v", "n" }, "<Plug>(EasyAlign)" }
		}
	},
	{
		"folke/flash.nvim",
		config = "flash",
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
		config = function()
			local pairs = require "nvim-autopairs"
			local Rule = require "nvim-autopairs.rule"

			pairs.setup {}

			pairs.add_rule(Rule("<", ">"))
		end
	},
	{
		"echasnovski/mini.surround",
		event = "InsertEnter",
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
