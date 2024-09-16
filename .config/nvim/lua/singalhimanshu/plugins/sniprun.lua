return {
	"michaelb/sniprun",
	branch = "master",

	build = "sh install.sh",
	-- do 'sh install.sh 1' if you want to force compile locally
	-- (instead of fetching a binary from the github release). Requires Rust >= 1.65

	config = function()
		require("sniprun").setup({
			-- your options
		})
    vim.api.nvim_set_keymap('v', 's', '<Plug>SnipRun', {silent = true})
    vim.api.nvim_set_keymap('n', '<leader>rf', ':% SnipRun<CR>', {silent = true})
    vim.api.nvim_set_keymap('n', '<leader>rl', ':SnipRun<CR>', {silent = true})
    vim.api.nvim_set_keymap('n', '<leader>rc', '<Plug>SnipClose', {silent = true})
	end,
}
