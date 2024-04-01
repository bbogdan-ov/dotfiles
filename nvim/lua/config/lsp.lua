-- Signs
vim.fn.sign_define("DiagnosticSignError", {
	texthl = "DiagnosticError",
	text = "x"
})
vim.fn.sign_define("DiagnosticSignWarn", {
	texthl = "DiagnosticWarn",
	text = "x"
})
vim.fn.sign_define("DiagnosticSignInfo", {
	texthl = "DiagnosticInfo",
	text = "x"
})
vim.fn.sign_define("DiagnosticSignHint", {
	texthl = "DiagnosticHint",
	text = "x"
})

-- Diagnostic
vim.diagnostic.config({
	update_in_insert = true,
	severity_sort = true,
	virtual_text = {
		prefix = "x",
		spacing = 2,
	},
	float = {
		border = "single",
		title = " diagnostic "
	}
})

-- Hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
	title = " hover "
})
