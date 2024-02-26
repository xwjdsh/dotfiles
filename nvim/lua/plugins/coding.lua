return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{
				{
					"zbirenbaum/copilot-cmp",
					dependencies = "copilot.lua",
					opts = {},
					config = function(_, opts)
						local function lsp_on_attach(on_attach)
							vim.api.nvim_create_autocmd("LspAttach", {
								callback = function(args)
									local buffer = args.buf ---@type number
									local client = vim.lsp.get_client_by_id(args.data.client_id)
									on_attach(client, buffer)
								end,
							})
						end
						local copilot_cmp = require("copilot_cmp")
						copilot_cmp.setup(opts)
						-- attach cmp source whenever copilot attaches
						-- fixes lazy-loading issues with the copilot cmp source
						lsp_on_attach(function(client)
							if client.name == "copilot" then
								copilot_cmp._on_insert_enter({})
							end
						end)
					end,
				},
			},
		},
		opts = function()
			local cmp = require("cmp")
			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			return {
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					-- Copilot Source
					{ name = "copilot", group_index = 2 },
					-- Other Sources
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "path", group_index = 2 },
					{ name = "buffer", group_index = 2 },
					{ name = "luasnip", group_index = 2 },
				}),
			}
		end,
	},
	{
		"ray-x/go.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
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
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
		keys = {
			{ "<leader>i", "gg=G" },
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
}
