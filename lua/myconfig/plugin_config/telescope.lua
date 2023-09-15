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

--keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', {}) 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>gs', builtin.grep_string, { desc = '[S]earch current [W]ord' })
