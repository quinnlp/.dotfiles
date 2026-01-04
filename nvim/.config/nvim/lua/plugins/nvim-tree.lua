-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation#lazy
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	init = function()
		-- Toggle nvimtree window
		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree window" })
	end,
}
