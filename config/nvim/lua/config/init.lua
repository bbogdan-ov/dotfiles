local editor = require "core.editor"

-- Init
require "config.options"
require "config.commands"
require "config.statusline"
require "config.lsp"

-- Init keymaps
local keymaps = require "config.keymaps"
for _, map in ipairs(keymaps) do
	editor.keymap(map)
end
