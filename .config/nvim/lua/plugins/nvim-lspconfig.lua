-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#quickstart
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	init = function()
		-- https://github.com/hrsh7th/cmp-nvim-lsp?tab=readme-ov-file#setup
		vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
		vim.lsp.config("clangd", {
			-- https://clangd.llvm.org/installation.html#neovim-built-in-lsp-client
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--log=verbose",
			},
			init_options = {
				fallbackFlags = { "-std=c++20" },
			},
		})
		vim.lsp.enable("bashls")
		vim.lsp.enable("clangd")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("pyright")

		-- Define keybindings for lsp commands
		vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>",
			{ desc = "Go to declaration of symbol" })
		vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>",
			{ desc = "Go to definition of symbol" })
		vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>",
			{ desc = "Get implementations of symbol" })
		vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>",
			{ desc = "Get references to symbol" })
		vim.keymap.set("n", "<leader>fm", "<CMD>lua vim.lsp.buf.format()<CR>",
			{ desc = "Format buffer" })
		vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>",
			{ desc = "Rename references to symbol" })
	end,
}
