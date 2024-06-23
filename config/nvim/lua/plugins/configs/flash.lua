local flash = require "flash"
local editor = require "core.editor"
local utils = require "core.utils"

local c  = utils.call
local map = editor.keymap

flash.setup {
	modes = {
		search = { enabled = true },
		char = { enabled = false },
	},
	remote_op = {
		restore = true,
		motion = true,
	},
	prompt = {
		prefix = { { "flash: ", "FlashPromptIcon" } }
	}
}

-- map { "vn", "ss", c(flash.jump), "Activate flash!" }
-- map { "o", "r", c(flash.remote), "Activate remote flash" }
-- map { "vn", "sd", c(flash.treesitter), "Activate flash treesitter" }
-- map { "vn", "sD", c(flash.treesitter_search), "Activate flash treesitter search" }
