-- https://github.com/NeogitOrg/neogit?tab=readme-ov-file#installation
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	-- disable buggy context highlighting
	opts = { disable_context_highlighting = true },
}
