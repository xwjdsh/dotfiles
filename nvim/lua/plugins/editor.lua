require("toggleterm").setup({})
require("neoscroll").setup()
require("Comment").setup()
require("nvim-tree").setup({
	git = {
		enable = false,
	},
})
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
