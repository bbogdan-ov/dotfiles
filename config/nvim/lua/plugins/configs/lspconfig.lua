local lsp = require "lspconfig"
local cmp_cap = require('cmp_nvim_lsp').default_capabilities()

lsp.lua_ls.setup {
	capabilities = cmp_cap,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				library = {
					-- Copied from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L79
					-- Very cool!
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
					[vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
					[vim.fn.stdpath "data" .. "/lazy"] = true,
					[vim.fn.expand "$HOME" .. "/projects/nvim"] = true,
				},
			},
		}
	}
}

lsp.tsserver.setup {
	capabilities = cmp_cap
}

lsp.cssls.setup {
	capabilities = cmp_cap
}

lsp.rust_analyzer.setup {
	capabilities = cmp_cap
}
