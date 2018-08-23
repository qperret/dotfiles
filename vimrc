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

" Mouse control
set mouse=r

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

" Plugins - managed with vim-plug
call plug#begin('~/.vim/plugged')

" FZF
" Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
" Plug 'junegunn/fzf.vim'

" Fugitive
Plug 'tpope/vim-fugitive'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" NerdTREE
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
Plug 'qperret/badwolf'
Plug 'danilo-augusto/vim-afterglow'
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
hi ColorColumn cterm=NONE ctermbg=234 ctermfg=NONE

" Highlight search match
set hlsearch

" Cscope - inspired by the usual cscope_maps.vim
if has("cscope")
    " General config
    set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose

    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
 
    " Ctrl-l starts a search
    nmap <C-l>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-l>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-l>d :cs find d <C-R>=expand("<cword>")<CR><CR>
 
    " Ctrl-m splits the search vertically
    nmap <C-m>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-m>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-m>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " Ctrl-m TWICE splits the search horizontally
    nmap <C-m><C-m>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m><C-m>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m><C-m>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m><C-m>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m><C-m>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-m><C-m>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-m><C-m>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-m><C-m>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" Resize vsplit on window resize
autocmd VimResized * exe "normal! \<c-w>="

" GVim
if has("gui_running")
  set guifont=Fira\ Mono\ 9
  set mouse=a
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=e
endif
