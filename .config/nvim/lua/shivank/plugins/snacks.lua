return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		-- -----------------------------------------------------------------------
		-- Keymaps
		-- -----------------------------------------------------------------------
		keys = {

			-- ── Files ────────────────────────────────────────────────────────────
			{
				"<leader>ff",
				function()
					Snacks.picker.files({
						hidden = true,
						filter = { cwd = true },
						follow = true,
						exclude = { "__pycache__", "vendor", "node_modules", ".local", ".cache", ".git", "go" },
					})
				end,
				desc = "Find Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent({
						follow = true,
						exclude = { "__pycache__", "vendor", "node_modules", ".local", ".cache", ".git", "go" },
					})
				end,
				desc = "Recent Files",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.files({
						cwd = vim.fn.stdpath("config"),
						hidden = true,
					})
				end,
				desc = "Find Neovim Config Files",
			},
			{
				"<leader>fz",
				function()
					Snacks.picker.treesitter()
				end,
				desc = "Treesitter Symbols (functions, vars…)",
			},
			{
				"<leader>fR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},

			-- ── Search / Grep ─────────────────────────────────────────────────
			{
				"<leader>fl",
				function()
					Snacks.picker.lines()
				end,
				desc = "Find buffer lines",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.grep({
						exclude = { "__pycache__", "vendor", "node_modules", ".local", ".cache", ".git", "go" },
					})
				end,
				desc = "Live Grep",
			},
			{
				"<leader>ft",
				function()
					Snacks.picker.todo_comments({
						exclude = { "__pycache__", "vendor", "node_modules", ".local", ".cache", ".git", "go" },
					})
				end,
				desc = "TODO / Notes",
			},

			-- ── Buffers ───────────────────────────────────────────────────────
			{
				"<leader>,",
				function()
					Snacks.picker.buffers({
						-- I always want my buffers picker to start in normal mode
						-- on_show = function()
						-- 	vim.cmd.stopinsert()
						-- end,
						finder = "buffers",
						show_empty = true,
						format = "buffer",
						hidden = false,
						unloaded = true,
						current = false,
						sort_lastused = true,
						win = {
							input = {
								keys = {
									["d"] = "bufdelete",
								},
							},
							list = { keys = { ["d"] = "bufdelete" } },
						},
						-- In case you want to override the layout for this keymap
						-- layout = "vertical",
					})
				end,
				desc = "Buffers",
			},
			{
				"<leader>Bk",
				function()
					Snacks.bufdelete.all()
				end,
				desc = "Delete All Buffers",
			},
			{
				"<leader>bK",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Delete Other Buffers",
			},
			{
				"<leader>bk",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Current Buffer",
			},

			-- ── LSP ───────────────────────────────────────────────────────────
			{
				"gR",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "LSP References",
			},


			{
				"gt",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "LSP Type definitions",
			},
			{
				"gi",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "LSP Implementation",
			},

			{
				"<leader>e",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Document Symbols",
			},
			{
				"<leader>fe",
				function()
					Snacks.picker.lsp_workspace_symbols({
						exclude = { "__pycache__", "vendor", "node_modules", ".local", ".cache", ".git", "go" },
					})
				end,
				desc = "LSP Workspace Symbols",
			},
			{
				"<leader>fD",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "LSP Diagnostics (buffer)",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "LSP Diagnostics (workspace)",
			},

			-- ── Git ───────────────────────────────────────────────────────────
			{
				"<leader>fgs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>fgf",
				function()
					Snacks.picker.git_log_file({
						confirm = function(picker, item)
							if not item then
								return
							end
							picker:close()
							vim.fn.setreg("+", item.commit) -- copy to system clipboard
							vim.fn.setreg('"', item.commit) -- copy to default register
							vim.cmd("Gsplit " .. item.commit) -- open the commit with fugitive
							Snacks.notify.info("Copied: " .. item.commit)
						end,
					})
				end,
			},
			{
				"<leader>fgl",
				function()
					Snacks.picker.git_log({
						confirm = function(picker, item)
							if not item then
								return
							end
							picker:close()
							vim.fn.setreg("+", item.commit) -- copy to system clipboard
							vim.fn.setreg('"', item.commit) -- copy to default register
							vim.cmd("Gsplit " .. item.commit) -- open the commit with fugitive
							Snacks.notify.info("Copied: " .. item.commit)
						end,
					})
				end,
			},

			-- ── Misc pickers ──────────────────────────────────────────────────
			{
				"<leader>fc",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			{
				"<leader>yy",
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<M-x>",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},

			-- ── UI toggles ────────────────────────────────────────────────────
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},

			-- ── Scratch buffers ───────────────────────────────────────────────
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},

			-- ── Notifications ───────────────────────────────────────────────
			{
				"<leader>nd",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},

			{
				"<leader>nn",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},

			-- ── Terminal ──────────────────────────────────────────────────────
			{
				"<leader>ot",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "Toggle Terminal",
			},

			-- ── Word navigation ───────────────────────────────────────────────
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},

		-- -----------------------------------------------------------------------
		-- Options
		-- -----------------------------------------------------------------------
		---@type snacks.Config
		opts = {
			image = { enabled = true },
-- 			dashboard = {
-- 				enabled = true,
-- 				sections = {
-- 					{
-- 						section = "header",
-- 					},
-- 					{ section = "startup" },
-- 				},
-- 				preset = {
-- 					header = [[
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠤⠤⠤⠴⠶⠶⠒⠚⠋⠉⠉⠉⠉⣷⢀⣀⡤⠤⠶⠶⠒⠛⢶⡄⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡀⠀⣿⠉⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣇⣾⠀⠀⠀⠀⣴⡄⢠⣿⣄⡀⣰⠏⠙⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠶⠚⠉⠉⠙⢦⣄⣀⣀⡟⠙⠋⠁⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢰⠋⢈⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠠⣆⠀⠀⢿⠀⢸⡶⢿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣤⣀⡼⠀⠀⠻⠀⠀⠙⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡖⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠳⣦⡀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⣿⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⡟⢳⣄⠀⠀⠀⠀⠙⣇⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⡿
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⢿⡀⠀⠀⠀⢀⡞⠁⠉⠓⠀⠀⠀⠀⣯⠴⠻⣆⠀⠀⠀⠀⢻⡆⠀⠀⠀⠻⠃⠀⠀⠀⠀⡇
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⢸⡇⠀⠀⠀⠘⣧⠀⠖⠚⣷⠀⠀⠀⣧⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠘⡇⠀⠀⠀⠀⠘⠷⣤⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠞⠁⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠾⣦⠀⢸⡇⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⡤⠔⠚⠉⠀⠀⠀⠀
-- ⠀⠀⣴⢦⣄⠀⠀⢀⣰⠏⠀⠘⣧⣿⠀⠀⠀⠀⢠⢾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⡤⠴⠶⠒⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⡏⠀⠈⠛⠋⠉⢀⣴⣿⣟⢿⡏⠀⠀⢀⡴⠋⠀⣧⠀⠀⢀⣀⣠⣤⣤⠤⠴⠒⠚⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⣧⢀⣴⣶⣶⡄⢾⣿⣿⡿⣸⠃⠀⢠⠞⠁⠀⠀⠈⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⢿⣿⣿⣿⣿⣿⠘⢿⣭⡵⠋⠀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠈⠳⣬⣿⣭⠯⠖⠚⠁⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⣰⠏⠀⣀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⡼⢃⡴⠚⡿⠀⠀⠀⣤⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⢀⣾⠗⠋⠀⢠⡏⠀⠀⣸⠋⢷⡀⢹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠋⠁⣄⠀⢠⡿⡇⠀⢰⡏⠀⠀⠻⣮⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠙⠛⠋⠀⡇⢠⡟⠀⠀⠀⠀⠈⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣧⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--                     ]],
-- 				},
-- 			},
			input = { enabled = true },
			explorer = { enabled = true },
			quickfile = { enabled = true },

			-- ── Notifier ────────────────────────────────────────────────────────
			notifier = {
				style = "fancy",
				enabled = true,
				top_down = true,
			},

			-- ── Indent guides ────────────────────────────────────────────────
			---@class snacks.indent.Config
			indent = {
				enabled = true,
				priority = 1,
				char = "┆",
				only_scope = true,
				only_current = true,
			},

			-- ── Picker ──────────────────────────────────────────────────────
			picker = {
				ui_select = true,
				debug = {
					scores = true, -- show scores in the list
				},
				layout = {
					preset = "vertical",
					-- When reaching the bottom of the results in the picker, I don't want
					-- it to cycle and go back to the top
					cycle = false,
				},
				layouts = {
					-- https://github.com/folke/snacks.nvim/discussions/468
					ivy = {
						layout = {
							box = "vertical",
							backdrop = false,
							row = -1,
							width = 0,
							height = 0.5,
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
							},
						},
					},
					vertical = {
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.8,
							height = 0.9,
							border = "none",
							{
								box = "vertical",
								{
									win = "input",
									height = 1,
									border = true,
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
								{ win = "list", title = " Results ", title_pos = "center", border = true },
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.5,
								border = true,
								title_pos = "center",
							},
						},
					},
				},

				matcher = {
					fuzzy = true,
					smartcase = true,
					filename_bonus = true,
					frecency = true,
				},
				win = {
					input = {
						keys = {
							-- to close the picker on ESC instead of going to normal mode,
							-- add the following keymap to your config
							["<Esc>"] = { "close", mode = { "n", "i" } },
							-- I'm used to scrolling like this in LazyGit
							["<PageDown>"] = { "preview_scroll_down", mode = { "i", "n" } },
							["<PageUp>"] = { "preview_scroll_up", mode = { "i", "n" } },
							["<C-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
							["<C-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
							["<C-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
							["<C-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
						},
					},
				},
			},
		},

		-- -----------------------------------------------------------------------
		-- Init: runs after VeryLazy; sets up globals + toggle mappings
		-- -----------------------------------------------------------------------
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Global debug helpers (lazy-loaded, no startup cost)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					-- Override `:=` to use snacks pretty-printer
					vim.print = _G.dd

					Snacks.input.enable() -- replaces dressing's input
					-- ── Toggle mappings ────────────────────────────────────────
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>os")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>oL")
					Snacks.toggle.diagnostics():map("<leader>od")
					Snacks.toggle.line_number():map("<leader>ol")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>oc")
					Snacks.toggle.treesitter():map("<leader>oT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ob")
					Snacks.toggle.inlay_hints():map("<leader>oh")
					Snacks.toggle.indent():map("<leader>og")
					Snacks.toggle.dim():map("<leader>oD")
				end,
			})
		end,
	},
}
