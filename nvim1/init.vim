" 基础配置
lua require('basic')
" 快捷键映射
lua require('keybindings')
" Packer插件管理
lua require('plugins')
" 插件配置
lua require('plugins.nvim-tree')
lua require('plugins.bufferline')
lua require('plugins.nord')
lua require('plugins.nvim-treesitter')
lua require('plugins.lualine')
lua require('plugins.nvim-autopairs')
lua require('plugins.neoscroll')
lua require('plugins.lsp_signature')
" lsp
lua require('lsp/setup')
lua require('lsp/nvim-cmp')

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)
