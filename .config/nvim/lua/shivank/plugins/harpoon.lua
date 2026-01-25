return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		vim.keymap.set("n", "<leader>hq", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>hs", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>hd", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>hf", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader>hg", function()
			harpoon:list():select(5)
		end)
		vim.keymap.set("n", "<leader>hz", function()
			harpoon:list():select(6)
		end)
		vim.keymap.set("n", "<leader>hx", function()
			harpoon:list():select(7)
		end)
		vim.keymap.set("n", "<leader>hc", function()
			harpoon:list():select(8)
		end)
		vim.keymap.set("n", "<leader>hv", function()
			harpoon:list():select(9)
		end)
		vim.keymap.set("n", "<leader>hb", function()
			harpoon:list():select(10)
		end)
	end,

}
