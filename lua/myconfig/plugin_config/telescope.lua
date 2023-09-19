require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',

			'--smart-case',
			'--hidden',
			'--glob',
			'!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock}',  --todo: look into globbing syntax
			-- '--path-separator',
			-- '/',
		}
	},
	pickers = {
		find_files = {
			-- hidden = true,
			find_command = {
				'rg',
				'--files',
				'--color=never',
				'--line-number', --do I really need this? investigate
				'--column',--do I really need this? investigate
				'--smart-case',
				'--hidden',
				'--glob',
				'!{**/.git/*,**/node_modules/*}',  --todo: look into globbing syntax
				-- '--path-separator',
				-- '/',
			},
		}
	}
}

require('telescope').load_extension('fzf')

--keymaps
local builtin = require('telescope.builtin') --todo: [F]ind or [F]ind for these keymaps?
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = '[F]ind [F]iles'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[l]ist [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = '[F]ind [H]elp tags'})
vim.keymap.set('n', '<leader>gs', builtin.grep_string, { desc = '[G]rep [S]tring' })

vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {desc = '[F]ind [S]ymbols'})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = '[F]ind [R]eferences' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })

vim.keymap.set('n', '<leader>color', builtin.colorscheme, { desc = 'colorschemes' })
