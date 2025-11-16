return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},
			numhl = false,
		})
		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
	end,
}
