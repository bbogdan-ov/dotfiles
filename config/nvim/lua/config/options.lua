local opt = vim.o

vim.g.mapleader = " "

opt.termguicolors = true

local tabwidth = 4
opt.shiftwidth = tabwidth
opt.tabstop    = tabwidth
opt.smarttab   = true
opt.autoindent = true

opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes"
opt.completeopt    = "menu,preview,noinsert"
opt.scrolloff 	   = 8
opt.matchpairs     = "(:),{:},[:],<:>,=:;"
opt.fillchars 	   = "eob: "
opt.shm			   = "fimnwxToOFIcC"

opt.showmode = false
opt.ignorecase = true
opt.smartcase = false
opt.mouse = ""

opt.swapfile = false
opt.undofile = true
opt.clipboard = "unnamed"
