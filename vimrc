" Show some stuffs
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [({})]
set laststatus=2        " always display status line

" Colors
set nocompatible        " Entering in vim mode, not plain vi

" Filetype plugins
filetype plugin on
filetype indent on

" Tabs and spaces
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " when indenting with '>', use 4 spaces width
set expandtab           " tabs are spaces (good for python)

" Search
set ignorecase
set smartcase

" Mouse control
set mouse=a

" Word wrapping
set wrap lbr

" Cursor within long lines
nnoremap <Down> gj
vnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Up> gk

" Navigation between tabs
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>
nnoremap <F6> :tabnew<CR>
inoremap <F7> <Esc>:tabprevious<CR>i
inoremap <F8> <Esc>:tabnext<CR>i
inoremap <F6> <Esc>:tabnew<CR>

" CDC = Change to Directory of Current file
command CDC lcd %:p:h

" Plugins - managed with vim-plug
call plug#begin('~/.vim/plugged')

" FZF
" Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
" Plug 'junegunn/fzf.vim'

" NerdTREE
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'vim-scripts/wombat256.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'gosukiwi/vim-atom-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
call plug#end()

" Color scheme
set t_Co=256
colorscheme badwolf
" set background=dark

" Airline
let g:airline_theme='afterglow'
let g:airline_left_sep=''
let g:airline_right_sep=''

syntax on
" Higlight 80th column
set colorcolumn=80
hi ColorColumn   cterm=NONE ctermbg=234 ctermfg=NONE     

" Resize vsplit on window resize
autocmd VimResized * exe "normal! \<c-w>="
