return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.actionlint,
                null_ls.builtins.diagnostics.shellcheck,
            },
        })
    end,
}
