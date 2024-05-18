local cmp = require "cmp"
local editor = require "core.editor"

local kind_icons = {
	Text          = " text ",
	Method        = " methd ",
	Function      = " func ",
	Constructor   = " cnstr ",
	Field         = " field ",
	Variable      = " var ",
	Class         = " class ",
	Interface     = " inter ",
	Module        = " mod ",
	Property      = " prop ",
	Unit          = " unit ",
	Value         = " val ",
	Enum          = " enum ",
	Keyword       = " keyw ",
	Snippet       = " snip ",
	Color         = " color ",
	File          = " file ",
	Reference     = " ref ",
	Folder        = " dir ",
	EnumMember    = " mem ",
	Constant      = " const ",
	Struct        = " strct ",
	Event         = " event ",
	Operator      = " op ",
	TypeParameter = " type ",
}

local function win()
	return {
		border = "single",
		winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:MyReverse,Search:None",
		zindex = 1001,
		scrolloff = 0,
		col_offset = 0,
		side_padding = 1,
		scrollbar = true,
	}
end

cmp.setup {
	window = {
		completion 	  = win(),
        documentation = win(),
	},
	formatting = {
		fields = { "abbr", "kind" },
		format = function(_, item)
			item.kind = kind_icons[item.kind]
			if item.menu ~= nil and #item.menu > 10 then
				item.menu = item.menu:sub(0, 10) .. "…"
			end
			return item
		end
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm(),
	}),
	sources = {
		{ name = 'nvim_lsp', priority = 2000 },
		{ name = 'luasnip', priority = 500 },
		{
			name = 'buffer',
			priority = 100,
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
	}
}

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "path" }, { name = "cmdline" } },
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Highlights
local palette = _G["my_palette"]
editor.set_hls {
	CmpItemKindDefault 		= { fg=palette.lightgray },
	CmpItemKindText	 		= { fg=palette.gray },
	CmpItemAbbrMatchFuzzy	= { fg=palette.green },
	CmpItemAbbrMatch		= { fg=palette.green },
	CmpItemKindEnum 		= { fg=palette.enum },
	CmpItemKindEnumMember 	= { fg=palette.enum },
	CmpItemKindClass 		= { fg=palette.structure },
	CmpItemKindStruct 		= { fg=palette.structure },
	CmpItemKindField 		= { fg=palette.identifier },
	CmpItemKindProperty 	= { fg=palette.identifier },
	CmpItemKindVariable 	= { fg=palette.identifier },
	CmpItemKindKeyword 		= { fg=palette.keyword },
	CmpItemKindFunction 	= { fg=palette.func },
	CmpItemKindMethod	 	= { fg=palette.func },
	CmpItemKindInterface	= { fg=palette.structure },
	CmpItemKindModule		= { fg=palette.magenta },
	CmpItemKindSnippet 		= { fg=palette.green },
	CmpItemKindEvent 		= { fg=palette.magenta },
	CmpItemKindFile	 		= { fg=palette.blue },
	CmpItemKindFolder	 	= { fg=palette.blue },
}
