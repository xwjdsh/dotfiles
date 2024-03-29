return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"html",
				"css",
				"vim",
				"lua",
				"javascript",
				"typescript",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"rust",
				"yaml",
				"json",
				"toml",
				"vimdoc",
				"python",
				"php",
				"dockerfile",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
