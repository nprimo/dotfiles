return {
	-- "nprimo/dump.nvim",
	dir = "~/nprimo/dump.nvim",
	config = function()
		local dump = require("dump")
		dump.setup()

		vim.keymap.set("n", "<leader>dn", function()
			dump.new()
		end, { desc = "Open new dump file" })
		vim.keymap.set("n", "<leader>dl", function()
			dump.list()
		end, { desc = "Open dump files list" })
		vim.keymap.set("n", "<leader>da", function()
			dump.archive()
		end, { desc = "Open dump files list to archive" })
	end,
}
