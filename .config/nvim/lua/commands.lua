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
	-- INFO: the Dump is supposed to be a "RAM" for your brain.
	-- It can be useful to "separate" already the dump depending on the area:
	-- - work
	-- - personal life
	-- - specific project
	-- - ...
	vim.cmd("! mkdir -p " .. "~/nprimo-dump/" .. topic.args)
	local cmd = "e ~/nprimo-dump/" .. topic.args .. "/logs.md"
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

function NewNote(title)
	if title.args == "" then
		title.args = "New title"
	end

	-- local now = os.time(os.date("*t"))
	local id_datetime = os.date("%Y%m%dT%H%M%S")
	local cmd = "e ~/nprimo-dump/notes/" .. id_datetime .. ".md"

	vim.cmd(cmd)
end

-- TODO: think about using only "NewNote" for dumping
-- - need to do some "extra" work at the end of the day, or beginning of new
-- one  to organize previous days jots
-- - simplify the workflow:
--   - always "dump" in the same place
--   - organize after, creating links + adding a "Content of table" note to
--   have additional organization for "entry points"
vim.api.nvim_create_user_command("Dump", Dump, { nargs = "?" })
vim.api.nvim_create_user_command("DumpClean", DumpClean, {})
vim.api.nvim_create_user_command("NewNote", NewNote, { nargs = "?" })
