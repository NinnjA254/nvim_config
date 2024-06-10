-- supposed to yank to the system clipboard but does not work on vagrant vm.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--a when you cut, then paste, you do not lose the cut text from the buffer
vim.keymap.set("x", "<leader>p", "\"_dP") --"x" means only in visual mode and not in select mode

-- delete to void buffer, thus maintaining whatever was in copy buffer
vim.keymap.set({"n","v"}, "<leader>d", "\"_d")

-- make a file executable with simple command.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

--window resizing 
vim.keymap.set("n", "<M-l>", "<C-W>5>")
vim.keymap.set("n", "<M-h>", "<C-W>5<")
vim.keymap.set("n", "<M-k>", "<C-w>+")
vim.keymap.set("n", "<M-j>", "<C-w>-")
vim.keymap.set("n", "<M-=>", "<C-w>=")

-- buffer navigation
vim.keymap.set("n", "<leader>]", ":bnext<CR>")
vim.keymap.set("n", "<leader>[", ":bprev<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

--make jumping to normal mode work normally in terminal buffers
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') --strange behavior: 👇
-- mapping <C-;> doesn't work at all, but mapping <Esc> or <C-[> causes <Esc>, <C-[>
-- and <C-;> to all work. not really a problem, just strange
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')
