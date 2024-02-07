-- basic
require("basic")
-- keymap
require("keybindings")

local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/pm")

-- lsp
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

-- completion
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

Plug("ray-x/go.nvim")
Plug("ray-x/guihua.lua")

Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })

Plug("akinsho/bufferline.nvim")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-lualine/lualine.nvim")
Plug("windwp/nvim-autopairs")
Plug("numToStr/Comment.nvim")
Plug("ibhagwan/fzf-lua", { ["branch"] = "main" })
Plug("github/copilot.vim")
Plug("karb94/neoscroll.nvim")
Plug("akinsho/toggleterm.nvim")
Plug("junegunn/fzf.vim")
Plug("mhartington/formatter.nvim")

vim.call("plug#end")

-- plugins configs
require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.catppuccin")
require("plugins.nvim-treesitter")
require("plugins.lualine")
require("plugins.nvim-autopairs")
require("plugins.neoscroll")
require("plugins.toggleterm")
require("plugins.go")
require("plugins.formatter")
require("plugins.nvim-cmp")
-- put lsp after cmp
require("plugins.lsp")
