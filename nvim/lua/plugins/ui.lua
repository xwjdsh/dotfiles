return {
	{
		"akinsho/bufferline.nvim",
		opts = {
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
		},
		keys = {
			{ "<C-h>", ":BufferLineCyclePrev<CR>" },
			{ "<C-l>", ":BufferLineCycleNext<CR>" },
			{ "<C-x>", ":BufferLinePickClose<CR>" },
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				transparent_sidebar = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		},
	},
	{
		"echasnovski/mini.indentscope",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
	},
}
