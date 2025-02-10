-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#lazynvim
return {
	"williamboman/mason-lspconfig.nvim",
	-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#setup
	dependencies = { "williamboman/mason.nvim" },
	opts = {
		-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#configuration
		ensure_installed = {
			"bashls",
			"clangd",
			"lua_ls",
			"pyright",
		},
	},
}
