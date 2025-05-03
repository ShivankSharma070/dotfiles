return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" }, -- New file or a existing file
  build = ":TSUpdate", 
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        -- WEB DEVELOPMENT  related stuff
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "gitignore",
        "query",
        "svelte",
        "graphql",
        
        -- Some programming languages I use
        "c",
        "cpp",
        "go",
        "python",
        "sql",

        -- miscellaneous
        "vimdoc",
        "bash",
        "fish",
        "haskell",
        "toml",
        "lua", -- for neovim
        "vim", -- for vim

      },
      -- Selection increses every time user hit the keybinding
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-space>",
          node_incremental = "<M-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
