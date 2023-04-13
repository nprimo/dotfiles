-- mapping to splitview
vim.keymap.set("n", "<leader>vs", ":vnew<CR>")
vim.keymap.set("n", "<leader>hs", ":horizontal new<CR>")

-- mapping to replace without replacing copied buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- mapping to copy on system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Esy formatting
vim.keymap.set('n', "<leader>f", ":lua vim.lsp.buf.format { async = true }<CR>")

-- Move around without having curson moving 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
