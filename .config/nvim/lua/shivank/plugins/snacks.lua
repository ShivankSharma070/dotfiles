return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
    keys = {
			-- LSP
			-- {
			-- 	"gd",
			-- 	function()
			-- 		Snacks.picker.lsp_definitions()
			-- 	end,
			-- 	desc = "Goto Definition",
			-- },
			-- {
			-- 	"gD",
			-- 	function()
			-- 		Snacks.picker.lsp_declarations()
			-- 	end,
			-- 	desc = "Goto Declaration",
			-- },
			-- {
			-- 	"gr",
			-- 	function()
			-- 		Snacks.picker.lsp_references()
			-- 	end,
			-- 	nowait = true,
			-- 	desc = "References",
			-- },
			-- {
			-- 	"gI",
			-- 	function()
			-- 		Snacks.picker.lsp_implementations()
			-- 	end,
			-- 	desc = "Goto Implementation",
			-- },
			-- {
			-- 	"gy",
			-- 	function()
			-- 		Snacks.picker.lsp_type_definitions()
			-- 	end,
			-- 	desc = "Goto T[y]pe Definition",
			-- },
			-- {
			-- 	"<leader>fx",
			-- 	function()
			-- 		Snacks.picker.lsp_symbols()
			-- 	end,
			-- 	desc = "LSP Symbols",
			-- },
			--
			-- {
			-- 	"<leader>fs",
			-- 	function()
			-- 		Snacks.picker.grep({
			-- 			exclude = { "/node_modules/", "/.dropbox/", "/.local/", "/.cache/" },
			-- 		})
			-- 	end,
			-- 	desc = "Grep CWD",
			-- },

			{
				"<leader>fz",
				function()
					Snacks.picker.treesitter()
				end,
				desc = "Lists function names, variables from treesitter",
			},

			-- File Picker for Neovim
			-- {
			-- 	"<leader>fp",
			-- 	function()
			-- 		Snacks.picker.files({
			-- 			finder = "files",
			-- 			cwd = "~/.config/nvim/",
			-- 			hidden = true,
			-- 			format = "file",
			-- 			show_empty = true,
			-- 			supports_live = true,
			-- 			-- In case you want to override the layout for this keymap
			-- 			layout = "vertical",
			-- 		})
			-- 	end,
			-- 	desc = "Find Neovim Configuration files",
			-- },

			-- -- Recent File Picker
			-- {
			-- 	"<leader>fr",
			-- 	function()
			-- 		Snacks.picker.recent({
			-- 			finder = "recent",
			-- 			hidden = true,
			-- 			format = "file",
			-- 			show_empty = true,
			-- 			supports_live = true,
			-- 			-- In case you want to override the layout for this keymap
			-- 			layout = "vertical",
			-- 		})
			-- 	end,
			-- 	desc = "Find Recent Files",
			-- },

			-- File picker
			-- {
			-- 	"<leader>ff",
			-- 	function()
			-- 		Snacks.picker.files({
			-- 			finder = "files",
			-- 			hidden = true,
			-- 			format = "file",
			-- 			show_empty = true,
			-- 			exclude = { "/node_modules/", "/.dropbox/", "/.local/", "/.cache/" },
			-- 			supports_live = true,
			-- 			-- In case you want to override the layout for this keymap
			-- 			layout = "vertical",
			-- 		})
			-- 	end,
			-- 	desc = "Find Files",
			-- },

			-- Zen Mode On/Off
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},

			-- Zoom mode
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},

			-- Scratch buffer (persistance)
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},

			-- Select Scratch buffer
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},

			-- Delete All Buffers
			{
				"<leader>Bk",
				function()
					Snacks.bufdelete.all()
				end,
				desc = "Delete All Buffer",
			},

			-- Delete all other buffer
			{
				"<leader>bK",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Delete Other Buffer",
			},

			-- Delete Current Cuffer
			{
				"<leader>bk",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},

			-- Rename current file
			{
				"<leader>fR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},

			-- Navigate my buffers
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
				desc = "[P]Snacks picker buffers",
			},

			-- Show all Register
			{
				"<leader>yy",
				function()
					Snacks.picker.registers()
				end,
				desc = "Show all Possible commands",
			},

			-- Show all possible command
			{
				"<M-x>",
				function()
					Snacks.picker.commands()
				end,
				desc = "Show all Possible commands",
			},

			-- Terminal
			{
				"<leader>ot",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "Toggle Terminal",
			},

			-- Next word reference
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},

			-- Previous word reference
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},

		---@type snacks.Config
		opts = {
			notifier = {
				enabled = false,
				top_down = false, -- place notifications from top to bottom
			},

			---@class snacks.indent.Config
			---@field enabled? boolean
			indent = {
				priority = 1,
				enabled = true,
				char = "┆",
				only_scope = true,
				only_current = true,
			},

	-- 		dashboard = {
	-- 			preset = {
	-- 				keys = {
	-- 					{
	-- 						icon = " ",
	-- 						key = "f",
	-- 						desc = "Find File",
	-- 						action = ":lua Snacks.dashboard.pick('files')",
	-- 					},
	-- 					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
	-- 					{
	-- 						icon = " ",
	-- 						key = "g",
	-- 						desc = "Find Text",
	-- 						action = ":lua Snacks.dashboard.pick('live_grep')",
	-- 					},
	-- 					{
	-- 						icon = " ",
	-- 						key = "r",
	-- 						desc = "Recent Files",
	-- 						action = ":lua Snacks.dashboard.pick('oldfiles')",
	-- 					},
	-- 					{
	-- 						icon = " ",
	-- 						key = "c",
	-- 						desc = "Config",
	-- 						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
	-- 					},
	-- 					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
	-- 					-- { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
	-- 					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
	-- 				},
	-- 				header = [[
 --                                                                       
 --       ████ ██████           █████      ██                     
 --      ███████████             █████                             
 --      █████████ ███████████████████ ███   ███████████   
 --     █████████  ███    █████████████ █████ ██████████████   
 --    █████████ ██████████ █████████ █████ █████ ████ █████   
 --  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 -- ██████  █████████████████████ ████ █████ █████ ████ ██████ 
 --                                                                       
 --          ]],
	-- 			},
	-- 		},

			picker = {
				-- My ~/github/dotfiles-latest/neovim/lazyvim/lua/config/keymaps.lua
				-- file was always showing at the top, I needed a way to decrease its
				-- score, in frecency you could use :FrecencyDelete to delete a file
				-- from the database, here you can decrease it's score
				transform = function(item)
					if not item.file then
						return item
					end
					-- Demote the "lazyvim" keymaps file:
					if item.file:match("lazyvim/lua/config/keymaps%.lua") then
						item.score_add = (item.score_add or 0) - 30
					end
					-- Boost the "neobean" keymaps file:
					-- if item.file:match("neobean/lua/config/keymaps%.lua") then
					--   item.score_add = (item.score_add or 0) + 100
					-- end
					return item
				end,
				-- In case you want to make sure that the score manipulation above works
				-- or if you want to check the score of each file
				debug = {
					scores = true, -- show scores in the list
				},
				-- I like the "ivy" layout, so I set it as the default globaly, you can
				-- still override it in different keymaps
				layout = {
					preset = "ivy",
					-- When reaching the bottom of the results in the picker, I don't want
					-- it to cycle and go back to the top
					cycle = false,
				},
				layouts = {
					-- I wanted to modify the ivy layout height and preview pane width,
					-- this is the only way I was able to do it
					-- NOTE: I don't think this is the right way as I'm declaring all the
					-- other values below, if you know a better way, let me know
					--
					-- Then call this layout in the keymaps above
					-- got example from here
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
					-- I wanted to modify the layout width
					--
					vertical = {
						layout = {
							backdrop = false,
							width = 0.8,
							min_width = 80,
							height = 0.8,
							min_height = 30,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
						},
					},
				},
				matcher = {
					frecency = true,
				},
				win = {
					input = {
						keys = {
							-- to close the picker on ESC instead of going to normal mode,
							-- add the following keymap to your config
							["<Esc>"] = { "close", mode = { "n", "i" } },
							-- I'm used to scrolling like this in LazyGit
							["J"] = { "preview_scroll_down", mode = { "i", "n" } },
							["K"] = { "preview_scroll_up", mode = { "i", "n" } },
							["H"] = { "preview_scroll_left", mode = { "i", "n" } },
							["L"] = { "preview_scroll_right", mode = { "i", "n" } },
						},
					},
				},
			},
		},

		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
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
