vim.keymap.set("n", "<leader>f", function()
	vim.cmd("write!")
	vim.cmd("!bunx prettier -w %")
end)
