return {
	{
		"stevearc/conform.nvim",
		after = { "mason" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				toml = { "taplo" },
				go = { "goimports", "gofmt" },
				sh = { "shfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				goimports = {
					prepend_args = { "-local", "github.com/xwjdsh" },
				},
			},
		},
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format()
				end,
				desc = "format",
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		after = { "mason", "conform" },
		opts = {},
	},
}
