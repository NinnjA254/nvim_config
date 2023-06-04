local lspconfig = require 'lspconfig'

lspconfig.quick_lint_js.setup {
	on_attach = function()
		print "deez"
	end,
}
lspconfig.tsserver.setup {
	on_attach = function()
		print "deez"
		vim.lsp.buf.format()
		vim.keymap.set('n', 'K', vim.lsp.buf.hover)
		vim.keymap.set('n', 'P', vim.lsp.buf.format)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
		vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next)
		vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev)
		vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<CR>") 
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename) 
	end,
}
