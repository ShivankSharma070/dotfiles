return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local lackluster = require("lackluster")
		local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9
		lackluster.setup({
			tweak_background = {
				-- normal = "default", -- main background
				normal = "none", -- transparent
				-- normal = '#a1b2c3',    -- hexcode
				-- normal = color.green,    -- lackluster color
				telescope = "none", -- telescope
				menu = "default", -- nvim_cmp, wildmenu ... (bad idea to transparent)
				popup = "default", -- lazy, mason, whichkey ... (bad idea to transparent)
			},
			tweak_syntax = {
				string = "default",
				-- string = "#a1b2c3", -- custom hexcode
				-- string = color.green, -- lackluster color
				string_escape = "default",
				comment = color.gray6,
				builtin = "default", -- builtin modules and functions
				type = "default",
				keyword = color.green,
				keyword_return = color.orange,
				keyword_exception = "default",
			},
			tweak_ui = {
				disable_undercurl = false, -- set to true if you want underline instead of undercurl
				enable_end_of_buffer = false, -- set to true to show the end_of_buffer ~ symbols in the gutter
			},
			tweak_highlight = {
				-- modify @keyword's highlights to be bold and italic
				["@keyword"] = {
					overwrite = false, -- overwrite falsey will extend/update lackluster's defaults (nil also does this)
					bold = true,
					italic = true,
					-- see `:help nvim_set_hl` for all possible keys
				},
				-- overwrite @function to link to @keyword
				["@function"] = {
					overwrite = true, -- overwrite == true will force overwrite lackluster's default highlights
					link = "@keyword",
				},
			},
		})

		-- !must set colorscheme after calling setup()!
	-- vim.cmd.colorscheme("lackluster-hack")
	end,
}
