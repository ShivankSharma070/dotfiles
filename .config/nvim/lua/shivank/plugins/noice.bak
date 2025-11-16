-- return {
-- 	{
-- 		"folke/noice.nvim",
-- 		event = "VeryLazy",
-- 		enabled = true,
-- 		opts = {},
-- 		dependencies = {
-- 			"MunifTanjim/nui.nvim",
-- 			"rcarriga/nvim-notify",
-- 		},
-- 		config = function()
-- 			local noice = require("noice")
--
-- 			noice.setup({
-- 				cmdline = {
-- 					enabled = true,
-- 					view = "cmdline_popup",
-- 					format = {
-- 						cmdline = { pattern = "", icon = "󱐌 :", lang = "vim" },
-- 						help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰮦 :" },
-- 						filter = { pattern = "^:%s*!", icon = " $ :", lang = "bash" },
-- 						lua = {
-- 							pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
-- 							icon = "  :",
-- 							lang = "lua",
-- 						},
-- 						input = { view = "cmdline_input", icon = " 󰥻 :" }, -- Used by input()
-- 					},
-- 				},
-- 				views = {
-- 					popupmenu = {
-- 						relative = "editor",
-- 						position = {
-- 							row = 8,
-- 							col = "50%",
-- 						},
-- 						win_options = {
-- 							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
-- 						},
-- 					},
-- 					mini = {
-- 						size = {
-- 							width = "auto",
-- 							height = "auto",
-- 							max_height = 15,
-- 						},
-- 						position = {
-- 							row = -2,
-- 							col = "100%",
-- 						},
-- 					},
-- 				},
--
-- 				lsp = {
-- 					hover = {
-- 						enable = true,
-- 						opts = {
-- 							border = "rounded",
-- 						},
-- 					},
-- 					progress = {
-- 						enabled = true,
-- 					},
--                     signature = {
--                         enabled = true,
-- 						opts = {
-- 							border = "rounded",
-- 						},
--                     },
-- 					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
-- 					override = {
-- 						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 						["vim.lsp.util.stylize_markdown"] = true,
-- 						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
-- 					},
-- 				},
-- 				-- you can enable a preset for easier configuration
-- 				presets = {
-- 					bottom_search = true, -- use a classic bottom cmdline for search
-- 					command_palette = false, -- position the cmdline and popupmenu together
-- 					long_message_to_split = false, -- long messages will be sent to a split
-- 					inc_rename = false, -- enables an input dialog for inc-rename.nvim
-- 					lsp_doc_border = true, -- add a border to hover docs and signature help
-- 				},
-- 				routes = {
-- 					{
-- 						filter = {
-- 							event = "msg_show",
-- 							any = {
-- 								{ find = "%d+L, %d+B" },
-- 								{ find = "; after #%d+" },
-- 								{ find = "; before #%d+" },
-- 								{ find = "%d fewer lines" },
-- 								{ find = "%d more lines" },
-- 							},
-- 						},
-- 						opts = { skip = true },
-- 					},
-- 				},
--
-- 				messages = {
-- 					enabled = true,
-- 				},
--
-- 				health = {
-- 					checker = true,
-- 				},
--
-- 				popupmenu = {
-- 					enabled = false,
-- 				},
--
-- 				signature = {
-- 					enabled = true,
-- 				},
-- 			})
-- 		end,
-- 	},
-- }

return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        enabled = true,
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            local noice = require("noice")
            noice.setup({
                cmdline = {
                    enabled = false, -- Completely disable cmdline handling
                },
                messages = {
                    enabled = false, -- Disable message handling to avoid interference
                },
                popupmenu = {
                    enabled = false,
                },
                notify = {
                    enabled = true, -- Keep notifications
                },
 				lsp = {
 					hover = {
 						enable = true,
 						opts = {
 							border = "rounded",
 						},
 					},
 					progress = {
 						enabled = true,
 					},
                     signature = {
                         enabled = true,
 						opts = {
 							border = "rounded",
 						},
                     },
 					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
 					override = {
 						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
 						["vim.lsp.util.stylize_markdown"] = true,
 						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
 					},
 				},
                health = {
                    checker = false, -- Disable to avoid conflicts
                },
                -- Only route LSP messages to notifications
                routes = {
                    {
                        filter = {
                            event = "lsp",
                            kind = "progress",
                        },
                        view = "notify",
                    },
                },
            })
        end,
    },
}
