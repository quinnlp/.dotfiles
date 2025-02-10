-- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#-installation
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	init = function()
		-- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#-usage
		vim.cmd([[colorscheme tokyonight-storm]])
	end,
}
