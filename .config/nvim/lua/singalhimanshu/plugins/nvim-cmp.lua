return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	priority = 100,
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		vim.snippet.expand = luasnip.lsp_expand

		---@diagnostic disable-next-line: duplicate-set-field
		vim.snippet.active = function(filter)
			filter = filter or {}
			filter.direction = filter.direction or 1

			if filter.direction == 1 then
				return luasnip.expand_or_jumpable()
			else
				return luasnip.jumpable(filter.direction)
			end
		end

		---@diagnostic disable-next-line: duplicate-set-field
		vim.snippet.jump = function(direction)
			if direction == 1 then
				if luasnip.expandable() then
					return luasnip.expand_or_jump()
				else
					return luasnip.jumpable(1) and luasnip.jump(1)
				end
			else
				return luasnip.jumpable(-1) and luasnip.jump(-1)
			end
		end

		vim.snippet.stop = luasnip.unlink_current

		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
		end, { silent = true })

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
				-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					{ "i", "c" }
				),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- code
				{ name = "orgmode" }, -- orgmode
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
