return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	{ "numToStr/Comment.nvim", opts = {} },

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
		end,
		keys = {
			{ "<leader>c", desc = "[C]ode", _ = "which_key_ignore", mode = "n" },
			{ "<leader>d", desc = "[D]ocument", _ = "which_key_ignore", mode = "n" },
			{ "<leader>r", desc = "[R]ename", _ = "which_key_ignore", mode = "n" },
			{ "<leader>s", desc = "[S]earch", _ = "which_key_ignore", mode = "n" },
			{ "<leader>w", desc = "[W]orkspace", _ = "which_key_ignore", mode = "n" },
			{ "<leader>t", desc = "[T]oggle", _ = "which_key_ignore", mode = "n" },
			{ "<leader>h", desc = "Git [H]unk", _ = "which_key_ignore", mode = "n" },
			{ "<leader>h", desc = "Git [H]unk", mode = "v" },
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup()

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
