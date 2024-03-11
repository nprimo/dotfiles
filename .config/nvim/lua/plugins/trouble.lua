return {
    "folke/trouble.nvim",

    opts = {
        icons = false,
        fold_open = "v",      -- icon used for open folds
        fold_closed = ">",    -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info",
        },
    },

    config = function(_, opts)
        require("trouble").setup(opts)

        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle()
        end)

        vim.keymap.set("n", "]d", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)

        vim.keymap.set("n", "[d", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
    end,
}
