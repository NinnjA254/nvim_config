vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme jellybeans")
vim.opt.fillchars = {eob = "."} --end of buffer indicator
vim.cmd("highlight vertsplit guibg=none")
vim.cmd("highlight linenr guibg=none")
vim.cmd("highlight signcolumn guibg=none")

--transparent background, expecting this to break lol
vim.cmd("highlight normal guibg=none")
vim.cmd("highlight normalfloat guibg=none")
vim.cmd("highlight nontext guibg=none")

