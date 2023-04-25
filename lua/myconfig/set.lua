--disable netrw at the start. strongly advised by vimtree (from the primeagen)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

--mouse
vim.opt.mouse = "a"

--search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.mapleader = " "

--signcolumn (on the left)
--signcolumn config fo gitsigns can be found should be put in gitsigns.lua
vim.opt.signcolumn = "auto:1-5"
vim.cmd("highlight signcolumn guibg=none")
