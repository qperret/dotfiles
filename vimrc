" Show some stuffs
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [({})]
set laststatus=2        " always display status line
set nocompatible        " Entering in vim mode, not plain vi
set encoding=utf-8

" Filetype plugins
filetype plugin on
filetype indent on

" Default tabs and spaces - Linux Kernel style
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

" Tabs and spaces for Python
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Flag unnecessary whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Search
set ignorecase
set smartcase

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

" Toogle paste mode to avoid re-indenting
set pastetoggle=<F10>

" CDC = Change to Directory of Current file
command CDC lcd %:p:h

" // to search next occurence of currently highlighted stuff
vnoremap // y/\V<C-R>"<CR>

" Clear highlighting on escape in normal mode
" nnoremap <esc> :noh<return><esc>
" nnoremap <esc>^[ <esc>^[

" Color scheme
set t_Co=256
colorscheme murphy
set background=dark

syntax on
" Higlight 80th column
set colorcolumn=80
hi ColorColumn cterm=NONE ctermbg=234 ctermfg=NONE

" Highlight search match
set hlsearch
