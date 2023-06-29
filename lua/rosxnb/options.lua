local options = {
	clipboard = "unnamedplus", -- allow neovim to access system clipboard
	cmdheight = 1, -- more space in neovim command line for displaying messages
	pumheight = 10, -- popup menu height
	fileencoding = "utf-8", -- the endcoding writtent to a file
	fileformat = "unix",
	mouse = "a", -- allow mouse to be used in neovim
	termguicolors = true, -- set term gui colors for true colors
	hlsearch = false, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search pattern
	smartcase = true, -- companion to ignorecase, don't match small letters when capital is provided
	wrap = true, -- display line as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 8, -- min number of lines above and below the cursor
	sidescrolloff = 8, -- min number of columns eiher side of cursor if wrap is false
	number = true, -- set numbered lines
	relativenumber = true, -- set relative number lines
	numberwidth = 4, -- set number column width {default 4}
	signcolumn = "yes", -- show sign column so that the text doesn't shift
	foldcolumn = "1",
	cursorline = true, -- highlight the current line
	tabstop = 4, -- number of spaces for a tab
	shiftwidth = 4, -- number of spaces inserted for each indentation
	expandtab = true, -- convert tabs to spaces
	autoindent = true, -- copy indentation from current line when starting new one
	smartindent = true, -- make indenting smart
	splitbelow = true, -- force all horizontal splits to go below current window view
	splitright = true, -- force all vertical splits to go right of the current window view
	showtabline = 0, -- always show tabs
	showmode = false, -- don't show the things like --INSERT--
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	backspace = "indent,eol,start", -- allow backspace on indent, endofline, insert mode start position
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (default 4000ms)
	undofile = true, -- enable persistent undo
	writebackup = false, -- file not allowed to be edited by another program if in use
	background = "dark",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- vim.opt.shortmess:append "ilmnrx"                    -- flags to shorten vim messages, see :help 'sortmess'
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.runtimepath:remove("usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

-- winbar string output
local stat_navic, navic = pcall(require, "nvim-navic")
if not stat_navic then
	return
end
vim.o.winbar = navic.get_location()
