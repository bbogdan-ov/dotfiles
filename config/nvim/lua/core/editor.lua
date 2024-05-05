local utils = require "core.utils"

local M = {}

---@class MyKeymap
---@field [1]? string | string[]
---@field [2]? string
---@field [3]? string | function
---@field [4]? string
---@field modes? string | string[]
---@field key? string
---@field cmd? string | function
---@field desc? string
---@field opts? table

---Import/require module, but safer
---Returns module and error message if exists
---@param modname string
---@return any, string | nil
function M.plug(modname)
	local is_ok, res = pcall(require, modname)
	if not is_ok then
		vim.api.nvim_err_writeln(("MODULE REQUIRE ERROR:\n%s"):format(res))
		return nil, res
	end

	return res, nil
end

---@param map MyKeymap
function M.keymap(map)
	local modes = map[1] or map.modes or { "n" }
	local key = map[2] or map.key or ""
	local cmd = map[3] or map.cmd or ""
	local desc = map[4] or map.desc or ""
	local opts = map.opts or {}

	opts.desc = desc

	if type(modes) == "string" then
		modes = utils.chars(modes)
	end

	vim.keymap.set(modes, key, cmd, opts)
end

---@param hls table[]
---@param ns? integer
function M.set_hls(hls, ns)
	ns = ns or 0

	for key, style in pairs(hls) do
		vim.api.nvim_set_hl(ns, key, style)
	end
end

---@param name string
---@param cmd string | fun(data: table)
---@param opts? table
function M.command(name, cmd, opts)
	vim.api.nvim_create_user_command(name, cmd, opts or {})
end

return M
