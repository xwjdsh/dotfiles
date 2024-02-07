require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"css",
		"vim",
		"lua",
		"javascript",
		"typescript",
		"go",
		"rust",
		"yaml",
		"json",
		"vimdoc",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
