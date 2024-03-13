-- Disable netrw plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- For conciseness, aliasing vim.opt to opt
local opt = vim.opt

-- Show relative line numbers
opt.relativenumber = true

-- Show absolute line number on cursor line (when relative number is on)
opt.number = true

-- Turn on termguicolors for colorscheme to work
opt.termguicolors = true

-- Turn off swapfile
opt.swapfile = false

-- Set number of context lines to see above and below the cursor
opt.scrolloff = 8

-- Tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Show sign column so that text doesn't shift
opt.signcolumn = "yes"

-- Allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

-- Disable line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- Highlight the current cursor line
opt.cursorline = true

