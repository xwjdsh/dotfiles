"" ==== colorscheme ====
syntax enable
syntax on
set nu
set t_Co=256
set background=dark
colorscheme solarized
""===================="

set nocompatible              " be iMproved, required
hi Normal  ctermfg=252 ctermbg=none

filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'jiangmiao/auto-pairs'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'neomake/neomake'
"Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'johngrib/vim-game-code-break'
Plug 'sebdah/vim-delve'
" For gotests
Plug 'buoto/gotests-vim'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'

call plug#end()            " required

"set my leader
let mapleader=" "
let g:mapleader=" "

"switch buffer before write
set hidden

vnoremap <C-c> "+y
noremap <C-v> "+p

"show line number 
set number
"Show related row numbers
set relativenumber

" tab length  
set tabstop=2
set cindent shiftwidth=2
set autoindent shiftwidth=2 

"tabs
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>

"buffer
map <leader>bd :bd<cr>

" tab navigation like zsh
:nmap <leader>h :tabprevious<CR>
:map <leader>h :tabprevious<CR>
:nmap <leader>l :tabnext<CR>
:map <leader>l :tabnext<CR>

" buffer navigation like zsh
:nmap <leader>H :bp<CR>
:map <leader>H :bp<CR>
:nmap <leader>L :bn<CR>
:map <leader>L :bn<CR>

"switch window
:map <leader>w <C-W>w

" setting for golang
let g:go_fmt_command = "goimports"
let g:go_fmt_options = { 'goimports': '-local github.com/xwjdsh' }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_auto_sameids = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>g <Plug>(go-generate)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>v <Plug>(go-vet)
au FileType go nmap gd <Plug>(go-def-tab)
au FileType go nmap gr <Plug>(go-referrers)

"  setting for NERDTree
map <leader>f :NERDTreeToggle<CR>
let NERDChristmasTree=1
let g:NERDTreeWinSize = 25
" auto close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" set for air line
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'light'
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"Settings for TagBar
map <leader>g :TagbarToggle<CR>
let g:tagbar_width = 28
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Settings for vim-easymotion
let g:EasyMotion_leader_key = ","

" setting for vim-move
let g:move_key_modifier = 'C'

"For ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" for deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/Users/wendell/go/bin/gocode'
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#jedi#python_path = 'python3'

" for nerdcommenter
let g:NERDSpaceDelims = 1
