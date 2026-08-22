local function patch_flash_searchstate()
	local Hacks = require("flash.hacks") -- triggers flash's own ffi.cdef of the old symbols
	local ffi = require("ffi")

	-- Old standalone symbol still resolvable? then leave flash's own hacks alone.
	if pcall(function()
		return ffi.C.search_match_lines
	end) then
		return
	end

	-- New: SearchState struct (src/nvim/search_defs.h), exported global `Search`.
	pcall(
		ffi.cdef,
		[[
      typedef struct {
        bool    hl_match;
        int32_t match_lines;
        int     match_endcol;
        int32_t first_line;
        int32_t last_line;
        bool    no_smartcase;
        int     cmdlen;
        bool    no_hlsearch;
      } SearchState;
      SearchState Search;
    ]]
	)

	-- Struct not resolvable? leave flash as-is (don't make it worse).
	if not pcall(function()
		return ffi.C.Search.match_lines
	end) then
		return
	end

	local C = ffi.C
	local Pos = require("flash.search.pos")
	local incsearch_state = {}

	function Hacks.get_end_pos(from)
		local ret = Pos({
			from[1] + C.Search.match_lines,
			math.max(0, C.Search.match_endcol - 1),
		})
		local line = vim.api.nvim_buf_get_lines(0, ret[1] - 1, ret[1], false)[1]
		local char_idx = vim.fn.charidx(line, ret[2])
		ret[2] = vim.fn.byteidx(line, char_idx)
		return ret
	end

	function Hacks.save_incsearch_state()
		incsearch_state = {
			match_endcol = C.Search.match_endcol,
			match_lines = C.Search.match_lines,
		}
	end

	function Hacks.restore_incsearch_state()
		C.Search.match_endcol = incsearch_state.match_endcol
		C.Search.match_lines = incsearch_state.match_lines
	end
end
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
        patch_flash_searchstate()
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
