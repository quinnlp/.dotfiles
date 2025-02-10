-- https://github.com/zbirenbaum/copilot.lua?tab=readme-ov-file#setup-and-configuration
return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		-- https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#install
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
}
