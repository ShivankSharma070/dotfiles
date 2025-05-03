return {
  "szw/vim-maximizer",
  -- Keys allows to lazy load a plugin, this plugin in only loaded when this specific keybindings is used. 
  keys = {
    { "<leader>wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
