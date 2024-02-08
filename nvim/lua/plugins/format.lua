return {
	{
		"mhartington/formatter.nvim",
		opts = function()
			local augroup = vim.api.nvim_create_augroup
			local autocmd = vim.api.nvim_create_autocmd
			augroup("__formatter__", { clear = true })
			autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})

			return {
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					rust = {
						require("formatter.filetypes.rust").rustfmt,
					},
					go = {
						function()
							local r = require("formatter.filetypes.go").goimports()
							r.args = { "-local", "github.com/xwjdsh" }
							return r
						end,
					},
					python = {
						require("formatter.filetypes.python").ruff,
					},
					javascript = {
						require("formatter.filetypes.javascript").prettier,
					},
					typescript = {
						require("formatter.filetypes.typescript").prettier,
					},
					json = {
						require("formatter.filetypes.json").prettier,
					},
					yaml = {
						require("formatter.filetypes.yaml").prettier,
					},
					toml = {
						require("formatter.filetypes.toml").taplo,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			}
		end,
	},
}
