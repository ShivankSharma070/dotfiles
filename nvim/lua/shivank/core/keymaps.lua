vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }
---------------------
-- General Keymaps -------------------
-- Greatest remap ever
keymap.set("v", "<leader>p", '"_dP')

-- use jk to exit insert mode and save the file
keymap.set("i", "jk", "<ESC>:update<cr>", opts)
keymap.set("i", "JK", "<ESC>:update<cr>", opts)

-- move line up or down in normal and insert mode, and selection in visual mode
keymap.set("i", "<M-j>", "<ESC>:m+<cr>==gi", opts)
keymap.set("i", "<M-k>", "<ESC>:m-2<cr>==gi", opts)
keymap.set("v", "<M-j>", ":'<,'>move '>+1<CR>gv=gv", opts)
keymap.set("v", "<M-k>", ":'<,'>move-2<CR>gv=gv", opts)
keymap.set("n", "<M-j>", ":m+<cr>==", opts)
keymap.set("n", "<M-k>", ":m-2<cr>==", opts)

-- keymap.set("i", "<ESC>", "<ESC>:update<cr>", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

vim.keymap.set("n", "J", "mzJ`z") -- Join below lien to current line and keep cursor in same position
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" }) 
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Bind control + space to insert new
keymap.set("i", "<C-RETURN>", "<ESC>o", { desc = "Inset line below" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- Navigate buffers with tab and shift tab
keymap.set("n", "<TAB>", ":bn!<CR>", opts)
keymap.set("n", "<S-TAB>", ":bp!<CR>", opts)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- some keymaps for deleting a word backwards
-- Some terminals, when send a C-BS, receives C-H, therefore have to remap both to in terminal as well as GUI
keymap.set("i", "<C-H>", "<C-w>")
keymap.set("i", "<C-BS>", "<C-w>")

-- start and end
-- keymap.set({ "n", "v" }, "H", "^")
-- keymap.set({ "n", "v" }, "L", "$")
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- split management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- tab managment
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Keep cursor centered while going through the search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Indent without selecting again and again
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- remember yanked
vim.keymap.set("v", "p", '"_dp', opts)

