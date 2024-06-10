local customizeAppearance = function()
    vim.opt.fillchars = {eob = "."} --end of buffer indicator
    vim.cmd("highlight vertsplit guibg=none")
    vim.cmd("highlight linenr guibg=none")
    vim.cmd("highlight signcolumn guibg=none")

    --nvim-cmp highlight groups
    -- gray
    vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
    -- blue
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
    -- light blue
    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
    vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
    -- pink
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
    -- front
    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
    vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
    vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

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
