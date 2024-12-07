local opt = vim.opt

opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 2
opt.concealcursor = 'nc'
-- opt.shellslash = true

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- opt.autochdir = true

opt.wrap = false -- disable line wrapping

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- highlight the current cursor line

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.makeprg = "make"
opt.errorformat = "%f:%l:%c: %m"

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = { "[^l]*" },
  callback = function()
    vim.cmd("cwindow")
  end,
})

