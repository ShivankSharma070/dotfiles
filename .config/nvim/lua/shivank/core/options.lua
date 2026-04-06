-- using tree style view by default
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false -- disable line wrapping
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = false -- highlight the current cursor line
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.wildignore:append({ "*/node_modules/*" })
opt.title = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.backupcopy = "yes"
opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 3
opt.scrolloff = 10
opt.shell = "fish"
vim.o.winborder = "rounded"
opt.smarttab = true
opt.breakindent = true
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.splitkeep = "cursor"
opt.undofile = true
-- opt.guicursor = "a:block"
-- opt.textwidth = 80
opt.wrap = true
opt.colorcolumn = "80"
opt.guicursor = {
	"n-v-c-sm:block-nCursor",
	"i-ci-ve:block-iCursor",
	"r-cr-o:block-rCursor",
}
-- Above option applies the setting to ALL file types, if you want to apply it
-- to specific files only
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   -- pattern = {"python", "javascript", "html"},
--   callback = function()
--     vim.opt_local.textwidth = 80
--   end,
-- })

-- Setting for neovide
if vim.g.neovide then
	vim.o.guifont = "JetBrains Mono Light:h10"
	--	vim.o.guifont = "IBM Plex Mono:h12:w0.3"
	vim.opt.linespace = 0
	vim.opt.cursorline = false
	vim.opt.cmdheight = 1
	vim.opt.guicursor = "n-v-c-o:block,i-ci-ve:ver15,r-cr:hor10"
	-- vim.opt.guicursor = {
	-- 	"n-v-c-sm:block-nCursor",
	-- 	"i-ci-ve:block-iCursor",
	-- 	"r-cr-o:block-rCursor",
	-- }
	vim.g.neovide_scale_factor = 1
	vim.g.neovide_padding_top = 1
	vim.g.neovide_floating_corner_radius = 0.8
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0.2
	vim.api.nvim_set_keymap(
		"n",
		"<C-+>",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-->",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
