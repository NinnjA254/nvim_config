-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

--lsp.ensure_installed({
--	'tsserver',
--	'eslint',
--	'sumneko_lua',
--})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- diagnostic messages were not appearing before I added this block
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
