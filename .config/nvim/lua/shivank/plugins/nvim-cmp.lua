-- auto completion module for nvim
return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		-- ── Main setup ────────────────────────────────────────────────────────
		cmp.setup({
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
				}),
			},
			completion = {
				completeopt = "menu,menuone,preview",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 100,
					ellipsis_char = "...",
				}),
			},
			-- experimental = {
			-- 	ghost_text = {
			-- 		hl_group = "CmpGhostText",
			-- 	},
			-- },
		})

		-- ── Search completion ( / ) ───────────────────────────────────────────
		-- NOTE: must be outside cmp.setup(), not nested inside it
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- ── Command-line completion ( : ) ─────────────────────────────────────
		cmp.setup.cmdline(":", {

			mapping = cmp.mapping.preset.cmdline({
				["<C-k>"] = { c = cmp.mapping.select_prev_item() },
				["<C-j>"] = { c = cmp.mapping.select_next_item() },
				["<C-Space>"] = { c = cmp.mapping.complete() },
				["<C-e>"] = { c = cmp.mapping.abort() },
			}),
			completion = {
				completeopt = "menu,menuone,preview",
			},
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man" },
					},
				},
			}),
		})
	end,
}
