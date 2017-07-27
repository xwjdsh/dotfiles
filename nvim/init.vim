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
Plug 'fatih/vim-go'
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

" for ruby
Plug 'vim-ruby/vim-ruby'
call plug#end()            " required

"set my leader
"let mapleader="\<Space>"
"let g:mapleader="\<Space>"
let mapleader=" "
let g:mapleader=" "

"switch buffer before write
set hidden

set clipboard=unnamed

vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

"show line number 
set number
"Show related row numbers
set relativenumber"
"inoremap jj <Esc>

"tab length  
set tabstop=1 
set cindent shiftwidth=1  
set autoindent shiftwidth=1

"tabs
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>

"buffer
map <leader>bd :bd<cr>

" Tab move lines left or right (c-Ctrl,s-Shift)
nmap    <c-tab>     v>
nmap    <s-tab>     v<
vmap    <c-tab>     >gv
vmap    <s-tab>     <gv

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
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def-tab)

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
" show all time
set laststatus=2
" using it ,or dont work
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'light'
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

function! AccentDemo()
	  let keys = ['w','e','n','d','e','l','l','.']
		  for k in keys
				    call airline#parts#define_text(k, k)
						  endfor
						call airline#parts#define_accent('w', 'red')
						call airline#parts#define_accent('e', 'green')
						call airline#parts#define_accent('n', 'blue')
						call airline#parts#define_accent('d', 'yellow')
						call airline#parts#define_accent('e', 'orange')
						call airline#parts#define_accent('l', 'purple')
						call airline#parts#define_accent('l', 'bold')
						call airline#parts#define_accent('.', 'italic')
						let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()

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


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"autocmd! BufWritePost * Neomake
"let g:neomake_open_list = 1
"let g:neomake_error_sign = {'text': '>>', 'texthl': 'NeomakeErrorSign'}

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
"let g:syntastic_go_checkers = ['go', 'errcheck']

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" For deoplete-go
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#pointer = 1
