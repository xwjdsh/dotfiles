"" ==== colorscheme ====
syntax enable
syntax on
set nu
set t_Co=256
set background=dark
colorscheme solarized
""===================="

set encoding=utf-8
set fileencoding=utf-8

set nocompatible              " be iMproved, required
hi Normal  ctermfg=252 ctermbg=none

" set hlsearch
" hi Search ctermbg=LightGray
" hi Search ctermfg=Red

filetype off                  " required

" install plug.vim automatically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'psliwka/vim-smoothie'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'neomake/neomake'
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

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
call plug#end()            " required

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

autocmd FileType go nmap gr <Plug>(go-referrers)
autocmd FileType go nmap gi <Plug>(go-implements)
autocmd FileType go nmap gc <Plug>(go-callers)

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
let g:statline_syntastic = 0

" setting for telescope
nnoremap <leader>sf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>sg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>sb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>sh <cmd>lua require('telescope.builtin').help_tags()<cr>

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

" for nerdcommenter
let g:NERDSpaceDelims = 1
