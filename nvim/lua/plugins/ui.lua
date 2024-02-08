vim.opt.termguicolors = true
require("bufferline").setup({
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

require("tokyonight").setup({
	style = "moon",
	transparent = true,
	transparent_sidebar = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})
-- color schema
vim.cmd([[colorscheme tokyonight]])

require("lualine").setup({
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
})

require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
})
