
-- supposed to yank to the system clipboard but does not work on vagrant vm.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
--a when you cut, then paste, you do not lose the cut text from the buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- delete to void buffer, thus maintaining whatever was in copy buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- make a file executable with simple command.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- can also be: vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>gs', builtin.grep_string, { desc = '[S]earch current [W]ord' })

-- Nvim-Tree
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
-- vim.keymap.set('n', '(i dont have a key yet)', ':NvimTreeRefresh<CR>')
