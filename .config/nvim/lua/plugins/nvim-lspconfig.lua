-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#quickstart
return {
	"neovim/nvim-lspconfig",
	-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#setup
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- https://github.com/hrsh7th/cmp-nvim-lsp?tab=readme-ov-file#setup
		"hrsh7th/cmp-nvim-lsp",
	},
	-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#quickstart
	init = function()
		-- https://github.com/hrsh7th/cmp-nvim-lsp?tab=readme-ov-file#setup
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig").bashls.setup({ capabilities = capabilities })
		require("lspconfig").clangd.setup({
			capabilities = capabilities,
			-- https://clangd.llvm.org/installation.html#neovim-built-in-lsp-client
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--log=verbose",
			},
			init_options = {
				fallbackFlags = { "-std=c++17" },
			},
		})
		require("lspconfig").lua_ls.setup({ capabilities = capabilities })
		require("lspconfig").pyright.setup({ capabilities = capabilities })
		-- Define keybindings for lsp commands
		vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration of symbol" })
		vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition of symbol" })
		vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", { desc = "Get implementations of symbol" })
		vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", { desc = "Get references to symbol" })
		vim.keymap.set("n", "<leader>fm", "<CMD>lua vim.lsp.buf.format()<CR>", { desc = "Format buffer" })
		vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "Rename references to symbol" })
	end,
}
