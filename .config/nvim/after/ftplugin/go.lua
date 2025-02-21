local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

ls.add_snippets("all", {
	snip({
		trig = "ife",
		namr = "ife",
		desc = "if err != nil",
	}, {
		text({ "if err != nil {", "\treturn " }),
		insert(1),
		text({ "", "}" }),
	}),
	snip({
		trig = "struct",
		namr = "struct_snippet",
		desc = "Quickstart struct definition",
	}, {
		text({ "type " }),
		insert(1),
		text({ " struct {}" }),
	}),
})
