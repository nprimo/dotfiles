-- mapping to splitview
vim.keymap.set("n", "<leader>vs", ":vnew<CR>")
vim.keymap.set("n", "<leader>hs", ":horizontal new<CR>")

-- mapping to replace without replacing copied buffer
vim.keymap.set("x", "<leader>p", [["_dp]])

-- mapping to copy on system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Easy formatting
vim.keymap.set('n', "<leader>f", ":lua vim.lsp.buf.format { async = true }<CR>")

-- Move around without having curson moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Terminal utils
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Show white space
vim.keymap.set("n", "<F5>", ":set list!<CR>")

-- Open netwr
vim.keymap.set('n', '<C-n>', ':Lexplore<CR>')
