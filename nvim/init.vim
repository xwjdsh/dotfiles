" basic
lua require('basic')
" coc && extensions
lua require('coc')
let g:coc_global_extensions = ['coc-go', 'coc-git', 'coc-prettier']
" keymap
lua require('keybindings')
" packer plugins
lua require('plugins')
" plugins configs
lua require('plugins.nvim-tree')
lua require('plugins.bufferline')
lua require('plugins.catppuccin')
lua require('plugins.nvim-treesitter')
lua require('plugins.lualine')
lua require('plugins.nvim-autopairs')
lua require('plugins.neoscroll')

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
