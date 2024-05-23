local customizeAppearance = function(colorscheme)
    vim.opt.fillchars = {eob = "."} --end of buffer indicator
    vim.cmd("highlight vertsplit guibg=none")
    vim.cmd("highlight linenr guibg=none")
    vim.cmd("highlight signcolumn guibg=none")

    --transparent background, expecting this to break lol
    vim.cmd("highlight normal guibg=none")
    vim.cmd("highlight normalfloat guibg=none")
    vim.cmd("highlight nontext guibg=none")
end

-- customize appearance(transparent background, etc) whenever colorscheme is changed
-- message to future self, is above comment useful or just stating the obvious?
vim.api.nvim_create_augroup('customizeAppearance', {clear=true});
vim.api.nvim_create_autocmd('Colorscheme',{ 
    pattern='*',
    callback = customizeAppearance,
    group = 'customizeAppearance'
})

vim.cmd("colorscheme jellybeans")
