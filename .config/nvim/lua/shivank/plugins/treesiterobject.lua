return {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        init = function()
          -- Disable entire built-in ftplugin mappings to avoid conflicts.
          -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
          vim.g.no_plugin_maps = true

          -- Or, disable per filetype (add as you like)
          -- vim.g.no_python_maps = true
          -- vim.g.no_ruby_maps = true
          -- vim.g.no_rust_maps = true
          -- vim.g.no_go_maps = true
        end,
        config = function()
          require('nvim-treesitter-textobjects').setup {
            select = {
              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,
            },
          }

          -- select
          vim.keymap.set({ 'x', 'o' }, 'af', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'if', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ac', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ic', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
          end)
          -- You can also use captures from other query groups like `locals.scm`
          vim.keymap.set({ 'x', 'o' }, 'as', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
          end)
        end
    }

