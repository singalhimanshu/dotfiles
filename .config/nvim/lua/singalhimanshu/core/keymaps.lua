vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader><CR>", ":nohl<CR>", { desc = "Clear search highlights" })
-- keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "open netrw" })
keymap.set("n", "<TAB>", "%", { desc = "toggle bracket" })
keymap.set("n", "\\", "gt", { desc = "go to tab" })

keymap.set("n", "<leader>mb", ":make build<CR>", { desc = "make build" })
keymap.set("n", "<leader>mr", ":make run<CR>", { desc = "make run" })
keymap.set("n", "<leader>mt", ":make test<CR>", { desc = "make test" })
keymap.set("n", "<leader>mf", ":make format<CR>", { desc = "make format" })
keymap.set("n", "<leader>mc", ":make clean<CR>", { desc = "make clean" })
