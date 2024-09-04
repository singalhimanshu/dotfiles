vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader><CR>", ":nohl<CR>", { desc = "Clear search highlights" })
-- keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "open netrw" })
keymap.set("n", "<TAB>", "%", { desc = "toggle bracket" })
keymap.set("n", "\\", "gt", { desc = "go to tab" })
