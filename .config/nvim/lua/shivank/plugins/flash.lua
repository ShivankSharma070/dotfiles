return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = {
			search = {
				enabled = false,
			},
			char = {
				jump_labels = true,
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = { "o" },
			function()
				require("flash").remote()
			end,
			desc = "Remote Action",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
	-- Add config function to set custom highlights
	config = function(_, opts)
		require("flash").setup(opts)

		-- Custom highlight groups for Flash
		-- Current match: dark grey background
		vim.api.nvim_set_hl(0, "FlashCurrent", {
            fg = "#00ffff",
			bg = "#1a1a1a",
			bold = true,
		})

		-- Labels: Bright cyan on dark background for maximum visibility
		vim.api.nvim_set_hl(0, "FlashLabel", {
			fg = "#00ffff",
            bg = "#1a1a1a",
			bold = true,
			underline = false,
		})

		-- Non-current matches: no background, just subtle text
		vim.api.nvim_set_hl(0, "FlashMatch", {
			fg = 	"#8B8B8B",
            bg = "black", -- No background
		})

		-- Backdrop: keep normal (don't dim other text)
		vim.api.nvim_set_hl(0, "FlashBackdrop", {
			fg = "#8B8B8B",
			bg = "NONE",
		})

		-- Alternative label colors if cyan doesn't work for you:
		-- Bright yellow: fg = "#ffff00"
		-- Bright green: fg = "#00ff00"
		-- Bright magenta: fg = "#ff00ff"
		-- Hot pink: fg = "#ff1493"
        -- Cyan : #00ffff
	end,
}
