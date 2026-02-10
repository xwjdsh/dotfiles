return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "catppuccin/nvim" },
		config = function()
			require("bufferline").setup({
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				options = {
					indicator = {
						icon = "🐱",
						style = "icon",
					},
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "catppuccin",
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{ "<leader>f", ":NvimTreeToggle<CR>", desc = "nvim tree" },
		},
	},
	{
		"echasnovski/mini.starter",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			width = 10,
		},
	},
}
