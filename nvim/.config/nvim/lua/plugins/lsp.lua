local ls = {
	lua_ls = {
		on_init = function(client)
			local folders = client.workspace_folders
			if not folders then
				return true
			end
			local path = folders[1].name
			if not vim.uv.fs_stat(path .. "/.luarc.json") and not vim.uv.fs_stat(path .. "/.luarc.jsonc") then
				client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				})

				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end
			return true
		end,
	},
	gopls = {},
	pyright = {},
	bashls = {},
	jsonls = {},
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason-lspconfig.nvim" },
		config = function()
			-- Configure and enable servers (Neovim 0.11+ API; nvim-lspconfig supplies defaults).
			for name, opts in pairs(ls) do
				vim.lsp.config(name, opts)
				vim.lsp.enable(name)
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
			vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>F", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(ls),
				-- servers are enabled explicitly via vim.lsp.enable above
				automatic_enable = false,
			})
		end,
	},
}
