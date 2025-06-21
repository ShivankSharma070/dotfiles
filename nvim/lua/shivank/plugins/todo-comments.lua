return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  optional = true,
  config = function()
    local todo_comments = require("todo-comments")
    -- TODO:  Example todo
    -- HACK: 
    -- BUG:

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

			keymap.set("n","<leader>ft",
				function()
					Snacks.picker.todo_comments({
						exclude = { "/node_modules/", "/.dropbox/", "/.local/", "/.cache/"},
						supports_live = true,
        })
				end,
      {desc = "Todo"}
    )
    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
