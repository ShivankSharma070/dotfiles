return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		defaults = {
			git_icons = false,
			file_icons = false,
			color_icons = false,
		},
		winopts = {
			fullscreen = false, -- start fullscreen?
		},
	},

	keys = {
		{
			"<leader>fe",
			function()
				require("fzf-lua").lsp_live_workspace_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").lsp_workspace_diagnostics()
			end,
			desc = "LSP Diagnostics",
		},
		{
			"<leader>ft",
			function()
				require("fzf-lua").grep({search='BUG|TODO|HACK|PERF|NOTE|FIX', no_esc=true,
              rg_opts = "-w",
                    silent = true
                })
			end,
			desc = "Todo list",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fp",
			function()
				require("fzf-lua").files({
					cwd = "~/.config/nvim/",
					hidden = true,
				})
			end,
			desc = "Find Neovim Configuration files",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").oldfiles({
					fd_opts = "--type f --hidden --follow --exclude node_modules --exclude .local --exclude .cache --exclude .git --exclude go",
                })
			end,
			desc = "Find Files",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").files({
					hidden = true,
					fd_opts = "--type f --hidden --follow --exclude node_modules --exclude .local --exclude .cache --exclude .git --exclude go",
				})
			end,
			desc = "Find Files",
		},
	},
}
