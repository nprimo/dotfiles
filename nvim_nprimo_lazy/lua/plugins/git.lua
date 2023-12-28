return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gc", ":G commit --verbose<CR> && <C-W>L")
            vim.keymap.set("n", "<leader>gc!", ":G commit --verbose --amend<CR> && <C-W>L")
            vim.keymap.set("n", "<leader>glg", ":G log --stat<CR><C-W>L")
            vim.keymap.set("n", "<leader>gbl", ":G blame<CR>")
            vim.keymap.set("n", "<leader>gp", ":G push origin HEAD<CR>")
            vim.keymap.set("n", "<leader>gfp", ":!git fpush<CR>")
            vim.keymap.set("n", "<leader>grs", ":G restore %")
        end
    },
}