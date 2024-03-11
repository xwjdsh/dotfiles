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
	},
	{
		"zapling/mason-conform.nvim",
		after = { "mason", "conform" },
		opts = {},
	},
}
