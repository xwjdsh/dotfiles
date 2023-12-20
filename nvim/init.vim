" basic
lua require('basic')
" keymap
lua require('keybindings')


" plugins
call plug#begin('~/.config/nvim/pm')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'github/copilot.vim'
Plug 'karb94/neoscroll.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" plugins configs
lua require('plugins.comment')
lua require('plugins.nvim-tree')
lua require('plugins.bufferline')
lua require('plugins.catppuccin')
lua require('plugins.nvim-treesitter')
lua require('plugins.lualine')
lua require('plugins.nvim-autopairs')
lua require('plugins.neoscroll')
lua require('plugins.toggleterm')

" coc extensions
let g:coc_global_extensions = ['coc-go', 'coc-git', 'coc-prettier', 'coc-pyright', '@yaegassy/coc-ruff']
" coc-go
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" coc-pyright
autocmd BufWrite *.py :silent call CocAction('runCommand', 'python.sortImports')
