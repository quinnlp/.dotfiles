-- https://github.com/nyoom-engineering/oxocarbon.nvim?tab=readme-ov-file#lazynvim
return {
	"nyoom-engineering/oxocarbon.nvim",
	-- https://github.com/nyoom-engineering/oxocarbon.nvim?tab=readme-ov-file#usage
	init = function()
		vim.opt.background = "dark"
		vim.cmd("colorscheme oxocarbon")
	end,
}
