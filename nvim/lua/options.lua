local o = vim.opt

vim.g.mapleader = " "

o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.scrolloff = 10
o.fillchars:append({ eob = " " }) -- replace tildas
o.termguicolors = true

o.swapfile = false

o.clipboard = "unnamedplus"
o.guicursor = "i:block"
o.incsearch = true
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.winborder = "rounded"
o.cursorline = true -- highlight the current line
o.autoindent = true -- Enable auto indentation
