vim.opt.termguicolors = true
require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		indicator = {
			icon = "🌈",
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

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = true,
})
-- color schema
vim.cmd([[colorscheme catppuccin]])

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
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
