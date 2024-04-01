local editor = require "core.editor"
local b = require "blueprints.init"

editor.keymap {
	"n",
	"<leader>op",
	function()
		b.Popup.new {
			border    = "double",
			border_hl = "WarningMsg",
			title     = " my popup! ",
			title_hl  = "ErrorMsg",
		}
			:nmap("<leader>e", "<cmd>echo 'yoyooo'<cr>")
			:mount()
	end,
}
editor.keymap {
	"n",
	"<leader>oi",
	function()
		b.Input.new { value = "hey", prompt = ": " }
			:mount()
			:on_input(function(v) print("input: " .. v) end)
			:on_submit(function(v) print("submit: " .. v) end)
	end
}
