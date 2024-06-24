-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Dump - Jump to Dump ]]
function Dump(topic)
	if topic.args == "" then
		topic.args = "logs"
	end
	local cmd = "e ~/nprimo-dump/" .. topic.args .. ".md"
	vim.cmd(cmd)
	-- TODO: is there a way to have autocomplete based on existing files?
end

function DumpReturn()
	-- TODO: this should work only if you're in the dump directory...
	-- - check ways to interact with opened buffers with nvim. For example,
	-- select all buffers that starts with given prefix

	print("WIP")
end

vim.api.nvim_create_user_command("Dump", Dump, { nargs = "?" })
