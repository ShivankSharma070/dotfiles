return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
}

-- 		-- configure svelte server
-- 		vim.lsp.config("svelte", {
-- 			capabilities = capabilities,
-- 			on_attach = function(client, bufnr)
-- 				vim.api.nvim_create_autocmd("BufWritePost", {
-- 					pattern = { "*.js", "*.ts" },
-- 					callback = function(ctx)
-- 						-- Here use ctx.match instead of ctx.file
-- 						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
-- 					end,
-- 				})
-- 			end,
-- 		})
-- 		-- configure graphql language server
-- 		vim.lsp.config("graphql", {
-- 			capabilities = capabilities,
-- 			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
-- 		})
-- 		-- configure emmet language server
-- 		vim.lsp.config("emmet_ls", {
-- 			capabilities = capabilities,
-- 			filetypes = {
-- 				"html",
-- 				"typescriptreact",
-- 				"javascriptreact",
-- 				"css",
-- 				"sass",
-- 				"scss",
-- 				"less",
-- 				"svelte",
-- 			},
-- 		})
-- 		-- configure lua server (with special settings)
-- 		vim.lsp.config("lua_ls", {
-- 			capabilities = capabilities,
-- 			settings = {
-- 				Lua = {
-- 					-- make the language server recognize "vim" global
-- 					diagnostics = {
-- 						globals = { "vim" },
-- 					},
-- 					completion = {
-- 				   callSnippet = "Replace",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
