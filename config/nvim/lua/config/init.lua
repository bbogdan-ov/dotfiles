local editor = require "core.editor"
local plug = editor.plug

-- Init
plug "config.options"
plug "config.commands"
plug "config.statusline"
plug "config.lsp"

-- Init keymaps
local keymaps = require "config.keymaps"
for _, map in ipairs(keymaps) do
	editor.keymap(map)
end
