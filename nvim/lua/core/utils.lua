local M = {}

---@param str string | string[]
---@return string[]
function M.chars(str)
	if type(str) == "table" then
		return str
	end
	local result = {}
	for i=1, #str do
		table.insert(result, str:sub(i, i))
	end
	return result
end
---@param func function
---@param ... any
function M.call(func, ...)
	local args = ... or nil
	return function() func(args) end
end

return M
