vim.g.mapleader = " "

local set = vim.keymap.set

set("n", "<leader><CR>", ":nohl<CR>", { desc = "Clear search highlights" })
-- set("n", "<leader>e", ":Ex<CR>", { desc = "open netrw" })
set("n", "<TAB>", "%", { desc = "toggle bracket" })
set("n", "\\", "gt", { desc = "go to tab" })

set("n", "<leader>mm", ":make<CR>", { desc = "make make" })
set("n", "<leader>mb", ":make build<CR>", { desc = "make build" })
set("n", "<leader>mr", ":make run<CR>", { desc = "make run" })
set("n", "<leader>mt", ":make test<CR>", { desc = "make test" })
set("n", "<leader>mf", ":make format<CR>", { desc = "make format" })
set("n", "<leader>mc", ":make clean<CR>", { desc = "make clean" })

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")
