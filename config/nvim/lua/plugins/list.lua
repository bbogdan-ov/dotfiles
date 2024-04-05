---@type MyPlugin[]
return {
	-- Syntax
	{
		"nvim-treesitter/nvim-treesitter",
		config = "treesitter",
	},

	-- Lsp
	{
		"neovim/nvim-lspconfig",
		config = "lspconfig"
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
		}
	},

	-- Quality of life
	{
		"nvim-telescope/telescope.nvim",
		config = "telescope",
		deps = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>f", "<cmd>Tel find_files<cr>",           desc = "Open file picker" },
			{ "<leader>b", "<cmd>Tel buffers<cr>",              desc = "Open buffers picker" },
			{ "<leader>D", "<cmd>Tel diagnostics<cr>",          desc = "Open diagnostics picker" },
			{ "<leader>s", "<cmd>Tel lsp_document_symbols<cr>", desc = "Open diagnostics picker" },
			{ "<leader>t", "<cmd>Tel treesitter<cr>", 			desc = "Open treesitter picker" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = "colorizer",
	},
	{
		"mattn/emmet-vim",
		cmd = "Emmet",
		event = "BufEnter *.html",
		keys = {
			{ "<leader>m", ":Emmet ", desc = "Start emmet" }
		}
	},
	{
		"lewis6991/gitsigns.nvim",
		config = "gitsigns"
	},
	{
		"terrortylor/nvim-comment",
		config = "nvim_comment",
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
	-- Here are a few of my unsuccessful attempts in creating plugins for nvim
	{
		"bbogdan-ov/blueprints.nvim",
		dev = true,
		config = "custom.blueprints"
	},
}