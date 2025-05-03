-- This block below check of lazy installs as soom as neovim start
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- path to plugin folder
-- diable that annoying message that pops up whenever you change your configs
require("lazy").setup({ { import = "shivank.plugins" }, { import = "shivank.plugins.lsp"},{ import = "shivank.plugins.myColorschemes" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
