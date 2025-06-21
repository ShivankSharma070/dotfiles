return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		leap.add_default_mappings()
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
		vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
	end,
}


