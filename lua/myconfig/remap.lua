
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

-- Nvim-Tree
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
-- vim.keymap.set('n', '(i dont have a key yet)', ':NvimTreeRefresh<CR>')
