local editor = require "core.editor"
local utils = require "core.utils"

local c = utils.call
local cmd = editor.command

cmd("Q", "q")
cmd("W", "w")
cmd("ResetDiagnostic", c(vim.diagnostic.reset))
