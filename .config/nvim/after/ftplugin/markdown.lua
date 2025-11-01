vim.keymap.set("n", "<leader>f", function()
	vim.cmd("write!")
	vim.cmd("!npx prettier -w %")
end)
