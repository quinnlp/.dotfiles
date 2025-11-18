-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#lazynvim
return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"bashls",
			"clangd",
			"lua_ls",
			"pyright",
		},
	},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
