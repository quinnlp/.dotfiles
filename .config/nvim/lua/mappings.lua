-- Switch windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- Toggle number options
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
vim.keymap.set("n", "<leader>N", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")

-- Comment and uncomment lines
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- View diagnostic
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
