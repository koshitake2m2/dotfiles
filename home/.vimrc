" setting "

" title "
set title
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"

" encode "
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" mouse "
set mouse=a
" alias "
let $BASH_ENV="~/.bashrc"
" ctags 
set tags=./tags
nnoremap <C-]> g<C-]>

" { } "
set showmatch

" color "
syntax on

" line "
set number
" set cursorline
set virtualedit=onemore
" set scrolloff "
set scrolloff=5
" set backspace "
set backspace=indent,eol,start
" set hlsearch
set hlsearch

" indent "
set expandtab
set tabstop=4
set smartindent
set autoindent
set shiftwidth=4

" key map "
" inoremap <ESC> <ESC>:set iminsert=2<CR>

" normal mode & visual mode --------------------------
noremap <C-h> <BS>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap sh <C-w>h 
noremap sj <C-w>j 
noremap sk <C-w>k 
noremap sl <C-w>l 
noremap sw <C-w>w 

" \n "
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" end normal mode & visual mode --------------------------


" insert mode ----------------------
inoremap jj <Esc>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <S-Tab> <BS><BS><BS><BS>
" inoremap <Tab> <C-n>
" inoremap <S-Tab> <C-p>

" insert mode mac-like "
inoremap <C-p> <C-o>gk
inoremap <C-n> <C-o>gj
inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>l
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-d> <C-o>x
inoremap <C-k> <C-o>d$
inoremap <C-y> <C-o>p

" end insert mode =====================

" command-line mode ------------
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" end command-line mode ========

" command "
command Hello echo 'hello, world!'
