return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
  -- Keybindings -> to surround -> ys + motion + character -> example ysiw"
  -- to remove surround -> ds + character -> ds"
  -- To change surround -> cs + oldchar + newChar 
  -- also works for html tag
}
