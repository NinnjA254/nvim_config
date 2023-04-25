-- signcolumn appearance(integrates with the rest of signcolumn config at set.lua)
vim.cmd("highlight gitsignsadd guibg=none")
vim.cmd("highlight gitsignschange guibg=none") --doesn't work on startup, investigate
vim.cmd("highlight gitsignsdelete guibg=none")
