vim.g.mapleader = " "
vim.g.maplocalleader = " "

--disable netrw at the start. strongly advised by vimtree (from the primeagen)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

--mouse
vim.opt.mouse = "a"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

--search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.o.completeopt = 'menuone,noselect'

vim.wo.signcolumn = 'yes'
vim.cmd("highlight signcolumn guibg=none")
