-- mapping to splitview
vim.keymap.set("n", "<leader>vs", ":vnew<CR>")
vim.keymap.set("n", "<leader>hs", ":horizontal new<CR>")

-- mapping to replace without replacing copied buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- mapping to copy on system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set('n', "<leader>f", ":lua vim.lsp.buf.format { async = true }<CR>")
