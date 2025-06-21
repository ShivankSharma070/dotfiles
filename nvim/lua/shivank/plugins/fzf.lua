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
			"gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				require("fzf-lua").lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				require("fzf-lua").lsp_typedefs()
			end,
			desc = "Goto T[y]pe Definition",
		},
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
			"<leader>fr",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
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
			"<leader>ff",
			function()
				require("fzf-lua").files({
					hidden = true,
					fd_opts = "--type f --hidden --follow --exclude node_modules --exclude .local --exclude .cache --exclude .git",
				})
			end,
			desc = "Find Files",
		},
	},
}
