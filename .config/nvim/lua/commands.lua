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

function DumpClean()
	local nvim_dump_buffs = vim.api.nvim_list_bufs()
	for _, v in ipairs(nvim_dump_buffs) do
		local buf_name = vim.api.nvim_buf_get_name(v)
		if string.find(buf_name, "/nprimo-dump/", 1, true) then
			print("removing " .. buf_name)
			vim.api.nvim_buf_delete(v, {})
		end
	end
end

vim.api.nvim_create_user_command("Dump", Dump, { nargs = "?" })
vim.api.nvim_create_user_command("DumpClean", DumpClean, {})
