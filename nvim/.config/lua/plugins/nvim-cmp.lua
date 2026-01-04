-- https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#recommended-configuration
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- https://github.com/onsails/lspkind.nvim?tab=readme-ov-file#option-2-nvim-cmp
		"onsails/lspkind.nvim",
	},
	init = function()
		local cmp = require("cmp")
		-- https://github.com/onsails/lspkind.nvim?tab=readme-ov-file#option-2-nvim-cmp
		local lspkind = require("lspkind")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				-- https://github.com/folke/lazydev.nvim?tab=readme-ov-file#-installation
				{ name = "lazydev" },
			}, {
				-- https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#source-definition
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
			-- https://github.com/onsails/lspkind.nvim?tab=readme-ov-file#option-2-nvim-cmp
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = {
						menu = 50,
						abbr = 50,
					},
					ellipsis_char = "...",
					show_labelDetails = true,
					before = function(_, vim_item)
						return vim_item
					end,
					-- https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#highlighting--icon
					max_width = 50,
					symbol_map = { Copilot = "" },
				}),
				-- Columns of the completion window
				fields = {
					"kind",
					"abbr",
				},
				-- Show the expandable indicator
				expandable_indicator = true,
			},
		})
		cmp.setup.cmdline({
			"/",
			"?",
		}, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = {
				disallow_symbol_nonprefix_matching = false,
				-- Allow full-fuzzy matching
				disallow_fullfuzzy_matching = false,
				-- Allow fuzzy matching
				disallow_fuzzy_matching = false,
				-- Allow partial fuzzy matching
				disallow_partial_fuzzy_matching = false,
				-- Allow partial matching
				disallow_partial_matching = false,
				-- Allow prefix unmatching
				disallow_prefix_unmatching = false,
			},
		})
	end,
}
