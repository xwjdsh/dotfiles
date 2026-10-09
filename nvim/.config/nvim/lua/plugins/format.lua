return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				toml = { "taplo" },
				go = { "goimports", "gofmt" },
				sh = { "shfmt" },
			},
			-- Only Go is formatted on save; other filetypes use <leader>fm.
			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft ~= "go" then
					return false
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
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
		dependencies = { "mason-org/mason.nvim", "stevearc/conform.nvim" },
		opts = {},
	},
}
