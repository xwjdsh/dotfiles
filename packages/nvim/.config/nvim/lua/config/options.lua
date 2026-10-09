vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.tabstop = 2
opt.shiftwidth = 2
opt.wrap = false
opt.undofile = true
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless the pattern has capitals
opt.termguicolors = true -- True color
opt.signcolumn = "yes" -- Avoid text shifting when diagnostics appear
opt.scrolloff = 4 -- Lines of context around the cursor
opt.splitright = true
opt.splitbelow = true
