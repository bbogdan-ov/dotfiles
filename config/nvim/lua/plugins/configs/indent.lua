local editor = require "core.editor"

require("indentmini").setup {
	exclude = { "markdown" }
}

local palette = _G["my_palette"]
editor.set_hls {
	IndentLine = { fg=palette.lightblack },
	IndentLineCurrent = { link="IndentLine" },
}
