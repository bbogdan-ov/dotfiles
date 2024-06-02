local opt = vim.o

-- <space> is leader
vim.g.mapleader = " "

opt.termguicolors = true

local tabwidth 	= 4
opt.shiftwidth 	= tabwidth
opt.tabstop    	= tabwidth
opt.smarttab   	= true
opt.autoindent 	= true

opt.laststatus 		= 3
opt.number         	= true
opt.relativenumber 	= true
opt.signcolumn     	= "yes"
opt.completeopt    	= "menu,preview,noinsert"
opt.scrolloff 	   	= 8
opt.matchpairs     	= "(:),{:},[:],<:>"
opt.fillchars 	   	= "eob: "
opt.shm			   	= "fimnwxToOFIcC"
opt.foldcolumn		= "auto:1"
opt.foldmethod		= "manual"

opt.showmode 	= false
opt.ignorecase 	= true
opt.smartcase 	= false
opt.mouse 		= ""

opt.swapfile 	= false
opt.undofile 	= true
opt.clipboard 	= "unnamed"
