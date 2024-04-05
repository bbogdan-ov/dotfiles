hi clear
lua << EOF

local black      = "#111111"
local lightblack = "#222222"
local darkgray   = "#333333"
local gray       = "#555555"
local lightgray  = "#b5b5b5"
local white      = "#dadada"
local red        = "#fb5f68"
local yellow     = "#fadf65"
local green      = "#a4cd51"
local cyan       = "#96d8ff"
local lightcyan  = "#c1d7ff"
local blue       = "#7998ff"
local lightblue  = "#94b7ff"
local magenta    = "#bf93ff"

local fg          = white
local bg          = black
local ok 		  = green
local err	 	  = red
local warn        = yellow
local info        = cyan
local hint 		  = magenta

local linenr      = gray
local cursor_line = lightblack

local comment     = gray
local number      = yellow
local string      = green
local boolean     = yellow
local func        = blue
local keyword     = magenta
local macro       = magenta
local special     = cyan
local identifier  = lightcyan
local structure   = lightblue
local inter       = yellow
local enum        = yellow
local typ         = yellow

_G["my_palette"] = {
	black      = black,
	lightblack = lightblack,
	darkgray   = darkgray,
	gray       = gray,
	lightgray  = lightgray,
	white      = white,
	red        = red,
	yellow     = yellow,
	green      = green,
	cyan       = cyan,
	lightcyan  = lightcyan,
	blue       = blue,
	lightblue  = lightblue,
	magenta    = magenta,

	comment    = comment,
	number     = number,
	string     = string,
	boolean    = boolean,
	func       = func,
	keyword    = keyword,
	macro      = macro,
	special    = special,
	identifier = identifier,
	structure  = structure,
	inter      = inter,
	enum       = enum,
	typ        = typ,
}

local hi = {}

-- UI
hi.Normal                  		= { fg=fg, bg=bg }
hi.Error                   		= { fg=bg, bg=err, bold=true }
hi.WarningMsg                   = { fg=bg, bg=warn, bold=true }
hi.MoreMsg	                   	= { fg=green }
hi.Title				   		= { fg=bg, bg=lightcyan, bold=true }
hi.VertSplit			   		= { fg=lightblack, bg=bg }
hi.FloatBorder					= { fg=darkgray, bg=bg }
hi.NonText 						= { fg=gray }
hi.Pmenu				   		= { link="Normal" }
hi.ErrorMsg                		= { link="Error" }

hi.Cursor 				   		= { fg=bg, bg=fg }
hi.Visual				   		= { reverse=true, bold=true }
hi.LineNr				   		= { fg=linenr }
hi.CursorLineNr			   		= { fg=linenr, bg=cursor_line }
hi.CursorLine 			   		= { bg=cursor_line }
hi.SignColumn			   		= { fg=linenr, bg=bg }
hi.MatchParen			   		= { fg=yellow, underline=true }
hi.Search				   		= { reverse=true }
hi.Directory					= { fg=blue }
hi.CursorColumn 		   		= { link = "CursorLine" }
hi.EndOfBuffer 			   		= { link = "LineNr" }

-- Lines
hi.StatusLine					= { fg=lightgray, bg=bg }
hi.StatusLineNc					= { fg=lightblack, bg=bg }

-- Diff
hi.DiffAdd 						= { fg=green }
hi.DiffChange 					= { fg=blue }
hi.DiffDelete 					= { fg=red }

-- Syntax
hi.Identifier 					= { fg=identifier }
hi.Structure 					= { fg=structure }
hi.Comment 				   		= { fg=comment }
hi.Number				   		= { fg=number }
hi.String				   		= { fg=string }
hi.Boolean				   		= { fg=boolean }
hi.Function				   		= { fg=func }
hi.Statement			   		= { fg=keyword }
hi.Type			    	   		= { fg=typ }
hi.Special 				   		= { fg=special }
hi.Macro						= { fg=macro }
hi.Todo					   		= { fg=bg, bg=yellow }
hi.PreProc				   		= { fg=yellow }
hi.Constant 					= { link="Identifier" }
hi.Delimeter			   		= { link="Special" }
hi.Operator 			   		= { link="Special" }

-- Treesitter
hi["@constructor"]				= { link="Structure" }
-- Markdown
hi["@markup.heading.1"]			= { fg=green }
hi["@markup.heading.2"]			= { link="@markup.heading.1.markdown" }
hi["@markup.heading.3"]			= { link="@markup.heading.2.markdown" }
hi["@markup.heading.4"]			= { link="@markup.heading.3.markdown" }
hi["@markup.heading.5"]			= { link="@markup.heading.4.markdown" }
hi["@markup.heading.6"]			= { link="@markup.heading.5.markdown" }
hi["@markup.strong"] 			= { bold=true }
hi["@markup.italic"] 			= { italic=true }
hi["@markup.strikethrough"] 	= { strikethrough=true }
hi["@markup.link"] 				= { fg=blue, underline=true }

-- Diagnostic              		
hi.DiagnosticOk 		   		= { fg=ok }
hi.DiagnosticError		   		= { fg=err }
hi.DiagnosticWarn		   		= { fg=warn }
hi.DiagnosticInfo		   		= { fg=info }
hi.DiagnosticHint 		   		= { fg=hint }
hi.DiagnosticUnderlineOk 		= { undercurl=true, sp=ok }
hi.DiagnosticUnderlineError		= { undercurl=true, sp=err }
hi.DiagnosticUnderlineWarn		= { undercurl=true, sp=warn }
hi.DiagnosticUnderlineInfo		= { undercurl=true, sp=info }
hi.DiagnosticUnderlineHint 		= { undercurl=true, sp=hint }

--
for key, style in pairs(hi) do
	vim.api.nvim_set_hl(0, key, style)
end

EOF
