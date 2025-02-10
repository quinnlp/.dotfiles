-- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- https://lazy.folke.io/installation
require("config.lazy")

-- Enable line numbers by default
vim.opt.number = true

-- Always draw the signcolumn
vim.opt.signcolumn = 'yes'

-- Set miscellaneous mappings
require("mappings")
