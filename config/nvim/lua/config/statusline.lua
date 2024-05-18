local opt = vim.opt
local api = vim.api
local severity = vim.diagnostic.severity

local NO_NAME 		= "<no name>"
local DIAGN_SIGN 	= "x"

local function render_buf_diagnostic(buf)
	local hl = ""

	local errs = #vim.diagnostic.get(buf, { severity = severity.E })
	local warns = #vim.diagnostic.get(buf, { severity = severity.W })
	local hints = #vim.diagnostic.get(buf, { severity = severity.H })

	if errs > 0 then
		hl = "%#MyStatusBufErr#"
	elseif warns > 0 then
		hl = "%#MyStatusBufWarn#"
	elseif hints > 0 then
		hl = "%#MyStatusBufHint#"
	end

	if #hl > 0 then
		return " " .. hl .. DIAGN_SIGN, errs, warns, hints
	end

	return "", 0, 0, 0
end

local function render_buf(buf)
	-- Get buf file name
	local name 		= api.nvim_buf_get_name(buf)
	local tokens  	= vim.fn.split(name or "", "/")

	local hl 		= ""
	local text 		= tokens[#tokens] or NO_NAME
	local postfix 	= ""
	local diagn, errs, warns, hints = render_buf_diagnostic(buf)

	local modified = api.nvim_buf_get_option(buf, "modified")
	local readonly = api.nvim_buf_get_option(buf, "readonly")

	if api.nvim_get_current_buf() == buf then
		-- Buf is current
		if errs > 0 then
			hl = "%#MyStatusBufErr#"
		elseif warns > 0 then
			hl = "%#MyStatusBufWarn#"
		elseif hints > 0 then
			hl = "%#MyStatusBufHint#"
		else
			hl = "%#MyStatusBufActive#"
		end
	else
		-- Buf isn't current
		hl = "%#MyStatusBuf#"
	end

	if modified then
		-- Modified flag
		postfix = postfix .. " +"
	end
	if readonly then
		-- Readonly flag
		postfix = postfix .. " -"
	end

	return ("%s %s%s%s%s %%#StatusLine#"):format(hl, text, diagn, hl, postfix)
end

local function render_diagnostic()
	local text = ""

	local errs = #vim.diagnostic.get(nil, { severity = severity.E })
	local warns = #vim.diagnostic.get(nil, { severity = severity.W })

	if errs > 0 then
		-- Errors
		text = ("%s %%#DiagnosticError#%s"):format(text, errs)
	end
	if warns > 0 then
		-- Warns
		text = ("%s %%#DiagnosticWarn#%s"):format(text, warns)
	end

	return text
end

local function render()
	local left 	= ""
	local right = "%y  %l:%c  %P" -- Buf type, cursor pos and % of display win

	right = ("%s%%#StatusLine#  %s"):format(render_diagnostic(), right)

	-- List all buffers
	for _, buf in ipairs(api.nvim_list_bufs()) do
		-- We are need only listed and loaded buffers
		local listed = api.nvim_buf_get_option(buf, "buflisted")
		local loaded = api.nvim_buf_is_loaded(buf)
		if listed and loaded then
			local buf_text = render_buf(buf)

			-- Append buf string to other buffers
			left = ("%s%s"):format(left, buf_text)
		end
	end

	-- Render statusline
	return ("%s%%=%s "):format(left, right)
end

_G.render_statusline = render
opt.statusline = "%!v:lua.render_statusline()"
