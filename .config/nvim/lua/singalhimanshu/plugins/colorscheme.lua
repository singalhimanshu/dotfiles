return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1,
		config = function()
			-- local bg = "#011628"
			-- local bg_dark = "#011423"
			-- local bg_highlight = "#143652"
			-- local bg_search = "#0A64AC"
			-- local bg_visual = "#275378"
			-- local fg = "#CBE0F0"
			-- local fg_dark = "#B4D0E9"
			-- local fg_gutter = "#627E97"
			-- local border = "#547998"
			--
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})

			-- load the colorscheme here
			-- vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme carbonfox]])
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		priority = 1,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme github_dark_default]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- load the colorscheme here
			require("gruvbox").setup({
				contrast = "hard",
			})
			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"css",
				"javascript",
				"markdown",
				html = {
					mode = "foreground",
				},
			})
		end,
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
		priority = 1000,
		config = function()
			require("no-clown-fiesta").setup({})
			vim.cmd([[colorscheme no-clown-fiesta]])
		end,
		lazy = false,
	},
}
