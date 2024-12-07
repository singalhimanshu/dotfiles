vim.g.mapleader = " "

local set = vim.keymap.set

set("n", "<leader><CR>", ":nohl<CR>", { desc = "Clear search highlights" })
set("n", "<TAB>", "%", { desc = "toggle bracket" })
set("n", "\\", "gt", { desc = "go to tab" })

set("n", "<leader>cc", ":vert :Compile<CR>", {desc = "compile"})
set("n", "<leader>'", ":vert :Recompile<CR>", {desc = "recompile"})

set("n", "<leader>wj", "<c-w><c-j>")
set("n", "<leader>wk", "<c-w><c-k>")
set("n", "<leader>wl", "<c-w><c-l>")
set("n", "<leader>wh", "<c-w><c-h>")
set("n", "<leader>wo", "<c-w><c-o>")

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")
