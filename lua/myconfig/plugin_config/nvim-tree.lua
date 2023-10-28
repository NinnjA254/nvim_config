require("nvim-tree").setup({
	sync_root_with_cwd = true,
	view = {
		number = true,
		relativenumber = true,
		-- side = "right",
		side = "left",
		adaptive_size = true
	},
})
-- keymaps
vim.keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
-- vim.keymap.set('n', '(i dont have a key yet)', ':NvimTreeRefresh<CR>')
