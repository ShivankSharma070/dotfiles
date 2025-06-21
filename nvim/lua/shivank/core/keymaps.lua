vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }
---------------------
-- General Keymaps -------------------
-- Greatest remap ever
keymap.set("v", "<leader>p", '"_dP')


-- use jk to exit insert mode and save the file
keymap.set("i", "jK", "<ESC>:update<CR>", opts)
keymap.set("i", "Jk", "<ESC>:update<CR>", opts)
keymap.set("i", "jk", "<ESC>:update<CR>", opts)
keymap.set("i", "JK", "<ESC>:update<CR>", opts)

-- move line up or down in normal and insert mode, and selection in visual mode
keymap.set("i", "<M-j>", "<ESC>:m+<cr>==gi", opts)
keymap.set("i", "<M-k>", "<ESC>:m-2<cr>==gi", opts)
keymap.set("v", "<M-j>", ":'<,'>move '>+1<CR>gv=gv", opts)
keymap.set("v", "<M-k>", ":'<,'>move-2<CR>gv=gv", opts)
keymap.set("n", "<M-j>", ":m+<cr>==", opts)
keymap.set("n", "<M-k>", ":m-2<cr>==", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

vim.keymap.set("n", "J", "mzJ`z") -- Join below lien to current line and keep cursor in same position
vim.keymap.set("n", "<C-d>", "10jzz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "10kzz", { desc = "move up in buffer with cursor centered" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- some keymaps for deleting a word backwards
-- Some terminals, when send a C-BS, receives C-H, therefore have to remap both to in terminal as well as GUI
keymap.set("i", "<C-H>", "<C-w>")
keymap.set("i", "<C-BS>", "<C-w>")

-- start and end
keymap.set({ "n", "v" }, "H", "^")
keymap.set({ "n", "v" }, "L", "$")
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- split management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Start Oil in current working directory." })
vim.keymap.set('n', '<leader>tf', '<cmd>GoTestFunc -v<cr>', opts)

-- Keep cursor centered while going through the search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Indent without selecting again and again
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- remember yanked
vim.keymap.set("v", "p", '"_dp', opts)

