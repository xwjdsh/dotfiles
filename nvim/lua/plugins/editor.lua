return {
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		opts = {},
		keys = {
			{ "<leader>f", ":NvimTreeToggle<CR>" },
		},
	},
	{
		"stevearc/aerial.nvim",
		opts = {
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		},
		keys = {
			{ "<leader>G", "<cmd>AerialToggle<CR>" },
		},
	},
	{
		"folke/flash.nvim",
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<c-p>", ":FzfLua files<CR>" },
			{ "<c-g>", ":FzfLua grep<CR>" },
			{ "<leader>l", ":FzfLua buffers<CR>" },
			{ "<leader>g", ":FzfLua git_status<CR>" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					toml = { "taplo" },
					go = { "goimports", "gofmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
			conform.formatters.goimports = {
				prepend_args = { "-local", "github.com/xwjdsh" },
			}
		end,
	},
}
