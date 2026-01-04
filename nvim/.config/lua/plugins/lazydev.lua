-- https://github.com/folke/lazydev.nvim?tab=readme-ov-file#-installation
return {
	"folke/lazydev.nvim",
    	ft = "lua",
	opts = {
      		library = {
       	 		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
      		},
    	},
}
